%   iterations      =  �����������������     100
%   B               =  �շ�վ�ĸ���     ���������12��
%   L               =  ������            6
%   Arrival         =  ƽ��������
%   plazalength     =  �շ�������   101  ���������ʲô��˼��
%   Service         =  ������         0.8
%   dt              =  ʱ�䲽��   
%   plaza           =  �շ�������  
%                              1 = �г�, 0 =Ϊ��, -1 = ��ֹ, -3 = �շ�վ
%   v               =  �ٶȾ���  
%   vmax            =  ����ٶ�
%   time            =  ʱ�����
%   t_h             =  ʱ������
%   departurescount =  ��һ�μ����������ĳ���
%   departurestime  =  �����ĳ������շ��������ѵ�ʱ��
%   influx          =  ����ʸ��
%   outflux         =  ����ʸ��
%   timecost        =  ���г������ѵ�ʱ��
%   h               =  ���
clear;clc;
iterations = 100; % �����������������
B = 12; % �շ�վ�ĸ���
L = 6; % ������
Arrival=4; % ƽ��������

plazalength = 101; % �շ�������  
[plaza, v, time] = create_plaza(B, L, plazalength);%�Ӻ���1�����շ�������     
h = show_plaza(plaza, NaN, 0.01);%�Ӻ���2���շ�������ת��ΪͼƬ��NaN����ֵ��

Service = 0.8; % ������
dt = 0.2; % ʱ�䲽��
t_h = 1; % ʱ������
vmax = 5; % ����ٶ�
influx=[];%��ͬ
outflux=[];%��ͬ

timecost = [];
for i = 1:iterations
    % ����
    [plaza, v, arrivalscount] = new_cars(Arrival, dt, plaza, v, vmax);
    %�Ӻ���3����
    h = show_plaza(plaza, h,1);%����   ��ͼ�� �� 
    % ����
    [plaza, v, time] = switch_lanes(plaza, v, time); % �Ӻ���4��������
    [plaza, v, time] = move_forward(plaza, v, time, vmax); % �Ӻ���5ǰ������
    [plaza, v, time, departurescount, departurestime] = clear_boundary(plaza, v, time);
    %�Ӻ���6���������ĳ����Լ������ѵ�ʱ��
    % ��������
    influx(i) = arrivalscount;%��������
    outflux(i) = departurescount;%��������
    timecost = [timecost, departurestime];%���г������ѵ�ʱ��
end
h = show_plaza(plaza, h, 1);
xlabel({strcat('B = ',num2str(B)), ...
strcat('mean cost time = ', num2str(round(mean(timecost))))})