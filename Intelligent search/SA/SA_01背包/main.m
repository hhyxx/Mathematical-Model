%% 模拟退火求解背包问题
% 因为这题只有十个物品，用枚举法其实也能做出来（答案2410）
% 建模中遇到了背包问题还是用 intlinprog 函数哦~这题只是训练大家的编程和建模的思维


profit = [540 200 180 350 60 150 280 450 320 120];  % 每件物品的利润
weight = [6 3 4 5 1 2 3 5 4 2];  % 每件物品的重量

max_weight = 30;  % 最大装载重量 
n = length(profit); % 物品个数

%% 参数初始化
T0 = 1000;   % 初始温度
T = T0; % 迭代中温度会发生改变，第一次迭代时温度就是T0
Mx = 500;  % 最大迭代次数
Lk = 200;  % 每个温度下的迭代次数
alpha = 0.95;  % 温度衰减系数

%%  生成初始解
way0 = zeros(1,n); % 初始解中每个元素都为0，表示一件物品都不装

%% 初始化用来保存中间结果的装载方案和利润
iter_way = way0; 
iter_profit = sum(way0 .* profit);  % 计算这个装载方案的利润

%% 模拟退火过程
for iter = 1 : Mx  % 外循环, 我这里采用的是指定最大迭代次数
    for i = 1 : Lk  %  内循环，在每个温度下开始迭代
        profit0 = sum(way0 .* profit); % 计算这个装载方案的利润
        weight0 = sum(way0 .* weight); % 计算这个装载方案的重量
        [way1, delta_weight] = gen_new_way(way0, n, weight);  % 调用我们自己写的gen_new_way函数生成新的装载方案
        profit1 = sum(way1 .* profit); % 计算新装载方案的利润
        if weight0 + delta_weight > max_weight    % 如果超重了，就不操作
            [];  % 空语句，相当于啥都不干
        elseif profit1 > profit0  % 如果没有超重,而且新装载方案的利润更高
            way0 = way1; % 更新当前装载方案为新装载方案
            iter_way = [iter_way; way1]; % 将新找到的way1添加到中间结果中
            iter_profit = [iter_profit; profit1];  % 将新找到的profit1添加到中间结果中
        else
            p = exp(-(profit0 - profit1)/T); % 根据Metropolis准则计算一个概率
            if rand(1) < p   % 生成一个随机数和这个概率比较，如果该随机数小于这个概率
                way0 = way1;  % 更新当前装载方案为新装载方案
            end
        end
    end
    T = alpha*T;   % 温度下降       
end


[best_profit, index] = max(iter_profit);  % 找到最大的利润，以及其在向量中的下标
 max_way = iter_way(index,:); % 根据下标找到此时装载方案
disp('最佳的方案是：'); disp(max_way)
disp('此时最优值是：'); disp(best_profit)


