function [plaza, v, time] =  switch_lanes(plaza, v, time)
% switch_lanes  为避免碰撞换道
%        plaza = p收费区矩阵
%                1 = 有车, 0 = 为空, -1 = 禁止, -3 =收费站
%        v = 速度矩阵
%        time = 时间矩阵
[L, W] = size(plaza);
found = find(plaza==1);%找到收费区中有车的位置并记录
if ~isempty(found)%如果有车
    found = found(randperm(length(found)));%随机排序
end
for k=found'%按照随机的顺序进行循环
    if (plaza(k+1)~=0 | plaza(k-1)==1) & rem(k,L)~=floor(L/2)%从上向下；前面有障碍;不在收费区(求余)
        if (rand < .5 )%0.5的概率换道
            if plaza(k+L) == 0 & plaza(k+L+1) == 0%车道的左边空，左前方为空
                plaza(k+L) = 1;%k车换至左边车道
                plaza(k) = 0;
                v(k+L) = v(k);%将速度与时间状态转移
                v(k) = 0;
                time(k+L) = time(k);
                time(k) = 0;
            elseif plaza(k-L) == 0 & plaza(k-L+1) == 0
                plaza(k-L) = 1;%换至右车道
                plaza(k) = 0;
                v(k-L) = v(k);
                v(k) = 0;
                time(k-L) = time(k);
                time(k) = 0;
            end
        else
            if plaza(k-L) == 0 & plaza(k-L+1) == 0
                plaza(k-L) = 1;
                plaza(k) = 0;
                v(k-L) = v(k);
                v(k) = 0;
                time(k-L) = time(k);
                time(k) = 0;
            elseif plaza(k+L) == 0 & plaza(k+L+1) == 0
                plaza(k+L) = 1;
                plaza(k) = 0;
                v(k+L) = v(k);
                v(k) = 0;
                time(k+L) = time(k);
                time(k) = 0;
            end
        end
    end
end
