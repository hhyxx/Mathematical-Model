function [cpath, k] = DealPath(path, salesman_num)
	cpath = cell(salesman_num,1);	% Ԫ������,�洢ÿ�������̾�������
	index = find(path == 0);	%   �ҵ����и���λ��
	k=1;	
    for i = 1:salesman_num-1	
		
        if i == 1	% ����ǵ�1������
			c = path(i:index(i)-1);	% ��ȡ��һ�������̾����ĳ���
        else
			c = path(index(i-1)+1:index(i)-1);% ��ȡ�м���������������ĳ���
        end
        
        if ~isempty(c)	% ֻ��c�ǿյĻ��ű���
			cpath{k} = c;   %  ��c���浽Ԫ��cpath�ĵ�k��λ�ñ�ʾ��k�������̵�·��
			k = k+1;    %  ���빤������������Ŀ+1
        end
    end
	c = path( index(end) + 1 : end );	%   ���һ�������̾����ĳ���
	if ~isempty(c)	
		cpath{k} = c;
	else 
		k = k-1;
	end
	cpath = cpath(1:k); %   ֻ����Ԫ����ǰk�зǿյĲ���
end