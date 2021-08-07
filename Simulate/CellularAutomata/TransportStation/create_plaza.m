function [plaza, v, time] = create_plaza(B, L, plazalength)    %这个就是收费区矩阵了
%                 1 = 有车, 0 = 为空, -1 = 禁止, -3 = 收费站
%
%        B = 收费站个数12
%        L = 车道数6
%        plazalength = 收费区长度   
plaza = zeros(plazalength,B+2); % 两边边界    本意就是一个全0 矩阵“plazalength”行*“B+2”列的   为什么是加2呢！就是因为是两边都要加才是加二
v = zeros(plazalength,B+2); % 速度状态矩阵初始化    ？ 为什么速度与时间的初始化的矩阵与两边边界的矩阵是一样的？
time = zeros(plazalength,B+2); % 时间状态矩阵初始化     因为plaza是收费区的矩阵，当然要这样的定义这样呀

plaza(1:plazalength,[1,2+B]) = -1;%定义两边边界   -1是静止，    ! 从第1行到plazalength行， 再从第1列和2+B列， 这就是最外边，所以定义为-1 就是静止，
       % 这里要注意的 matlab里面的 [ , ] 不是表示范围的，而是单个的数，所以这里的时表示1和2+B 
       %但是如果是[ ：]这就是表示范围了
       
plaza(ceil(plazalength/2),[2:1+B]) = -3;%定义收费站的位置   ciel取朝正无穷大四舍五入  !就是说取最中间的行，作为收费站的位置，
          %                这里定义收费站的范围了

          
toptheta = 1.3; %顶角     我们知道1表示有车是不是，这个是1.3有什么含义呢额？
bottomtheta = 1.2;%底角

%左边
%上
for col = 2:ceil(B/2-L/2)+1     %  就是2 3 4 
    for row = 1:(plazalength-1)/2 - floor(tan(toptheta) * (col-1))  
            %     floor(tan(toptheta) * (col-1)   3 7 10   ？？ 但是我觉得有点问题 ？？
        plaza(row, col) = -1;    %  将上面的区域变成-1    col 表示列 ；  row 表示行
    end
%下
    for row = 1:(plazalength-1)/2 - floor(tan(bottomtheta) * (col-1))
        plaza(plazalength+1-row, col) = -1;   %就是下面的了
    end
end     %上面全部都是表示


fac = ceil(B/2-L/2)/floor(B/2-L/2);  %这个直接定义不行吗？？直接定义是为 1
%右边
toptheta = atan(fac*tan(toptheta));
bottomtheta = atan(fac*tan(bottomtheta));

for col = 2:floor(B/2-L/2) + 1
    for row = 1:(plazalength-1)/2 - floor(tan(toptheta) * (col-1))
        plaza(row,B+3-col) = -1;
    end
    for row = 1:(plazalength-1)/2 - floor(tan(bottomtheta) * (col-1))
        plaza(plazalength+1-row,B+3-col) = -1;
    end 
end      %   不知道是 不理解这个代码  还是什么  这下面于上面是对称的呀   为什么要这样的麻烦呢？？？