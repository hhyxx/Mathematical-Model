function [plaza, v, time, departurescount, departurestime] = clear_boundary(plaza, v, time)
% clear_boundary  ���һ�г����ƶ�
%        plaza = �շ�������
%                1 = �г�,0=Ϊ��,-1 = ��ֹ, -3 = �շ�վ
%        v = �ٶȾ���
%        time = ʱ�����
departurescount = 0;%������ȥ������
departurestime = [];%��ȥ����ʱ��
[a,b] = size(plaza);
for i =2:b-1
    if plaza(a,i) > 0
        departurescount = departurescount + 1;
        departurestime(departurescount) = time(a,i);
        plaza(a,i) = 0;
        v(a,i) = 0;
        time(a,i) = 0;
    end
end
