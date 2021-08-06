%% 自适应权重的粒子群算法PSO: 求解四种不同测试函数的最小值(动画演示）
clear; clc

%% 粒子群算法中的预设参数（参数的设置不是固定的，可以适当修改）
tic % 开始计时
n = 1000; % 粒子数量
narvs = 30; % 变量个数
c1 = 2.05;  % 每个粒子的个体学习因子，也称为个体加速常数
c2 = 2.05;  % 每个粒子的社会学习因子，也称为社会加速常数
C = c1+c2; 
fai = 2/abs((2-C-sqrt(C^2-4*C))); % 收缩因子
w_max = 0.9;  % 最大惯性权重，通常取0.9
w_min = 0.4; % 最小惯性权重，通常取0.4
K = 1000;  % 迭代的次数
% Sphere函数
% vmax = 30*ones(1,30); % 粒子的最大速度
% x_lb = -100*ones(1,30); % x的下界
% x_ub = 100*ones(1,30); % x的上界
% Rosenbrock函数
vmax = 10*ones(1,30); % 粒子的最大速度
x_lb = -30*ones(1,30); % x的下界
x_ub = 30*ones(1,30); % x的上界
% Rastrigin函数
% vmax = 1.5*ones(1,30); % 粒子的最大速度
% x_lb = -5.12*ones(1,30); % x的下界
% x_ub = 5.12*ones(1,30); % x的上界
% Griewank函数
% vmax = 150*ones(1,30); % 粒子的最大速度
% x_lb = -600*ones(1,30); % x的下界
% x_ub = 600*ones(1,30); % x的上界

%% 改进：自动退出迭代循环
Count = 0; % 计数器初始化为0
max_Count = 20;  % 最大计数值初始化为20
tolerance = 1e-6;  % 函数变化量容忍度，取10^(-6)

%% 初始化粒子的位置和速度
x = zeros(n,narvs);
for i = 1: narvs
    x(:,i) = x_lb(i) + (x_ub(i)-x_lb(i))*rand(n,1);    % 随机初始化粒子所在的位置在定义域内
end
v = -vmax + 2*vmax .* rand(n,narvs);  % 随机初始化粒子的速度（这里我们设置为[-vmax,vmax]）

%% 计算适应度
fit = zeros(n,1);  % 初始化这n个粒子的适应度全为0
for i = 1:n  % 循环整个粒子群，计算每一个粒子的适应度
    fit(i) = Obj_fun3(x(i,:));   % 调用Obj_fun3函数来计算适应度
end 
pbest = x;   % 初始化这n个粒子迄今为止找到的最佳位置（是一个n*narvs的向量）
ind = find(fit == min(fit), 1);  % 找到适应度最小的那个粒子的下标
gbest = x(ind,:);  % 定义所有粒子迄今为止找到的最佳位置（是一个1*narvs的向量）


%% 迭代K次来更新速度与位置
% fitnessbest = ones(K,1);  % 初始化每次迭代得到的最佳的适应度
for d = 1:K  % 开始迭代，一共迭代K次
    tem = gbest; % 将上一步找到的最佳位置保存为临时变量
    for i = 1:n   % 依次更新第i个粒子的速度与位置
        f_i = fit(i);  % 取出第i个粒子的适应度
        f_avg = sum(fit)/n;  % 计算此时适应度的平均值
        f_min = min(fit); % 计算此时适应度的最小值
        if f_i <= f_avg  
            w = w_min + (w_max - w_min)*(f_i - f_min)/(f_avg - f_min);
        else
            w = w_max;
        end
        v(i,:) = fai * (w*v(i,:) + c1*rand(1)*(pbest(i,:) - x(i,:)) + c2*rand(1)*(gbest - x(i,:)));  % 更新第i个粒子的速度
        x(i,:) = x(i,:) + v(i,:); % 更新第i个粒子的位置
        % 如果粒子的位置超出了定义域，就对其进行调整
        for j = 1: narvs
            if x(i,j) < x_lb(j)
                x(i,j) = x_lb(j);
            elseif x(i,j) > x_ub(j)
                x(i,j) = x_ub(j);
            end
        end
        fit(i) = Obj_fun3(x(i,:));  % 重新计算第i个粒子的适应度
        if fit(i) < Obj_fun3(pbest(i,:))   % 如果第i个粒子的适应度小于这个粒子迄今为止找到的最佳位置对应的适应度
           pbest(i,:) = x(i,:);   % 那就更新第i个粒子迄今为止找到的最佳位置
        end
        if  Obj_fun3(pbest(i,:)) < Obj_fun3(gbest)  % 如果第i个粒子的适应度小于所有的粒子迄今为止找到的最佳位置对应的适应度
            gbest = pbest(i,:);   % 那就更新所有粒子迄今为止找到的最佳位置
        end
    end
    fitnessbest(d) = Obj_fun3(gbest);  % 更新第d次迭代得到的最佳的适应度
    delta_fit = abs(Obj_fun3(gbest) - Obj_fun3(tem));   % 计算相邻两次迭代适应度的变化量
    if delta_fit < tolerance  % 判断这个变化量和“函数变化量容忍度”的相对大小，如果前者小，则计数器加1
        Count = Count + 1;
    else
        Count = 0;  % 否则计数器清0
    end   
    if Count > max_Count  % 如果计数器的值达到了最大计数值
        break;  % 跳出循环
    end
end

figure(2) 
plot(fitnessbest)  % 绘制出每次迭代最佳适应度的变化图
xlabel('迭代次数');
disp('最佳的位置是：'); disp(gbest)
disp('此时最优值是：'); disp(Obj_fun3(gbest))

toc % 结束计时



% % 注意：代码文件仅供参考，一定不要直接用于自己的数模论文中
% % 国赛对于论文的查重要求非常严格，代码雷同也算作抄袭
% % 视频中提到的附件可在售后群（购买后收到的那个有道云笔记中有加入方式）的群文件中下载。包括讲义、代码、优秀的作业、我视频中推荐的资料等。
% % 关注我的微信公众号《数学建模学习交流》，后台发送“软件”两个字，可获得常见的建模软件下载方法；发送“数据”两个字，可获得建模数据的获取方法；发送“画图”两个字，可获得数学建模中常见的画图方法。另外，也可以看看公众号的历史文章，里面发布的都是对大家有帮助的技巧。
% % 购买更多优质精选的数学建模资料，可关注我的微信公众号《数学建模学习交流》，在后台发送“买”这个字即可进入店铺(我的微店地址：https://weidian.com/?userid=1372657210)进行购买。
% % 视频价格不贵，但价值很高。单人购买观看只需要58元，三人购买人均仅需46元，视频本身也是下载到本地观看的，所以请大家不要侵犯知识产权，对视频或者资料进行二次销售。
% % 如何修改代码避免查重的方法：https://www.bilibili.com/video/av59423231（必看）