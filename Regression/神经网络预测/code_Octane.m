
load data_Octane.mat

% 利用训练出来的神经网络模型对数据进行预测
% 例如我们要预测编号为51的样本，其对应的401个吸光度为：new_X(1,:)
% sim(net, new_X(1,:))
% 错误使用 network/sim (line 266)
% Input data sizes do not match net.inputs{1}.size.
% net.inputs{1}.size


% 写一个循环，预测接下来的十个样本的辛烷值
predict_y = zeros(10,1); % 初始化predict_y
for i = 1: 10
    result = sim(net, new_X(i,:)');% 必须将指标变为列向量，然后再用sim函数预测
    predict_y(i) = result;
end
disp('预测值为：')
disp(predict_y)
