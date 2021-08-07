
figure(1)  
hold on
x=1:10;
y=sin(x);
plot(x,y,'ok-','MarkerSize',8,'MarkerFaceColor',[36,200,255]/255,'markeredgecolor','b','linewidth',1.3,'color',[36,169,255]/255); % ok- line between two points
set(gca,'linewidth',1.5,'fontsize',18,'fontname','times')

xlabel('x');
ylabel('y');
grid on 
title('head of the map');
legend('right label for var');


plot(x,y,'o','MarkerSize',15,'MarkerFaceColor',[36,169,255]/255);
plot([x1,x2],[y1,y2],'-','linewidth',1.3,'color','k','HandleVisibility','off');    
grid on 
title('设置图表标题');
legend('图例标记1','图例标记2');
xlabel('x轴标记');ylabel('y轴标记');
axis([x x上界 y下界 y上界]); % 设置x、y轴刻度范围
hold on

[255,80,10]/255 % 橙色
[36,169,255]/255 % 蓝色


