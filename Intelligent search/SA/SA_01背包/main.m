%% ģ���˻���ⱳ������
% ��Ϊ����ֻ��ʮ����Ʒ����ö�ٷ���ʵҲ������������2410��
% ��ģ�������˱������⻹���� intlinprog ����Ŷ~����ֻ��ѵ����ҵı�̺ͽ�ģ��˼ά


profit = [540 200 180 350 60 150 280 450 320 120];  % ÿ����Ʒ������
weight = [6 3 4 5 1 2 3 5 4 2];  % ÿ����Ʒ������

max_weight = 30;  % ���װ������ 
n = length(profit); % ��Ʒ����

%% ������ʼ��
T0 = 1000;   % ��ʼ�¶�
T = T0; % �������¶Ȼᷢ���ı䣬��һ�ε���ʱ�¶Ⱦ���T0
Mx = 500;  % ����������
Lk = 200;  % ÿ���¶��µĵ�������
alpha = 0.95;  % �¶�˥��ϵ��

%%  ���ɳ�ʼ��
way0 = zeros(1,n); % ��ʼ����ÿ��Ԫ�ض�Ϊ0����ʾһ����Ʒ����װ

%% ��ʼ�����������м�����װ�ط���������
iter_way = way0; 
iter_profit = sum(way0 .* profit);  % �������װ�ط���������

%% ģ���˻����
for iter = 1 : Mx  % ��ѭ��, ��������õ���ָ������������
    for i = 1 : Lk  %  ��ѭ������ÿ���¶��¿�ʼ����
        profit0 = sum(way0 .* profit); % �������װ�ط���������
        weight0 = sum(way0 .* weight); % �������װ�ط���������
        [way1, delta_weight] = gen_new_way(way0, n, weight);  % ���������Լ�д��gen_new_way���������µ�װ�ط���
        profit1 = sum(way1 .* profit); % ������װ�ط���������
        if weight0 + delta_weight > max_weight    % ��������ˣ��Ͳ�����
            [];  % ����䣬�൱��ɶ������
        elseif profit1 > profit0  % ���û�г���,������װ�ط������������
            way0 = way1; % ���µ�ǰװ�ط���Ϊ��װ�ط���
            iter_way = [iter_way; way1]; % �����ҵ���way1��ӵ��м�����
            iter_profit = [iter_profit; profit1];  % �����ҵ���profit1��ӵ��м�����
        else
            p = exp(-(profit0 - profit1)/T); % ����Metropolis׼�����һ������
            if rand(1) < p   % ����һ���������������ʱȽϣ�����������С���������
                way0 = way1;  % ���µ�ǰװ�ط���Ϊ��װ�ط���
            end
        end
    end
    T = alpha*T;   % �¶��½�       
end


[best_profit, index] = max(iter_profit);  % �ҵ����������Լ����������е��±�
 max_way = iter_way(index,:); % �����±��ҵ���ʱװ�ط���
disp('��ѵķ����ǣ�'); disp(max_way)
disp('��ʱ����ֵ�ǣ�'); disp(best_profit)


