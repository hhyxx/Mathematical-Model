function [posit_x] = Positivization(x,type,i)
% ���������������
%   x����Ҫ���򻯴����ָ���Ӧ��ԭʼ������
%   type�� ָ������ͣ�1����С�ͣ� 2���м��ͣ� 3�������ͣ�
%   i: ���ڴ������ԭʼ�����е���һ��
% ���������
%   posit_x��ʾ�����򻯺��������

    if type == 1  %��С��
        posit_x = Min2Max(x);  %����Min2Max����������
    elseif type == 2  %�м���
        best = 7; % ��ʾ�����м����ŵ���һ��ֵ������ph = 7 ʱ����������
        posit_x = Miv_bMax(x,best);
    elseif type == 3  %������
        a = down; % ����������½�
        b = up; % ����������Ͻ�
        posit_x = Inter2Max(x,a,b);
    end
end
