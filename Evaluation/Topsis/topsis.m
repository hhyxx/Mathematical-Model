clear;clc
load data_water_quality.mat

% ��ȡ����
X = xlsread('data.xlsx'); 
%  �ڶ������ж��Ƿ���Ҫ����
[n,m] = size(X);

% ����ȷ����Ҫ���򻯴������
Postion = [1,2,5]; % ��ʾ��1��2��5����Ҫ�������򻯵Ĵ���
Type = 1;% 1����С�ͣ� 2���м��ͣ� 3��������
% ע�⣬Position��Type������ͬά�ȵ�������
for i = 1 : size(Position,2)  
    X(:,Position(i)) = Positivization(X(:,Position(i)),Type(i),Position(i));
end

%% Ȩ�ص�ȷ������Ȩ��ȷ��
weigh = [0.2 0.3 0.5]; % �ֱ�ָÿһ��ָ����ռȨ��
weigh = ones(1,m) ./ m ; %�������Ҫ��Ȩ�ؾ�Ĭ��Ȩ�ض���ͬ������Ϊ1/m

%% �������������򻯺�ľ�����б�׼��
Z = X ./ repmat( sum ( X .* X ) .^ 0.5, n, 1);

%% ���Ĳ������������ֵ�ľ������Сֵ�ľ��룬������÷�
D_P = sum([(Z - repmat(max(Z),n,1)) .^ 2 ] .* repmat(weigh,n,1) ,2) .^ 0.5;   % D+ �����ֵ�ľ�������
D_N = sum([(Z - repmat(min(Z),n,1)) .^ 2 ] .* repmat(weigh,n,1) ,2) .^ 0.5;   % D- ����Сֵ�ľ�������
S = D_N ./ (D_P+D_N);    % δ��һ���ĵ÷�
stand_S = S / sum(S)
[sorted_S,index] = sort(stand_S ,'descend')
% index Ϊԭ�����±�


% sort(A)��A�������������л�����������Ĭ�϶��Ƕ�A�����������С�sort(A)��Ĭ�ϵ����򣬶�sort(A,'descend')�ǽ�������
% sort(A)��A�Ǿ���Ĭ�϶�A�ĸ��н�����������
% sort(A , dim)
% dim = 1 ʱ��Чsort(A)
% dim = 2 ʱ��ʾ��A�еĸ���Ԫ����������
% A = [2,1,3,8]
% Matlab �и�һά����������ʹ�� sort������sort��A���������ǰ�������еģ�
% ���� A Ϊ�������������
% ������������ǰ������������� [sA,index] = sort(A,'descend') ��
% �����sA ������õ�������index ������ sA �ж� A ��������

