clc
clear
syms t;
f=t*(t-3);

l = -3;
r = 5;
eps=0.0001;
cnt=0;

while abs(l-r) > eps
    mid=(l+r)/2;
    cnt=cnt+1;
    if (2 * mid - 3<0) % 下降趋势
        l = mid;
    elseif (2 * mid - 3 == 0) %驻点
        break;
    else
        r=mid; %上升趋势
    end
end

cnt
l
r
mid