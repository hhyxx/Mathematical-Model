

clc,clear
% x表示显示的行数，y表示显示的列数，n表示第几个图片
% subplot(x,y,n) 
figure
hold on
x = [0:0.5:10];
y = [0:0.5:10];

%%
subplot(2 , 2 , 1);
plot(x,y,'ok-','MarkerSize',12,'MarkerFaceColor',[0,153,204]/255,'markeredgecolor','k','linewidth',1.3,'color',[0,76,128]/255);
xlabel('x');
ylabel('y');
set(gca,'linewidth',1.5,'fontsize',18,'fontname','times')
grid on 

%%
subplot(2 , 2 , 2) 
plot(x,y,'ok-','MarkerSize',12,'MarkerFaceColor',[0,153,204]/255,'markeredgecolor','k','linewidth',1.3,'color',[0,76,128]/255); 
xlabel('x');
ylabel('y');
set(gca,'linewidth',1.5,'fontsize',18,'fontname','times')
grid on 

%%
subplot(2 , 2 , 3)
plot(x,y,'ok-','MarkerSize',12,'MarkerFaceColor',[0,153,204]/255,'markeredgecolor','k','linewidth',1.3,'color',[0,76,128]/255); 
xlabel('x');
ylabel('y');
set(gca,'linewidth',1.5,'fontsize',18,'fontname','times')
grid on 

%%
subplot(2 , 2 , 4)
plot(x,y,'ok-','MarkerSize',12,'MarkerFaceColor',[0,153,204]/255,'markeredgecolor','k','linewidth',1.3,'color',[0,76,128]/255); 
xlabel('x');
ylabel('y');
set(gca,'linewidth',1.5,'fontsize',18,'fontname','times')
grid on 



