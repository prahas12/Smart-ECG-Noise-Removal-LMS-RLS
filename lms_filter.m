function [y,e] = lms_filter(d,x)

mu = 0.01;        % Step size
M  = 8;           % Filter order
N  = length(d);

w = zeros(M,1);
y = zeros(1,N);
e = zeros(1,N);

for n = M:N
    x_vec = x(n:-1:n-M+1).';
    y(n)  = w.' * x_vec;
    e(n)  = d(n) - y(n);
    w     = w + mu * e(n) * x_vec;
end

end


