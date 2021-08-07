clear
clc

syms x;

f=x^3-2*x+1;

x0=0;
h=1; % 步长
a=2; % 步长单位，表示二进制倍增法
b=1; % 
x1=x0+h;
fx0=subs(f,x,x0); % 将函数中的变量替换成x0
fx1=subs(f,x,x1); % 将函数中的变量替换成x1

if fx1 < fx0 % 移动后的值更优，继续加，
    x2 = x1 + a^b * h; 
    fx2 = subs(f,x,x2); 
    while(fx2<fx1) 
        b = b+1; 
        x0 = x1; 
        x1 = x2; 
        fx0 = fx1; 
        fx1 = fx2; 
        x2 = x1+a^b*h; 
        fx2=subs(f,x,x2); 
    end
    x3=1/2*(x2+x1); 
    fx3=subs(f,x,x3); 
    if fx3<fx1 
        s=[x1,x2]; 
    else
        s=[x0,x3];
    end
else %移动后的值没有移动前的优 
    x1=x0-h; 
    fx1=subs(f,x,x1); 
    x2=x1-a^b*h; 
    fx2=subs(f,x,x2); 
    while(fx2<fx1) 
        b=b+1; x0=x1; x1=x2; 
        fx0=fx1; fx1=fx2; x2=x1-a^b*h; 
        fx2=subs(f,x,x2); 
    end
    x3=1/2*(x1+x2); 
    fx3=subs(f,x,x3); 
    if fx3<fx1 
        s=[x2,x1]; 
    else s=[x3,x0]; 
    end
end
disp('结果区间为:');
s
disp('搜索次数为zhi:');
b