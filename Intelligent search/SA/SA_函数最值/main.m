% SA 模拟退火: 求解函数y = 11*sin(x) + 7*cos(5*x)在[-3,3]内的最大值(动画演示）
clear; clc

%% 绘制函数的图形
x = -3:0.1:3;
y = 11*sin(x) + 7*cos(5*x);
figure(1)
plot(x,y,'c0-')
hold on  % 不关闭图形，继续在上面画图

%% 参数初始化
narvs = 1; % 变量个数
T0 = 100;   % 初始温度
T = T0; % 迭代中温度会发生改变，第一次迭代时温度就是T0
MX = 200;  % 最大迭代次数
Lk = 100;  % 每个温度下的迭代次数
alfa = 0.95;  % 温度衰减系数
x_lb = -3; % x的下界
x_ub = 3; % x的上界

%  随机生成一个初始解
x0 = x_lb + (x_ub - x_lb)*rand(1,narvs);
h = scatter(x0,fun(x0),'*r');  % scatter是绘制二维散点图的函数（这里返回h是为了得到图形的句柄，未来我们对其位置进行更新）

% 初始化用来保存中间结果的x和y的取值
iter_x = x0;
iter_y = fun(x0);

% 模拟退火过程

for iter = 1 : MX  % 外循环, 我这里采用的是指定最大迭代次数
    for i = 1 : Lk  % 内循环，在每个温度下开始迭代
        y0 = fun(x0); % 计算当前解的函数值
        y = randn(1,narvs);  % 生成1行narvs列的N(0,1)随机数
        z = y / sqrt(sum(y.^2)); % 根据新解的产生规则计算z
        x_new = x0 + z*T; % 根据新解的产生规则计算x_new的值
        
        % 如果这个新解的位置超出了定义域，就对其进行调整
        for j = 1: narvs
            if x_new(j) < x_lb(j)
                r = rand(1);
                x_new(j) = r*x_lb(j)+(1-r)*x0(j);
            elseif x_new(j) > x_ub(j)
                r = rand(1);
                x_new(j) = r*x_ub(j)+(1-r)*x0(j);
            end
        end
        
        x1 = x_new;    % 将调整后的x_new赋值给新解x1
        y1 = fun(x1);  % 计算新解的函数值
%         disp(['新解的函数值：',num2str(y1)])
        if y1 > y0    % 如果新解函数值大于当前解的函数值
%             disp('更新当前解为新解')
            x0 = x1; % 更新当前解为新解
            iter_x = [iter_x; x1]; % 将新找到的x1添加到中间结果中
            iter_y = [iter_y; y1];  % 将新找到的y1添加到中间结果中
        else
            p = exp(-(y0 - y1)/T); % 根据Metropolis准则计算一个概率
%             disp(['新解的函数值小于当前解的函数值，接受新解的概率为：',num2str(p)])
            if rand(1) < p   % 生成一个随机数和这个概率比较，如果该随机数小于这个概率
%                 disp('该随机数小于这个概率，那么我们接受新解')
                x0 = x1;  % 更新当前解为新解
            end
        end

    end
    h.XData = x0;  % 更新散点图句柄的x轴的数据（此时解的位置在图上发生了变化）
    h.YData = fun(x0); % 更新散点图句柄的y轴的数据（此时解的位置在图上发生了变化）    
    T = alfa*T;   % 温度下降
    pause(0.01)  % 暂停一段时间(单位：秒)后再接着画图

end

[best_y, ind] = max(iter_y);  % 找到最大的y的值，以及其在向量中的下标
best_x = iter_x(ind,:); % 根据下标找到此时x的值
disp('最佳的位置是：'); disp(best_x)
disp('此时最优值是：'); disp(best_y)

pause(1) 
h.XData = [];  h.YData = [];  % 将原来的散点删除
scatter(best_x,best_y,'*r');  % 在最大值处重新标上散点
title(['模拟退火找到的最大值为', num2str(best_y)])  % 加上图的标题

