function f = fun6(delta)   % 决策变量delta为六架飞机调整的角度
   %         f =sum(abs(delta)) * 180 /  pi;   % 目标函数第一种定义：绝对值的和（将弧度转换为度数）
  f = sum(delta .* delta) * (180 /  pi)^2;  % 目标函数第二种定义：平方和（将弧度转换为度数）
end

