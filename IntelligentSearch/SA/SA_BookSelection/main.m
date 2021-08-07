%% 模拟退火解决书店买书问题  % 466
clear; clc   
load book_data  % 这个文件一定要在当前文件夹下面

% 这个数据文件里面保存了两个矩阵：M是每本书在每家店的价格; freight表示每家店的运费
[s, b] = size(M);  % s是书店的数量，b是要购买的书的数量 

%% 参数初始化
T0 = 1000;   % 初始温度
T = T0; % 迭代中温度会发生改变，第一次迭代时温度就是T0
maxgen = 500;  % 最大迭代次数
Lk = 200;  % 每个温度下的迭代次数
alfa = 0.95;  % 温度衰减系数

%%  随机生成一个初始解
way0 = randi([1, s],1,b); % 在1-s这些整数中随机抽取一个1*b的向量，表示这b本书分别在哪家书店购买

%% 初始化用来保存中间结果的购买方案和花费
iter_way = way0; 
iter_money = cal(way0,freight,M,b);  % 调用我们自己写的cal函数计算这个方案的花费

%% 模拟退火过程
for iter = 1 : maxgen  % 外循环, 我这里采用的是指定最大迭代次数
    for i = 1 : Lk  %  内循环，在每个温度下开始迭代
        money0 = cal(way0,freight,M,b); % 调用我们自己写的cal函数计算这个方案的花费
        way1 = get(way0,s,b);  % 调用我们自己写的get函数生成新的方案
        money1 = cal(way1,freight,M,b); % 计算新方案的花费
        if money1 < money0    % 如果新方案的花费小于当前方案的花费
            way0 = way1; % 更新当前方案为新方案
            iter_way = [iter_way; way1]; % 将新找到的way1添加到中间结果中
            iter_money = [iter_money; money1];  % 将新找到的money1添加到中间结果中
        else
            p = exp(-(money1 - money0)/T); % 根据Metropolis准则计算一个概率
            if rand(1) < p   % 生成一个随机数和这个概率比较，如果该随机数小于这个概率
                way0 = way1;  % 更新当前方案为新方案
            end
        end
    end
    T = alfa*T;   % 温度下降       
end


[best_money, ind] = min(iter_money);  % 找到最小的花费的值，以及其在向量中的下标
min_way = iter_way(ind,:); % 根据下标找到此时方案
disp('最佳的方案是：'); disp(min_way)
disp('此时最优值是：'); disp(best_money)

