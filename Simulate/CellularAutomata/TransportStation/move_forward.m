function [plaza, v, time] = move_forward(plaza, v, time, vmax)
% move_forward   按NS规则前进
% 1.加速，k车的车距大于单位时间内通过的距离 & 加速之后速度小于最大速度&一定概率
% 2. 减速，k车的车距小于单位时间内通过的距离 & 减速之后速度大于零 一定减速
% 3. 一定几率随机慢化
% 4. 进出收费站
%        plaza = 收费区矩阵
%                1 = 有车, 0 = 为空, -1 = 禁止, -3 = 收费站
%        v = 速度矩阵
%        time = 时间矩阵
%        vmax = 最大速度
Service = 0.8; % 服务率   exp(-Service*dt）
dt = 0.2; %时长
probac = 0.7;% 加速概率
probdc = 1;% 减速的可能性
probrd = 0.3;% 随机减速的可能性
t_h = 1; % 时间因素
[L,W] = size(plaza);% 构建（i，j）位置的距离矩阵
gap = zeros(L,W);
f = find(plaza==1);%找到收费区中有车的位置并记录
for k=f'
    [i,j] = ind2sub([L,W], k);%将矩阵中k位置，用[i,j]表示
    d = plaza(i+1:end, j);%距离
    gap(k) = min( find([d~=0;1]) )-1;%找到k车前方最近（min）的不为零的元胞，测距；find([d~=0;1]查
end
gap(end,:) = 0;%最后一行距离为0 

%% 速度更新规则
% 1 加速：间隔大于速度
k = find((gap(f) > v(f)*t_h) & (v(f) + 1 <= vmax) & (rand(size(f)) <= probac));%gap(f)到前面车的距离
v(f(k)) = v(f(k)) + 1;
% 2 排除碰撞
k = find((v(f)*t_h > gap(f)) & (rand(size(f)) <= probdc));
v(f(k)) = gap(f(k))/t_h;
% 3 随机减速
k = find(rand(size(f)) <= probrd);
v(f(k)) = max(v(f(k)) - 1,0);
% 进出收费站
%% 收费亭
booth_row = ceil(L/2);%找到收费区的位置
for i = 2:W-1  
    if (plaza(booth_row,i) ~= 1)%如果该收费站没车
        if (plaza(booth_row-1,i) == 1)%如果收费站之前有车
            v(booth_row - 1 ,i) = 1;%该车速度为1
        end
        plaza(booth_row,i) = -3;
    else % 收费站有车辆
        if (plaza(booth_row+1,i) ~= 1)&(rand > exp(-Service*dt))%如果收费站之后没车，并且被服务过
            v(booth_row,i) = 1; % 出站
        else
            v(booth_row,i) = 0;
        end
     end
end
%% 状态更新
plaza(f) = 0;
plaza(f+v(f)) = 1;

time(f + v(f)) = time(f) + 1;
time(plaza~=1) = 0;

v(f + v(f)) = v(f);
v(plaza~=1)=0;