clear
clc

syms x;

f=x^3-2*x+1;

x0=0;
h=1; % ����
a=2; % ������λ����ʾ�����Ʊ�����
b=1; % 
x1=x0+h;
fx0=subs(f,x,x0); % �������еı����滻��x0
fx1=subs(f,x,x1); % �������еı����滻��x1

if fx1 < fx0 % �ƶ����ֵ���ţ������ӣ�
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
else %�ƶ����ֵû���ƶ�ǰ���� 
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
disp('�������Ϊ:');
s
disp('��������Ϊzhi:');
b