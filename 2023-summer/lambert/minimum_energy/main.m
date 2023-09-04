%%%%%
% Minimum Energy Transfer
% input : initial position vector, final position vector
% output: minimum semi-axis transfer orbit
%%%%%

%% Input
clear
mu        =   398600;
ri = [7800,0,2000]';
rf = [8000,-5000,4000]';

rinorm = norm(ri);
rfnorm = norm(rf);

%% Algorithm
df      =   acos(dot(ri,rf)/(rinorm*rfnorm));
c       =   (rinorm^2+rfnorm^2-2*rinorm*rfnorm*cos(df))^0.5;
s       =   (rinorm+rfnorm+c)/2;
a_min   =   s/2;
p_min   =   rinorm*rfnorm/c*(1-cos(df));
e_min   =   (1-2*p_min/s)^0.5;

beta=2*asin(((s-c)/s)^0.5);
if df>pi
    beta=2*pi-beta;
end

t_amin=(a_min^3/mu)^0.5*(pi-beta+sin(beta));
v = (mu*p_min)^0.5 / (rinorm*rfnorm*sin(df)) * (rf-(1-rfnorm/p_min*(1-cos(df)))*ri);
orb = rk4(@dynamics,mu,ri,v,t_amin);

viewer;


