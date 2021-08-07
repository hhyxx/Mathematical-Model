function [s,w] = shang(x,ind)
% 实现用熵值法求各指标(列）的权重及各数据行的得分
% x为原始数据矩阵, 一行代表一个样本, 每列对应一个指标
% index指示向量，指示各列正向指标还是负向指标，1表示正向指标，2表示负向指标
% s返回各个样本的综合得分，w返回各之指标的权重

[n,m] = size(x); % n个样本, m个指标

%% 数据的归一化处理
for i = 1:m
    if ind(i) == 1 % 正向指标归一化
        X(: , i) = Datastd(x(: , i) , 1 , 0.002,0.996);    
        %若归一化到[0,1], 0会出问题
    else % 负向指标归一化
        X(: , i) = Datastd(x(: , i) , 2 , 0.002 , 0.996);
    end
end

%% 计算第j个指标下，第i个样本占该指标的比重p(i,j)
for i = 1:n
    for j = 1:m
        p(i,j) = X(i,j) / sum(X(:,j));
    end
end

%% 计算第j个指标的熵值e(j)
k = 1 / log(n);
for j = 1:m
    e(j) =- k * sum(p(:,j) .* log(p(:,j)));
end


d = ones(1,m) - e; % 计算信息熵冗余度
w = d ./ sum(d); % 求权值w
s = 100 * w * X'; % 求综合得分