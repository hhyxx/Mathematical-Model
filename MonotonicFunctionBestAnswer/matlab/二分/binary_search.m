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
    if (2 * mid - 3<0) % �½�����
        l = mid;
    elseif (2 * mid - 3 == 0) %פ��
        break;
    else
        r=mid; %��������
    end
end

cnt
l
r
mid