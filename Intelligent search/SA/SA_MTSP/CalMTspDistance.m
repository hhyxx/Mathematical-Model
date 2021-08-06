function [cost, every_cost] = CalMTspDistance(cpath, k, d)
	every_cost = zeros(k,1);	%��ʼ��ÿ�������̵�·�̳���ȫΪ0
    
    for i = 1:k	%��ÿ�������̿�ʼѭ��
		path_i = cpath{i};	%��i����������������·��
		n = length(path_i); %��i�������̾����ĳ��е�����
        if n>=26 % �ͷ�����
            every_cost(i) = every_cost(i) + 100000;
        elseif n==1 && path_i(1) == 0
            every_cost(i) = every_cost(i) + 100000;
        elseif n==0
            every_cost(i) = every_cost(i) + 100000;
        end
        for j = 1:n
            if j == 1% d�еĵ�һ��λ�ñ�ʾ��ʼ�ĳ���
				every_cost(i) = every_cost(i) + d(1,path_i(j) + 1); 
            else
				every_cost(i) = every_cost(i) + d( path_i (j-1) + 1,path_i(j)+1);
            end 
        end
        % ���ϴ����һ�����з��ص���ʼ���е�·��
		every_cost(i) = every_cost(i) + d(path_i(end)+1,1); 
    end
      cost = sum(every_cost);
end		
