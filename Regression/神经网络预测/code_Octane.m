
load data_Octane.mat

% ����ѵ��������������ģ�Ͷ����ݽ���Ԥ��
% ��������ҪԤ����Ϊ51�����������Ӧ��401�������Ϊ��new_X(1,:)
% sim(net, new_X(1,:))
% ����ʹ�� network/sim (line 266)
% Input data sizes do not match net.inputs{1}.size.
% net.inputs{1}.size


% дһ��ѭ����Ԥ���������ʮ������������ֵ
predict_y = zeros(10,1); % ��ʼ��predict_y
for i = 1: 10
    result = sim(net, new_X(i,:)');% ���뽫ָ���Ϊ��������Ȼ������sim����Ԥ��
    predict_y(i) = result;
end
disp('Ԥ��ֵΪ��')
disp(predict_y)
