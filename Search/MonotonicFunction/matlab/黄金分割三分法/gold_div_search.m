clc
clear
syms t;

f=t*(t-3);

a = -3;
b = 5;
eps=0.0001;
cnt=0;
p=(sqrt(5)-1)/2;
ans=0;
while abs(l-r) > eps
    l=a+p;
    r=a+1-p;
    cnt=cnt+1;
    
    if (2 * l - 3<0) % �½�����
        a=l;
    elseif (2 * r - 3<0) % �½�����
        a=l;
    elseif (2 * l - 3 == 0) %פ��
        ans=l;
        break;
    else
        r=mid; %��������
    end
end

cnt
l
r
mid