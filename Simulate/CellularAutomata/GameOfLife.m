%function  ca 
m=50;n=50;p=.7;h=100;    %  定义初始变量
for x=1:m
    for y=1:n 
        r=rand(1);       %  生成一个随机数
        if r>p           % 判断一下
           a(x,y)=1;     % 要是小了就是1  就是“生”
        else a(x,y)=0; 
        end
    end
end      %这个是定义初始的状态

for x=1:m 
    for y=1:n 
        if a(x,y)==1   % 这就是在全局去寻找的为1的元胞了
            fx=[x-1,x-1,x,x];fy=[y-1,y,y,y-1];fill(fx,fy,'y'),hold on    % 将当前为1的 元胞涂色
            % 这两个在一起拼接就是一个冯罗伊曼的邻居模型了
        end
    end
end 


for k=1:h 
    fx=[0,m,m,0];fy=[0,0,n,n];fill(fx,fy,'k'),hold on   
    for x=2:m-1 
        for y=2:n-1 
            b(x,y)=a(x-1,y-1)+a(x-1,y)+a(x-1,y+1)+a(x,y-1)+a(x,y+1)+a(x+1,y-1)+a(x+1,y)+a(x+1,y+1); % 这个是把找出了8个位置的元胞
            if b(x,y)==2,c(x,y)=a(x,y);    % 如果满足条件的话 就把元胞a的值赋给c 。而c同样也是
            elseif b(x,y)==3,c(x,y)=1;     % 如果满足条件的话 就把c的值赋值为 1 
            else c(x,y)=0; 
            end
        end
    end
    c(1:m,1)=a(1:m,1);c(1:m,n)=a(1:m,n);   % 
    for x=1:m 
        for y=1:n 
            if c(x,y)==1 
                fx=[x-1,x-1,x,x];fy=[y-1,y,y,y-1];fill(fx,fy,'y'),hold on 
            else 
            end
        end
    end
pause(2) 
 a=c;    %   最后把c 的值赋给a 然后在重新回去在去循环  再次进行整体的变化，。。
end 