function y = lagrange(x0,y0,x);
	n=length(x0); % 样本自变量的取值
	m=length(x); % 待插值

	for i = 1:m
		z = x(i);
		s = 0.0;
		for k = 1:n
			p = 1.0;
			for j = 1:n
				if j ~= k
					p = p*(z-x0(j))/(x0(k)-x0(j));
				end
			end
			s=p*y0(k)+s;
		end
		y(i)=s;
	end