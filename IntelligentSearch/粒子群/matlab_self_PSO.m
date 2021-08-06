%% Matlab自带的粒子群函数 particleswarm
clear;clc
%  Matlab中粒子群算法函数的参考文献
%       Mezura-Montes, E., and C. A. Coello Coello. "Constraint-handling in nature-inspired numerical optimization: Past, present and future." Swarm and Evolutionary Computation. 2011, pp. 173?C194.
%       Pedersen, M. E. "Good Parameters for Particle Swarm Optimization." Luxembourg: Hvass Laboratories, 2010.
%       Iadevaia, S., Lu, Y., Morales, F. C., Mills, G. B. & Ram, P. T. Identification of optimal drug combinations targeting cellular networks: integrating phospho-proteomics and computational network analysis. Cancer Res. 70, 6704-6714 (2010).
%       Liu, Mingshou , D. Shin , and H. I. Kang . "Parameter estimation in dynamic biochemical systems based on adaptive Particle Swarm Optimization." Information, Communications and Signal Processing, 2009. ICICS 2009. 7th International Conference on IEEE Press, 2010.

%% 直接调用particleswarm函数进行求解
narvs = 30; % 变量个数
% Sphere函数
% x_lb = -100*ones(1,30); % x的下界
% x_ub = 100*ones(1,30); % x的上界
% Rosenbrock函数
x_lb = -30*ones(1,30); % x的下界
x_ub = 30*ones(1,30); % x的上界
% Rastrigin函数
% x_lb = -5.12*ones(1,30); % x的下界
% x_ub = 5.12*ones(1,30); % x的上界
% Griewank函数
% x_lb = -600*ones(1,30); % x的下界
% x_ub = 600*ones(1,30); % x的上界
[x,fval,exitflag,output] = particleswarm(@Obj_fun3,narvs,x_lb,x_ub)  


%% 绘制最佳的函数值随迭代次数的变化图
options = optimoptions('particleswarm','PlotFcn','pswplotbestf')   
[x,fval] = particleswarm(@Obj_fun3,narvs,x_lb,x_ub,options)

%% 展示函数的迭代过程
options = optimoptions('particleswarm','Display','iter');
[x,fval] = particleswarm(@Obj_fun3,narvs,x_lb,x_ub,options)

%% 修改粒子数量，默认的是：min(100,10*nvars)
options = optimoptions('particleswarm','SwarmSize',50);
[x,fval] = particleswarm(@Obj_fun3,narvs,x_lb,x_ub,options)

%% 将粒子群算法得到的解作为初始值，继续调用其他函数进行后续求解，hybrid  n.混合物合成物; adj.混合的; 杂种的; 
options = optimoptions('particleswarm','HybridFcn',@fmincon);
[x,fval] = particleswarm(@Obj_fun3,narvs,x_lb,x_ub,options)

%% 惯性权重的变化范围，默认的是0.1-1.1
options = optimoptions('particleswarm','InertiaRange',[0.2 1.2]);
[x,fval] = particleswarm(@Obj_fun3,narvs,x_lb,x_ub,options)

%% 个体学习因子，默认的是1.49（压缩因子）
options = optimoptions('particleswarm','SelfAdjustmentWeight',2);
[x,fval] = particleswarm(@Obj_fun3,narvs,x_lb,x_ub,options)

%% 社会学习因子，默认的是1.49（压缩因子）
options = optimoptions('particleswarm','SocialAdjustmentWeight',2);
[x,fval] = particleswarm(@Obj_fun3,narvs,x_lb,x_ub,options)

%% 最大的迭代次数，默认的是200*nvars
options = optimoptions('particleswarm','MaxIterations',10000);
[x,fval] = particleswarm(@Obj_fun3,narvs,x_lb,x_ub,options)

%% 领域内粒子的比例 MinNeighborsFraction，默认是0.25 
options = optimoptions('particleswarm','MinNeighborsFraction',0.2);
[x,fval] = particleswarm(@Obj_fun3,narvs,x_lb,x_ub,options)

%% 函数容忍度FunctionTolerance, 默认1e-6, 用于控制自动退出迭代的参数
options = optimoptions('particleswarm','FunctionTolerance',1e-8);
[x,fval] = particleswarm(@Obj_fun3,narvs,x_lb,x_ub,options)

%% 最大停滞迭代数MaxStallIterations, 默认20, 用于控制自动退出迭代的参数
options = optimoptions('particleswarm','MaxStallIterations',50);
[x,fval] = particleswarm(@Obj_fun3,narvs,x_lb,x_ub,options)

%% 不考虑计算时间，同时修改三个控制迭代退出的参数
tic
options = optimoptions('particleswarm','FunctionTolerance',1e-12,'MaxStallIterations',100,'MaxIterations',100000);
[x,fval] = particleswarm(@Obj_fun3,narvs,x_lb,x_ub,options)
toc

%% 在粒子群结束后调用其他函数进行混合求解
tic
options = optimoptions('particleswarm','FunctionTolerance',1e-12,'MaxStallIterations',50,'MaxIterations',20000,'HybridFcn',@fmincon);
[x,fval] = particleswarm(@Obj_fun3,narvs,x_lb,x_ub,options)
toc


