clear;clc
load gdp.mat  % �������� һ��6*4�ľ���


% %  �ڶ������ж��Ƿ���Ҫ����
% [n,m] = size(X);
% 
% % ����ȷ����Ҫ���򻯴������
% Postion = [1,2,5]; % ��ʾ��1��2��5����Ҫ�������򻯵Ĵ���
% Type = 1;	% 1����С�ͣ� 2���м��ͣ� 3��������
% % ע�⣬Position��Type������ͬά�ȵ�������
% for i = 1 : size(Position,2)  
%     X(:,Position(i)) = Positivization(X(:,Position(i)),Type(i),Position(i));
% end


Mean = mean(gdp);  % ���ÿһ�еľ�ֵ�Թ�����������Ԥ����
gdp = gdp ./ repmat(Mean,size(gdp,1),1); 	% ʵ��ÿһ��������ƽ��ֵ
% size = 6,repmat(Mean,6,1)	���Խ�������и��ƣ�����Ϊ��gdpͬ�ȴ�С��Ȼ��ʹ�õ������ӦԪ�������
disp('Ԥ�����ľ���Ϊ��'); disp(gdp)
Y = gdp(:,1);  % ĸ����
X = gdp(:,2:end); % ������
absX0_Xi = abs(X - repmat(Y,1,size(X,2)))	% ����|X0-Xi|����(���������ǰ�X0����Ϊ��Y)
a = min(min(absX0_Xi))    % ����������С��a
b = max(max(absX0_Xi))  % ������������b
rho = 0.5; % �ֱ�ϵ��ȡ0.5
gamma = (a+rho*b) ./ (absX0_Xi  + rho*b)	% �����������и���ָ����ĸ���еĹ���ϵ��
disp('�������и���ָ��Ļ�ɫ�����ȷֱ�Ϊ��')
disp(mean(gamma))

