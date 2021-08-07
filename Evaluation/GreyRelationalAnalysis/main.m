clear;clc
load gdp.mat  % 导入数据 一个6*4的矩阵


% %  第二步：判断是否需要正向化
% [n,m] = size(X);
% 
% % 首先确定需要正向化处理的列
% Postion = [1,2,5]; % 表示第1、2、5列需要进行正向化的处理
% Type = 1;	% 1：极小型， 2：中间型， 3：区间型
% % 注意，Position和Type是两个同维度的行向量
% for i = 1 : size(Position,2)  
%     X(:,Position(i)) = Positivization(X(:,Position(i)),Type(i),Position(i));
% end


Mean = mean(gdp);  % 求出每一列的均值以供后续的数据预处理
gdp = gdp ./ repmat(Mean,size(gdp,1),1); 	% 实现每一个都除以平均值
% size = 6,repmat(Mean,6,1)	可以将矩阵进行复制，复制为和gdp同等大小，然后使用点除（对应元素相除）
disp('预处理后的矩阵为：'); disp(gdp)
Y = gdp(:,1);  % 母序列
X = gdp(:,2:end); % 子序列
absX0_Xi = abs(X - repmat(Y,1,size(X,2)))	% 计算|X0-Xi|矩阵(在这里我们把X0定义为了Y)
a = min(min(absX0_Xi))    % 计算两级最小差a
b = max(max(absX0_Xi))  % 计算两级最大差b
rho = 0.5; % 分辨系数取0.5
gamma = (a+rho*b) ./ (absX0_Xi  + rho*b)	% 计算子序列中各个指标与母序列的关联系数
disp('子序列中各个指标的灰色关联度分别为：')
disp(mean(gamma))

