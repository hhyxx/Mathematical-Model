# Mathematical-Model

## 1 建模分析
模型的建立
+ 描述或解释现实世界
    + 机理分析法研究事物的内在规律
+ 预测、预报
    + 概率统计、优化理论、模拟计算
+ 优化管理、决策、控制
    + 引入量化的评价指标和评价方法

解的分析与检验
+ 对解的实际意义进行分析
    + 即模型的解在实际意义中说明了什么、效果怎样、模型适用范围如何
    + 误差分析和灵敏度分析
+ 误差产生原因
    + 模型假设引起的误差
    + 近似求解方法引起的误差
    + 计算机舍入问题产生的误差
    + 数据本身的误差
+ 灵敏度分析
    +  给参数一个很小的扰动，看结果的扰动是否也很小
----
## 2 算法学习
+ matlab 基础
    + [数据预处理](https://www.cnblogs.com/hhyx/p/13516029.html) 
    + [随机数据的生成](https://www.cnblogs.com/hhyx/p/13531589.html) 
    + 画图工具
+ 计算机模拟
    + 蒙特卡洛模拟
    + [元胞自动机](https://github.com/hhyxx/Mathematical-Model/tree/main/Simulate/CellularAutomata)
+ [数据挖掘](https://github.com/hhyxx/Mathematical-Model/tree/main/Clustering)
    + [k-means 聚类](https://github.com/hhyxx/Mathematical-Model/blob/main/Clustering/kmean.m)
    + [DBCAN 聚类](https://github.com/hhyxx/Mathematical-Model/tree/main/Clustering/DBSCAN)
    + 机理性聚类
+ 数据处理、数理统计
    + 参数估计、假设检验
    + 回归：得到数据函数
    + [拟合](https://www.cnblogs.com/hhyx/p/13401503.html)：根据已有数据拟合函数
    + [插值](https://www.cnblogs.com/hhyx/p/13401503.html)：根据已有数据得到函数，得到在某些离散点的取值
+ 数学规划问题求解
    + 线性规划
    + 非线性规划
    + 整数规划
+ 多元分析、降维
    + [主成分分析](https://www.cnblogs.com/hhyx/p/13514752.html)
        + [代码](https://github.com/hhyxx/Mathematical-Model/tree/main/DimensionalityReduction/PCA)
    + [相关系数](https://github.com/hhyxx/Mathematical-Model/tree/main/DimensionalityReduction/CorrelationCoefficient)
+ 回归分析
    + 多元回归分析
    + $logicstic$ 回归 
+ 综合评价模型
    + [层次分析法](https://www.cnblogs.com/hhyx/p/13137480.html)：用于未给定数据但需要进行评价
    + [熵权法](https://www.cnblogs.com/hhyx/p/13552610.html)：用于确定各个指标的权重
        + [代码](https://github.com/hhyxx/Mathematical-Model/tree/main/Evaluation/EntropyMethod)
    + [TOPSIS距离法](https://www.cnblogs.com/hhyx/p/13554605.html)：用于得到最后的综合排名
        + [代码](https://github.com/hhyxx/Mathematical-Model/tree/main/Evaluation/Topsis)
    + [灰色关联分析](https://github.com/hhyxx/Mathematical-Model/tree/main/Evaluation/GreyRelationalAnalysis)
+ [排队论](https://www.cnblogs.com/hhyx/p/13524728.html) 
    + [常用的分布函数](https://www.cnblogs.com/hhyx/p/13517768.html) 
+ [图论](https://github.com/hhyxx/Mathematical-Model/tree/main/Graph)
    + 最短路
        + `Floyd`
        + `Dijkstra`
        + `Spfa`     
    + [网络流](https://www.cnblogs.com/hhyx/p/13558459.html) 
+ [具有单调性的最优求解]()
    + [二分](https://github.com/hhyxx/Mathematical-Model/tree/main/MonotonicFunctionBestAnswer/matlab/%E4%BA%8C%E5%88%86)
    + 黄金分割三分
        + [cpp](https://github.com/hhyxx/Mathematical-Model/blob/main/MonotonicFunctionBestAnswer/c%2B%2B/%E9%BB%84%E9%87%91%E5%88%86%E5%89%B2%E6%B3%95.cpp)
        + [matlab](https://github.com/hhyxx/Mathematical-Model/tree/main/MonotonicFunctionBestAnswer/matlab/%E9%BB%84%E9%87%91%E5%88%86%E5%89%B2%E4%B8%89%E5%88%86%E6%B3%95)
    + [加步探索](https://github.com/hhyxx/Mathematical-Model/tree/main/MonotonicFunctionBestAnswer/matlab/%E5%8A%A0%E6%AD%A5%E6%8E%A2%E7%B4%A2%E6%B3%95)
    + [最速下降](https://github.com/hhyxx/Mathematical-Model/tree/main/MonotonicFunctionBestAnswer/matlab/%E6%9C%80%E9%80%9F%E4%B8%8B%E9%99%8D%E6%B3%95)
    + [抛物线插值法](https://github.com/hhyxx/Mathematical-Model/blob/main/MonotonicFunctionBestAnswer/c%2B%2B/%E6%8A%9B%E7%89%A9%E7%BA%BF%E6%8F%92%E5%80%BC.cpp)


+ 智能算法
    + [模拟退火](https://github.com/hhyxx/Mathematical-Model/tree/main/IntelligentSearch/SA)
    + [粒子群算法](https://github.com/hhyxx/Mathematical-Model/tree/main/IntelligentSearch/PSO)
    + [遗传算法](https://github.com/hhyxx/Mathematical-Model/tree/main/IntelligentSearch/GeneticAlgorithm)
+ [数值积分](https://www.cnblogs.com/hhyx/p/13577891.html)
