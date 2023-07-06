function JC = getJC(mu,rv)

r = rv(1:3);
v = rv(4:6);

r1 = [-mu,0,0]';
r2 = [1-mu,0,0]';


r_13 = norm(r-r1);
r_23 = norm(r-r2);

JC = -sum(v.^2) + r(1)^2 + r(2)^2 + 2*(1-mu)/r_13 + 2*mu/r_23;


end

