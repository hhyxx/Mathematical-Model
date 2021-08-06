function [MinPath,MinMaxD,record] = Min_MTsp(city_num , salesman_num , d)
%% ������ʼ��
    T0 = 1000;   % ��ʼ�¶�
    T = T0;  % �����¶�Ϊ��ʼ�¶�
    MaxN = 1000;  % ����������
    Lk = 500;   % ÿ���¶��µĵ�������
    alpha = 0.97;   % �¶�˥��ϵ��
%% ���ɳ�ʼ��Ĵ���

path0 = randperm(city_num); % 1~n��������еĳ�ʼ·��
for i = 1:salesman_num-1	%path0 ���������3��0
	len = length(path0);	%�����ʱpat0�ĳ���(��Ϊ�ڲ��ϲ���0,���Գ��Ȼ᲻������)
	ind = randi(len);	%������1en֮��������,ind��ʾҪ����1��λ��
	path0 = [ path0(1:ind),0,path0(ind+1:end)]; %����0
end

%% ��ʼ�����������м���������·���;����ȡֵ
iter_path = path0; %��ʼΪ������ʼ�ĳ�ʼ·��
[path0_ , CarNum_ ] = DealPath(path0,salesman_num); %�������������
[iter_result,~] = CalMTspDistance(path0_ , CarNum_ , d); % ���㵱ǰ·���ľ���
%% ģ���˻����
    
    record = [];
    for iter = 1 : MaxN  % ����������
        MinResult = 10000000000;
        for i = 1 : Lk  %  ÿ���¶ȵ�������
            %�������������
            [path0_ , CarNum_ ] = DealPath(path0,salesman_num); 
            if CarNum_< 4
                result0=100000000;
            else
                 % ���㵱ǰ·���ľ���
                [result0 , ~] = CalMTspDistance(path0_ , CarNum_ , d); 
            end
            MinResult = min(MinResult,result0);
            
            path1 = GetNewPath(path0);  % �����µ�·��
            [path1_,CarNum_] = DealPath(path1,salesman_num); 
            if CarNum_< 4 % ���óͷ�
                result1=100000000;
            else
                [result1 , ~] = CalMTspDistance(path1_,CarNum_,d); 
            end
            MinResult = min(MinResult,result1);
            
            if ~isempty(record)
                MinResult = min ( MinResult , record( length(record) ) );
            end
            
            if result1 < result0    % ��·������
                path0 = path1; % ���µ�ǰ·��Ϊ��·��
                iter_path = [iter_path; path1]; % ��¼·��
                iter_result = [iter_result; result1];  % ��¼����
            else
                p = exp(-(result1 - result0)/T); % Metropolis ׼��������
                if rand(1) < p   % �������������ʱȽ�С��������ӽ�
                    path0 = path1;  % ���µ�ǰ·��Ϊ��·��
                end
            end
        end
        
        record = [record,MinResult];
        T = alpha*T;   % �¶��½�       
    end
    [MinMaxD, idx] = min(iter_result);  % �ҵ���С�����ֵ�����±�
    MinPath = iter_path(idx,:); % ���±��ҵ�����·��    
end

