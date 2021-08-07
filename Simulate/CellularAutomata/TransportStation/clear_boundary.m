function [plaza, v, time, departurescount, departurestime] = clear_boundary(plaza, v, time)
% clear_boundary  最后一行车的移动
%        plaza = 收费区矩阵
%                1 = 有车,0=为空,-1 = 禁止, -3 = 收费站
%        v = 速度矩阵
%        time = 时间矩阵
departurescount = 0;%出口离去车辆数
departurestime = [];%离去车辆时刻
[a,b] = size(plaza);
for i =2:b-1
    if plaza(a,i) > 0
        departurescount = departurescount + 1;
        departurestime(departurescount) = time(a,i);
        plaza(a,i) = 0;
        v(a,i) = 0;
        time(a,i) = 0;
    end
end
