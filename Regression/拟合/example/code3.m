clear;clc 
x = rand(30,1) * 10;  % x是0-10之间均匀分布的随机向量（30个样本）
y = 3 * exp(0.5*x) -5 + normrnd(0,1,30,1);
cftool
