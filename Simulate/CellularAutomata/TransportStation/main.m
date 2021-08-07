%   iterations      =  迭代次数即计算次数     100
%   B               =  收费站的个数     定义的了是12个
%   L               =  车道数            6
%   Arrival         =  平均车流量
%   plazalength     =  收费区长度   101  但是这个是什么意思呢
%   Service         =  服务率         0.8
%   dt              =  时间步长   
%   plaza           =  收费区矩阵  
%                              1 = 有车, 0 =为空, -1 = 禁止, -3 = 收费站
%   v               =  速度矩阵  
%   vmax            =  最大速度
%   time            =  时间矩阵
%   t_h             =  时间因素
%   departurescount =  在一次计算中流出的车数
%   departurestime  =  流出的车经过收费区所花费的时间
%   influx          =  进车矢量
%   outflux         =  出车矢量
%   timecost        =  所有车辆花费的时间
%   h               =  句柄
clear;clc;
iterations = 100; % 迭代次数即计算次数
B = 12; % 收费站的个数
L = 6; % 车道数
Arrival=4; % 平均车流量

plazalength = 101; % 收费区长度  
[plaza, v, time] = create_plaza(B, L, plazalength);%子函数1构建收费区矩阵     
h = show_plaza(plaza, NaN, 0.01);%子函数2将收费区矩阵转换为图片（NaN任意值）

Service = 0.8; % 服务率
dt = 0.2; % 时间步长
t_h = 1; % 时间因素
vmax = 5; % 最大速度
influx=[];%不同
outflux=[];%不同

timecost = [];
for i = 1:iterations
    % 进车
    [plaza, v, arrivalscount] = new_cars(Arrival, dt, plaza, v, vmax);
    %子函数3进车
    h = show_plaza(plaza, h,1);%更新   对图形 的 
    % 规则
    [plaza, v, time] = switch_lanes(plaza, v, time); % 子函数4换道规则
    [plaza, v, time] = move_forward(plaza, v, time, vmax); % 子函数5前进规则
    [plaza, v, time, departurescount, departurestime] = clear_boundary(plaza, v, time);
    %子函数6计算流出的车数以及所花费的时间
    % 计算流量
    influx(i) = arrivalscount;%进车流量
    outflux(i) = departurescount;%出车流量
    timecost = [timecost, departurestime];%所有车辆花费的时间
end
h = show_plaza(plaza, h, 1);
xlabel({strcat('B = ',num2str(B)), ...
strcat('mean cost time = ', num2str(round(mean(timecost))))})