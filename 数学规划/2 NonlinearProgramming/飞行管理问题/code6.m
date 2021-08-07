%% 飞行管理问题
format long g
%%  （1）画六架飞机的位置
clear;clc
figure(1)  % 生成一个图形
box on  % 显示为封闭的盒子




% 绘制飞机的初始位置
data = [
	150	140	243;
    85	85	236;
    150	155	220.5;
    145	50	159;
    130	150	230;
    0	0	52
];






plot(data(:,1) , data(:,2) , '.r') %只绘制 x，y

axis([0 160,0,160]);% 设置坐标轴刻度范围

hold on;


% 在图上标上注释
for i = 1:6
    txt = ['飞机',num2str(i)];
    text(data(i,1)+2,data(i,2)+2,txt,'FontSize',8)
end

% 把 Matlab 做出来的图可以导出，然后再放到PPT中画出飞机飞行方向的箭头（就和讲义上的类似）

%% 求解非线性规划问题
x0 = [0 0 0 0 0 0];  % 初始值

lb = -pi/6 * ones(6,1);
ub = pi/6 * ones(6,1);

[x,fval] = fmincon(@fun6,x0,[],[],[],[],lb,ub,@nonlfun6)

x = x * 180 / pi    % 将弧度转换为度数

% 定义一：fval = 3.7315° 
% 定义二:  fval = 6.9547((°)^2)

