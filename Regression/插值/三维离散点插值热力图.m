clc,clear,close;
load data.mat;

% x=finor(:,2);y=finor(:,3);z=finor(:,4);
% tmp = [x,y,z];
% x=x';y=y';z=z';
% % xi = 22.5:0.0001:24; yi=112.5:0.0001;114.5;
% % zi = griddata(x,y,z,xi,yi);	
% % figure(1),meshc(x,y,z);
% [X,Y,Z]=griddata(x,y,z,linspace(min(x),max(x))',linspace(min(y),max(y)),'nearest');%��ֵ
% figure(2),surf(X,Y,Z)%��ά����


x = finor(:,3);y=finor(:,2);z=finor(:,4); % ԭ��ά����

x_ = min(x(:,:)):(max(x)-min(x))/500:max(x(:,:));
y_ = min(y(:,:)):(max(y)-min(y))/500:max(y(:,:));
[xi,yi] = meshgrid(x_,y_);

zi = griddata(x , y , z , xi , yi , 'cubic');  %���������ַ��� linear cubic v4 ��������ѡ��
figure(1)
scatter3(x,y,z,'b^'); % ��άɢ��
hold on;
meshc(xi , yi , zi); % ���ȸ��ߵ���άͼ
hold on
colorbar; % ��ʾ����ֵ�����
hold on;
shading interp 
% �⻬����  
% shading interp ��⻬
% shading flat �Ϲ⻬
% shading faceted ���ܹ⻬
hold on
title('���񶨼ۿ��ӻ�');
xlabel('����');ylabel('γ��');zlabel('�����۸�');
