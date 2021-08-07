clear;clc
load data_water_quality.mat

% 读取数据
X = xlsread('data.xlsx'); 
%  第二步：判断是否需要正向化
[n,m] = size(X);

% 首先确定需要正向化处理的列
Postion = [1,2,5]; % 表示第1、2、5列需要进行正向化的处理
Type = 1;% 1：极小型， 2：中间型， 3：区间型
% 注意，Position和Type是两个同维度的行向量
for i = 1 : size(Position,2)  
    X(:,Position(i)) = Positivization(X(:,Position(i)),Type(i),Position(i));
end

%% 权重的确定，熵权法确定
weigh = [0.2 0.3 0.5]; % 分别指每一列指标所占权重
weigh = ones(1,m) ./ m ; %如果不需要加权重就默认权重都相同，即都为1/m

%% 第三步：对正向化后的矩阵进行标准化
Z = X ./ repmat( sum ( X .* X ) .^ 0.5, n, 1);

%% 第四步：计算与最大值的距离和最小值的距离，并算出得分
D_P = sum([(Z - repmat(max(Z),n,1)) .^ 2 ] .* repmat(weigh,n,1) ,2) .^ 0.5;   % D+ 与最大值的距离向量
D_N = sum([(Z - repmat(min(Z),n,1)) .^ 2 ] .* repmat(weigh,n,1) ,2) .^ 0.5;   % D- 与最小值的距离向量
S = D_N ./ (D_P+D_N);    % 未归一化的得分
stand_S = S / sum(S)
[sorted_S,index] = sort(stand_S ,'descend')
% index 为原来的下标


% sort(A)若A是向量不管是列还是行向量，默认都是对A进行升序排列。sort(A)是默认的升序，而sort(A,'descend')是降序排序。
% sort(A)若A是矩阵，默认对A的各列进行升序排列
% sort(A , dim)
% dim = 1 时等效sort(A)
% dim = 2 时表示对A中的各行元素升序排列
% A = [2,1,3,8]
% Matlab 中给一维向量排序是使用 sort函数：sort（A），排序是按升序进行的，
% 其中 A 为待排序的向量；
% 若欲保留排列前的索引，则可用 [sA,index] = sort(A,'descend') ，
% 排序后，sA 是排序好的向量，index 是向量 sA 中对 A 的索引。

