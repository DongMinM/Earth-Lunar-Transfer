function out = rframe_derived(mu,r1,r2,posV)
x = posV(1);
y = posV(2);
z = posV(3);

x_dot = posV(4);
y_dot = posV(5);
% z_dot = posV(6);

r3 = posV(1:3);
v = posV(4:6);

r13 = r3 - r1;
r23 = r3 - r2;
r_13 = sqrt(r13' * r13);
r_23 = sqrt(r23' * r23);


a = zeros(3,1);
r_13_3 = r_13^3;
r_23_3 = r_23^3;

a(1,1) =  2*y_dot + x - (1-mu)*(x+mu)/r_13_3 - mu*(x-1+mu)/r_23_3;
a(2,1) = -2*x_dot + y - (1-mu)*y/r_13_3      - mu*y/r_23_3;
a(3,1) =              - (1-mu)*z/r_13_3      - mu*z/r_23_3;

out = [v;a];

end

