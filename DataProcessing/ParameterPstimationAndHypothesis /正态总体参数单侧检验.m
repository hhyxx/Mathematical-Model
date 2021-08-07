x=[97 102 105 112 99 103 102 94 100 95 105 98 102 100 103];
%调用ztest函数作总体均值的单侧检验
%返回变量h，检验的p值，均值的置信区间muci,检验统计量的观测值zval
[h,p,muci,zval] = ztest(x,mean,theta,alpha,'right') % 参数为right、left