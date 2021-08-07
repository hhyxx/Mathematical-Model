clc,clear,close;
load data.mat;

% x=finor(:,2);y=finor(:,3);z=finor(:,4);
% tmp = [x,y,z];
% x=x';y=y';z=z';
% % xi = 22.5:0.0001:24; yi=112.5:0.0001;114.5;
% % zi = griddata(x,y,z,xi,yi);	
% % figure(1),meshc(x,y,z);
% [X,Y,Z]=griddata(x,y,z,linspace(min(x),max(x))',linspace(min(y),max(y)),'nearest');%插值
% figure(2),surf(X,Y,Z)%三维曲面


x = finor(:,3);y=finor(:,2);z=finor(:,4); % 原三维数据

x_ = min(x(:,:)):(max(x)-min(x))/500:max(x(:,:));
y_ = min(y(:,:)):(max(y)-min(y))/500:max(y(:,:));
[xi,yi] = meshgrid(x_,y_);

zi = griddata(x , y , z , xi , yi , 'cubic');  %这里有三种方法 linear cubic v4 可以自行选择
figure(1)
scatter3(x,y,z,'b^'); % 三维散点
hold on;
meshc(xi , yi , zi); % 带等高线的三维图
hold on
colorbar; % 显示热力值区间棒
hold on;
shading interp 
% 光滑处理  
% shading interp 最光滑
% shading flat 较光滑
% shading faceted 不很光滑
hold on
title('任务定价可视化');
xlabel('经度');ylabel('纬度');zlabel('订单价格');
