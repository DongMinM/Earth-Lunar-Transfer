function x = rk4(equation, step,stop, mu, r1,r2,r3,v)
%% Solve Differential Equation by Runge Kutta 4th order

x = zeros(6,stop);
x(:,1) = [r3;v];

for i = 1:stop
   
    k1 = step * equation(mu,r1,r2,x(:,i));
    k2 = step * equation(mu,r1,r2,x(:,i) + k1/2);
    k3 = step * equation(mu,r1,r2,x(:,i) + k2/2);
    k4 = step * equation(mu,r1,r2,x(:,i) + k3);

    x(:,i+1) = x(:,i) + (k1 + 2 * k2 + 2 * k3 + k4)/6;
end


end