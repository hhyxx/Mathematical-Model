function [posit_x] = Positivization(x,type,i)
% 输入变量有三个：
%   x：需要正向化处理的指标对应的原始列向量
%   type： 指标的类型（1：极小型， 2：中间型， 3：区间型）
%   i: 正在处理的是原始矩阵中的哪一列
% 输出变量：
%   posit_x表示：正向化后的列向量

    if type == 1  %极小型
        posit_x = Min2Max(x);  %调用Min2Max函数来正向化
    elseif type == 2  %中间型
        best = 7; % 表示的是中间最优的那一个值，例如ph = 7 时候酸碱度最优
        posit_x = Miv_bMax(x,best);
    elseif type == 3  %区间型
        a = down; % 最优区间的下界
        b = up; % 最优区间的上界
        posit_x = Inter2Max(x,a,b);
    end
end
