%% 使用之前学过的fmincon函数，初始值的选取非常难

%% 求解函数y = 11*sin(x) + 7*cos(5*x)在[-3,3]内的最大值
x0 = 0;  
A=[]; b=[];
Aeq=[];beq=[];
x_lb = -3; % x的下界
x_ub = 3; % x的上界
[x,fval] = fmincon(@Obj_fun1,x0,A,b,Aeq,beq,x_lb,x_ub)
fval = -fval
% 如果把初始值改为x0 = 2，结果会是什么？

%% 求解函数y = x1^2+x2^2-x1*x2-10*x1-4*x2+60在[-15,15]内的最小值
x0 = [0 0];  
A=[]; b=[];
Aeq=[];beq=[];
x_lb = [-3 -3]; % x的下界
x_ub = [3 3]; % x的上界
[x,fval] = fmincon(@Obj_fun2,x0,A,b,Aeq,beq,x_lb,x_ub)