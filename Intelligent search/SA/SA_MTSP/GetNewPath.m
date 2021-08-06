function path1 = GetNewPath(path0)
    % path0: ԭ����·��
    n = length(path0);
    
    % ���ѡ�����ֲ�����·���ķ���
    p1 = 0.33;  % ������������·���ĸ���
    p2 = 0.33;  % ��λ��������·���ĸ���
    r = rand(1); % �������һ��[0 1]����ȷֲ��������

%% ʹ�ý�����������·��
    if  r < p1    
        c1 = randi(n);   % 1~n�е��������
        c2 = randi(n);   
        path1 = path0;  % ��path0��ֵ����path1
        
        path1(c1) = path0(c2);  %path1��c1λ�õ�Ԫ��Ϊpath0��c2λ�õ�Ԫ��
        path1(c2) = path0(c1);  %path1��c2λ�õ�Ԫ��Ϊpath0��c1λ�õ�Ԫ��
        path1(path1==1)=[];
        path1=[1,path1];
%% ʹ����λ��������·�� 
    elseif r < p1+p2 

        c1 = randi(n);   % ����1-n�е�һ���������
        c2 = randi(n);   
        c3 = randi(n);   

        sort_c = sort([c1 c2 c3]);  % ��c1 c2 c3��С��������
        c1 = sort_c(1);  c2 = sort_c(2);  c3 = sort_c(3);  % ˳���С����c1 < = c2 <=  c3

        tem1 = path0(1:c1-1);
        tem2 = path0(c1:c2);
        tem3 = path0(c2+1:c3);
        tem4 = path0(c3+1:end);

        path1 = [tem1 tem3 tem2 tem4];
        path1(path1 == 1)=[];
        path1=[1,path1];

%%  ʹ�õ��÷�������·��
    else  
        c1 = randi(n);   % ����1-n�е�һ���������
        c2 = randi(n);   % ����1-n�е�һ���������

        if c1 > c2  % ���c1��c2�󣬾ͽ���c1��c2��ֵ
            tem = c2;
            c2 = c1;
            c1 = tem;
        end

        tem1 = path0(1:c1-1);
        tem2 = path0(c1:c2);
        tem3 = path0(c2+1:end);
        path1 = [tem1 fliplr(tem2) tem3];   
        % �ı��ƶ�˳�������·��
        path1(path1==1)=[];
        path1=[1,path1];
    end
end




