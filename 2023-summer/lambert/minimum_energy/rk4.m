function x = rk4(equation,mu,r,v,t_amin)
%% Solve Differential Equation by Runge Kutta 4th order

step = 1;
stop = round(t_amin);

x = zeros(6,stop);
x(:,1) = [r;v];

for i = 1:stop
   
    k1 = step * equation(mu,x(:,i));
    k2 = step * equation(mu,x(:,i) + k1/2);
    k3 = step * equation(mu,x(:,i) + k2/2);
    k4 = step * equation(mu,x(:,i) + k3);

    x(:,i+1) = x(:,i) + (k1 + 2 * k2 + 2 * k3 + k4)/6;
end


end