% 调用 normfit 函数求正态总体参数的最大似然估计和置信区间
% 返回总体均值的最大似然估计和 90% 置信区间 muci (10%拒绝域)
% 返回总体标准差的最大似然估计和 90% 置信区间 sigmaci

% muhat 表示正态分布均值的估计值，sigmahat表示标准差的估计值，muci为置信区间，sigmaci为置信度
[muhat , sigmahat , muci , sigmaci] = normfit(x , alpha) % x 表示检验的数据集，alpha表示指定的置信度,(1-alpha) 为指定的置信区间

