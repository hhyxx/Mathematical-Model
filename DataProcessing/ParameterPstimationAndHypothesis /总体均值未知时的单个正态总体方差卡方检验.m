x=[49.4 50.5 50.7 51.7 49.8 47.9 49.2 51.4 48.9];
var0=1.5; 	%原假设中的常数
alpha=0.05;	 %显著性水平为0.05
tail='both';  %尾部类型为双侧
% 调用vartest函数作单个正态总体方差的双侧检验
% 返回变量h,检验的p值，方差的置信区间varci,结构体变量stats
[h,p,varci,stats]=vartest(x,var0,alpha,tail)