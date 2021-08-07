clear
clc

x=[2;2];
[f0,g]=detaf(x);


while norm(g)>0.000001 %norm 用来求矩阵的范数
    p=-g/norm(g);
    t=1.0;
    f=detaf(x+t*p);
    while f>f0
        t=t/2;
        f=detaf(x+t*p);
    end
    x=x+t*p;
    [f0,g]=detaf(x);
end
x,f0
