 function [plaza, v, number_cars] = new_cars(Arrival, dt, plaza, v, vmax)
% new_cars   ����ж����½�����
%        Arrival = ƽ��������
%        dt = ʱ�䲽��
%        plaza = �շ�������
%                1 = �г�, 0 = Ϊ��, -1 = ��ֹ, -3 = �շ�վ
%        v = �ٶȾ���
%        vmax = ����ٶ�
unoccupied = find(plaza(1,:) == 0);%�ҵ���һ����Ϊ�յ�λ�ò���¼
n = length(unoccupied); % �ճ����ĸ���
%������������Ϊ�������Ҳ��ܳ������ճ�������
number_cars =min( poissrnd(Arrival*dt,1), n);%��������ֲ�;
if number_cars > 0 %�пճ���
    x = randperm(n);%��1��n�������
    for i = 1:number_cars
         plaza(1, unoccupied(x(i))) = 1;%ȷ���½�������λ��
         v(1, unoccupied(i)) = vmax;%�½��ĳ���������ٶ�ʻ��
    end
end
