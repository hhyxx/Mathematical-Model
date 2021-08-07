clc,clear,close;

load data.mat;
id= find(finor(:,5) ==0);
id = id'
uncom = finor(id(:),:);
y= uncom(:,2);x=uncom(:,3);


figure
%%
subplot(1,2,1)
plot(x,y,'o','markersize',15,'markeredgecolor','k','MarkerFaceColor',[36,200,255]/255),grid on;
title('聚类前二维点');xlabel('经度');ylabel('维度');
set(gca,'linewidth',1.5,'fontsize',18,'fontname','times')
axis([112.5 114.6 22.45 23.55])
%随机获取150个点
X = [x,y];
opts = statset('Display','final');
 
%调用Kmeans函数
%X N*P的数据矩阵
%Idx N*1的向量,存储的是每个点的聚类标号
%Ctrs K*P的矩阵,存储的是K个聚类质心位置
%SumD 1*K的和向量,存储的是类间所有点与该类质心点距离之和
%D N*K的矩阵，存储的是每个点与所有质心的距离;


[Idx,Ctrs,SumD,D] = kmeans(X,3,'Replicates',10,'Options',opts);

%%
%画出聚类为1的点。X(Idx==1,1),为第一类的样本的第一个坐标；X(Idx==1,2)为第二类的样本的第二个坐标
subplot(1,2,2)
color = [[36,200,255]/255;[36,10,255]/255;[36,200,55]/255];
for i=1:3
    plot(X(Idx==i,1),X(Idx==i,2),'o','markerfacecolor',color(i,:),'markeredgecolor','k','MarkerSize',15)
hold on
end


%绘出聚类中心点,kx表示是x
plot(Ctrs(:,1),Ctrs(:,2) , 'kx' , 'MarkerSize' , 22 , 'MarkerEdgeColor' ,'k','linewidth',14); 
grid on;
set(gca,'linewidth',1.5,'fontsize',18,'fontname','times')
title('聚类完成图')
xlabel('经度');ylabel('纬度');
legend('聚类 1','聚类 2','聚类 3','质心')
axis([112.5 114.6 22.45 23.55]); % 设置x、y轴刻度范围
 
% Ctrs
% SumD