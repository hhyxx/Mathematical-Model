
figure(1);
stem(x,y,'markersize',8,'markerfacecolor',[255,80,10]/255,'markeredgecolor',[255,80,10]/255,'linewidth',1.3,'color',[36,169,255]/255);
grid on 
title('设置图表标题');
legend('图例标记1','图例标记2');
xlabel('x轴标记');ylabel('y轴标记');
axis([x下界 x上界 y下界 y上界]); % 设置x、y轴刻度范围
hold on