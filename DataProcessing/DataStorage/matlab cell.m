% 数组中存在非数值数据如字符串时候用元胞数组读取
[~,~,celldata] = xlsread('仓库数据.xlsx',1); 

% 处理元胞数组中的字符串
for i =1:len
    string = char(huojia(i,1));  % 当前元胞单元格的字符串
    string(1) = [];
    huojia(i,1) = {str2double(string)};
end