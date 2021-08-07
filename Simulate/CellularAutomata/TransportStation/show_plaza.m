function h = show_plaza(plaza, h, n)
% show_plaza 将收费区矩阵转化为图片
%        plaza = 收费区矩阵
%                1 = 有车, 0 = 为空, -1 = 禁止, -3 = 收费站
%        h = 句柄      我还是不理解什么是 句柄 
%        n = 时间间隔
[L W] = size(plaza);     %   读出这个矩阵的大小   将值带入到 L M 中去 
temp = plaza;%构造临时矩阵
temp(temp==1) = 0;     %将在矩阵里面的为1的 全部改成为0  但是这个矩阵里面也没有为1的位置呀   很闷比

PLAZA(:,:,1) = plaza;%构造三维矩阵
PLAZA(:,:,2) = plaza;
PLAZA(:,:,3) = temp;        %  很闷比  还不知道这个是3维的呢  一看 也叫三维呀

 PLAZA = 1-PLAZA;%调灰度，0，1，2，4    %  fx 把其相减  就变成了2 与1的 矩阵了  但是为什么我没有看到4 呀
 
 PLAZA(PLAZA>1)=PLAZA(PLAZA>1)/6;  % 0，0.1666，0.333，0.666；>1    
    %  PLAZA(PLAZA>1) 是表示提出其中大于1的数组。
 
if ishandle(h)%有效图形测试
    set(h,'CData',PLAZA)     
    pause(n)     %又来了  还是不理解这个呀
else
    figure('position',[100,50,200,700])%图片显示的位置  就是在整个屏幕中去定义位置
    h = image( PLAZA);  %RGB画图 
    hold on
    % 画网格线
    plot([[0:W]',[0:W]']+0.5,[0,L]+0.5,'k')      %这里面的k 是表示颜色
    plot([0,W]+0.5,[[0:L]',[0:L]']+0.5,'k')         %  画图
    axis image
    set(gca, 'xtick', [], 'ytick', []);  
    pause(n)
end