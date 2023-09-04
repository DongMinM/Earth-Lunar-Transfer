function [orb,JC,orb_ECI,orb_centerECI,orb_otherECI] = rk89(equation, step,stop, mu, r1,r2,r3,v)

orb = zeros(6,stop);
orb(:,1) = [r3;v];
orb_ECI = zeros(3,stop);
orb_centerECI = zeros(3,stop);
orb_otherECI = zeros(3,stop);
JC = zeros(6,stop);
orb_centerECI(:,1) = [-mu,0,0]';
orb_otherECI(:,1) = [1-mu,0,0]';
JC(:,1) = getJC(mu,[r3;v]);
for i=2:stop
    %% Non-dimensional dynamics
    rv = orb(:,i-1);

    k1  = step * equation(mu,r1,r2,rv);
    k2  = step * equation(mu,r1,r2,rv + (4/27)  * k1);
    k3  = step * equation(mu,r1,r2,rv + (1/18)  *(k1+3*k2));
    k4  = step * equation(mu,r1,r2,rv + (1/12)  *(k1+3*k3));
    k5  = step * equation(mu,r1,r2,rv + (1/8)   *(k1+3*k4));
    k6  = step * equation(mu,r1,r2,rv + (1/54)  *(13*k1-27*k3+42*k4+8*k5));
    k7  = step * equation(mu,r1,r2,rv + (1/4320)*(389*k1-54*k3+966*k4-824*k5+243*k6));
    k8  = step * equation(mu,r1,r2,rv + (1/20)  *(-231*k1+81*k3-1164*k4+656*k5-122*k6+800*k7));
    k9  = step * equation(mu,r1,r2,rv + (1/288) *(-127*k1+18*k3-678*k4+456*k5-9*k6+576*k7+4*k8));
    k10 = step * equation(mu,r1,r2,rv + (1/820) *(1481*k1-81*k3+7104*k4-3376*k5+72*k6-5040*k7-60*k8+720*k9));

    JC(:,i) = getJC(mu,rv);
    orb(:,i) = rv + 1/840*(41*k1+27*k4+272*k5+27*k6+216*k7+216*k9+41*k10);


    %% Rotation frame -> Inertial
    theta = -i*step;
    DCM = [ cos(theta), sin(theta), 0;...
           -sin(theta), cos(theta), 0;...
            0,          0,         1    ];

    orb_ECI(:,i)    = DCM*rv(1:3);
    orb_centerECI(:,i) = DCM*[-mu,0,0]';
    orb_otherECI(:,i)  = DCM*[1-mu,0,0]';
    
    

end


end