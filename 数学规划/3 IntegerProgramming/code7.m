%% ���������滮����
%% ��1
c=[-20,-10]';
intcon=[1,2];  % x1��x2�޶�Ϊ����
A=[5,4;
      2,5];
b=[24;13];
lb=zeros(2,1);  
[x,fval]=intlinprog(c,intcon,A,b,[],[],lb)
fval = -fval

%% ��2
c=[18,23,5]';
intcon=3;  % x3�޶�Ϊ����
A=[107,500,0;
      72,121,65;
      -107,-500,0;
      -72,-121,-65];
b=[50000;2250;-500;-2000];
lb=zeros(3,1);
[x,fval]=intlinprog(c,intcon,A,b,[],[],lb)


%% ��3
c=[-3;-2;-1]; 

intcon=3; % x3�޶�Ϊ������

A=ones(1,3); 
b=7;
Aeq=[4 2 1]; 
beq=12;
lb=zeros(3,1); 
ub=[+inf;+inf;1]; % x(3)Ϊ0-1����
[x,fval]=intlinprog(c,intcon,A,b,Aeq,beq,lb,ub)


