% �����д��ڷ���ֵ�������ַ���ʱ����Ԫ�������ȡ
[~,~,celldata] = xlsread('�ֿ�����.xlsx',1); 

% ����Ԫ�������е��ַ���
for i =1:len
    string = char(huojia(i,1));  % ��ǰԪ����Ԫ����ַ���
    string(1) = [];
    huojia(i,1) = {str2double(string)};
end