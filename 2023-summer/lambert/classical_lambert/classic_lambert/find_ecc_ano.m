function [e, v] = find_ecc_ano(mu,r1,r2,a)

%% Gauss - Newtom metion
% f1 = a(1-e^2)/(1+ecos(n   )) - r1 = 0
% f2 = a(1-e^2)/(1+ecos(n+dn)) - r2 = 0
% Given : a, dn
% Find  : e, n


%% (Init) I.C
e = 0.6;
v = 0.5*pi;
dv = acos(dot(r1,r2) / ( norm(r1) * norm(r2) ));
x = [e,v]';

%% Gauss Newton
while true
    
    error = (f(a,e,v,dv) - [norm(r1);norm(r2)])
    % inv(A)*b = A\b. 동일
    x = x-(gradiant(a,e,v,dv))\error;
    e = x(1);
    v = x(2);

    if abs(error) < 1e-8
        break
    end

end





end
% End function


%% Object function
function out = f(a,e,v,dv)
    
    out = zeros(2,1);
    out(1) = a*(1-e^2)/(1+e*cos(v   ));
    out(2) = a*(1-e^2)/(1+e*cos(v+dv));

end

%% Gradiant of function
function grad = gradiant(a,e,v,dv)

grad = [-a*(2*e+(1+e^2)*cos(v))    / (1+e*cos(v))^2,    a*(1-e^2)*e*sin(v)    / (1+e*cos(v))^2;...
        -a*(2*e+(1+e^2)*cos(v+dv)) / (1+e*cos(v+dv))^2, a*(1-e^2)*e*sin(v+dv) / (1+e*cos(v+dv))^2];

end