function [a_min,t_amin] = minimum_lambert(mu, r1, r2)

%% Substitution parameters
c = norm(r2-r1);
df = acos(dot(r1,r2) / ( norm(r1) * norm(r2) ));
s = (norm(r1)+norm(r2)+c)/2;

%% Miminum semi axis solution (Max TOF)
a_min   =   s/2;
beta=2*asin(((s-c)/s)^0.5);
if df>pi
    beta=2*pi-beta;
end
t_amin=(a_min^3/mu)^0.5*(pi-beta+sin(beta));

end

