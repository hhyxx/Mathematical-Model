%第一组样本观测值向量
x=[20.1  20 19.3 20.6 20.2 19.9 20 19.9 19.1 19.9];
%第二组样本观测值向量
y=[18.6 19.1 20 20 20 19.7 19.9 19.6 20.2];
alpha=0.05; %显著性水平为0.05
tail='both'; %尾部类型为双侧
vartype='equal'; %方差类型为等方差
%调用ttest2函数作两个正态总体均值的比较检验
%返回变量h，检验的p值，均值差的置信区间muci，结构体变量stats

[h,p,muci,stats]=ttest2(x,y,alpha,tail,vartype)