x=[49.4 50.5 50.7 51.7 49.8 47.9 49.2 51.4 48.9];
%调用ttest函数作总体均值的双侧检验
%返回变量h，检验的p值，均值的置信区间muci，结构体变量stats
[h,p,muci,stats]=ttest(x,50,0.05)
