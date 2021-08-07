function [plaza, v, time] = move_forward(plaza, v, time, vmax)
% move_forward   ��NS����ǰ��
% 1.���٣�k���ĳ�����ڵ�λʱ����ͨ���ľ��� & ����֮���ٶ�С������ٶ�&һ������
% 2. ���٣�k���ĳ���С�ڵ�λʱ����ͨ���ľ��� & ����֮���ٶȴ����� һ������
% 3. һ�������������
% 4. �����շ�վ
%        plaza = �շ�������
%                1 = �г�, 0 = Ϊ��, -1 = ��ֹ, -3 = �շ�վ
%        v = �ٶȾ���
%        time = ʱ�����
%        vmax = ����ٶ�
Service = 0.8; % ������   exp(-Service*dt��
dt = 0.2; %ʱ��
probac = 0.7;% ���ٸ���
probdc = 1;% ���ٵĿ�����
probrd = 0.3;% ������ٵĿ�����
t_h = 1; % ʱ������
[L,W] = size(plaza);% ������i��j��λ�õľ������
gap = zeros(L,W);
f = find(plaza==1);%�ҵ��շ������г���λ�ò���¼
for k=f'
    [i,j] = ind2sub([L,W], k);%��������kλ�ã���[i,j]��ʾ
    d = plaza(i+1:end, j);%����
    gap(k) = min( find([d~=0;1]) )-1;%�ҵ�k��ǰ�������min���Ĳ�Ϊ���Ԫ������ࣻfind([d~=0;1]��
end
gap(end,:) = 0;%���һ�о���Ϊ0 

%% �ٶȸ��¹���
% 1 ���٣���������ٶ�
k = find((gap(f) > v(f)*t_h) & (v(f) + 1 <= vmax) & (rand(size(f)) <= probac));%gap(f)��ǰ�泵�ľ���
v(f(k)) = v(f(k)) + 1;
% 2 �ų���ײ
k = find((v(f)*t_h > gap(f)) & (rand(size(f)) <= probdc));
v(f(k)) = gap(f(k))/t_h;
% 3 �������
k = find(rand(size(f)) <= probrd);
v(f(k)) = max(v(f(k)) - 1,0);
% �����շ�վ
%% �շ�ͤ
booth_row = ceil(L/2);%�ҵ��շ�����λ��
for i = 2:W-1  
    if (plaza(booth_row,i) ~= 1)%������շ�վû��
        if (plaza(booth_row-1,i) == 1)%����շ�վ֮ǰ�г�
            v(booth_row - 1 ,i) = 1;%�ó��ٶ�Ϊ1
        end
        plaza(booth_row,i) = -3;
    else % �շ�վ�г���
        if (plaza(booth_row+1,i) ~= 1)&(rand > exp(-Service*dt))%����շ�վ֮��û�������ұ������
            v(booth_row,i) = 1; % ��վ
        else
            v(booth_row,i) = 0;
        end
     end
end
%% ״̬����
plaza(f) = 0;
plaza(f+v(f)) = 1;

time(f + v(f)) = time(f) + 1;
time(plaza~=1) = 0;

v(f + v(f)) = v(f);
v(plaza~=1)=0;