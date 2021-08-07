function [plaza, v, time] = create_plaza(B, L, plazalength)    %��������շ���������
%                 1 = �г�, 0 = Ϊ��, -1 = ��ֹ, -3 = �շ�վ
%
%        B = �շ�վ����12
%        L = ������6
%        plazalength = �շ�������   
plaza = zeros(plazalength,B+2); % ���߽߱�    �������һ��ȫ0 ����plazalength����*��B+2���е�   Ϊʲô�Ǽ�2�أ�������Ϊ�����߶�Ҫ�Ӳ��ǼӶ�
v = zeros(plazalength,B+2); % �ٶ�״̬�����ʼ��    �� Ϊʲô�ٶ���ʱ��ĳ�ʼ���ľ��������߽߱�ľ�����һ���ģ�
time = zeros(plazalength,B+2); % ʱ��״̬�����ʼ��     ��Ϊplaza���շ����ľ��󣬵�ȻҪ�����Ķ�������ѽ

plaza(1:plazalength,[1,2+B]) = -1;%�������߽߱�   -1�Ǿ�ֹ��    ! �ӵ�1�е�plazalength�У� �ٴӵ�1�к�2+B�У� ���������ߣ����Զ���Ϊ-1 ���Ǿ�ֹ��
       % ����Ҫע��� matlab����� [ , ] ���Ǳ�ʾ��Χ�ģ����ǵ������������������ʱ��ʾ1��2+B 
       %���������[ ��]����Ǳ�ʾ��Χ��
       
plaza(ceil(plazalength/2),[2:1+B]) = -3;%�����շ�վ��λ��   cielȡ�����������������  !����˵ȡ���м���У���Ϊ�շ�վ��λ�ã�
          %                ���ﶨ���շ�վ�ķ�Χ��

          
toptheta = 1.3; %����     ����֪��1��ʾ�г��ǲ��ǣ������1.3��ʲô�����ض
bottomtheta = 1.2;%�׽�

%���
%��
for col = 2:ceil(B/2-L/2)+1     %  ����2 3 4 
    for row = 1:(plazalength-1)/2 - floor(tan(toptheta) * (col-1))  
            %     floor(tan(toptheta) * (col-1)   3 7 10   ���� �����Ҿ����е����� ����
        plaza(row, col) = -1;    %  �������������-1    col ��ʾ�� ��  row ��ʾ��
    end
%��
    for row = 1:(plazalength-1)/2 - floor(tan(bottomtheta) * (col-1))
        plaza(plazalength+1-row, col) = -1;   %�����������
    end
end     %����ȫ�����Ǳ�ʾ


fac = ceil(B/2-L/2)/floor(B/2-L/2);  %���ֱ�Ӷ��岻���𣿣�ֱ�Ӷ�����Ϊ 1
%�ұ�
toptheta = atan(fac*tan(toptheta));
bottomtheta = atan(fac*tan(bottomtheta));

for col = 2:floor(B/2-L/2) + 1
    for row = 1:(plazalength-1)/2 - floor(tan(toptheta) * (col-1))
        plaza(row,B+3-col) = -1;
    end
    for row = 1:(plazalength-1)/2 - floor(tan(bottomtheta) * (col-1))
        plaza(plazalength+1-row,B+3-col) = -1;
    end 
end      %   ��֪���� ������������  ����ʲô  �������������ǶԳƵ�ѽ   ΪʲôҪ�������鷳�أ�����