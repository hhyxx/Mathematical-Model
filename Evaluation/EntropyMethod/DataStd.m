function y = DataStd(x,type,ymin,ymax)
%	实现正向或负向指标归一化，返回归一化后的数据矩阵
%	x为原始数据矩阵, 一行一个样本, 一列一个指标
%	type设定指标的符号，正指标为1,负指标为2
%	ymin,ymax为归一化的区间端点
[n,m] = size(x); % n 为行， m 为列
y = zeros(n,m);
xmin = min(x);
xmax = max(x);
switch type
    case 1 % 正指标
        for j=1:m
            y(:,j) = (ymax-ymin)*(x(:,j)-xmin(j))/(xmax(j)-xmin(j))+ymin;
        end
    case 2 % 负指标
        for j=1:m
            y(:,j) = (ymax-ymin)*(xmax(j)-x(:,j))/(xmax(j)-xmin(j))+ymin;
        end
end