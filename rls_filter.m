function [y,e] = rls_filter(d,x)

lambda = 0.99;    % Forgetting factor
delta  = 0.1;
M = 8;            % Filter order
N = length(d);

w = zeros(M,1);
P = (1/delta)*eye(M);

y = zeros(1,N);
e = zeros(1,N);

for n = M:N
    x_vec = x(n:-1:n-M+1).';
    y(n)  = w.' * x_vec;
    e(n)  = d(n) - y(n);
    k     = (P*x_vec)/(lambda + x_vec.'*P*x_vec);
    w     = w + k*e(n);
    P     = (P - k*x_vec.'*P)/lambda;
end

end


