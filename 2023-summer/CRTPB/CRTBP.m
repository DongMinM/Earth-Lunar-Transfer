function [mu,orb,orb_ECI,orb_centerECI,orb_otherECI,JC] = CRTBP(centerBody , secondBody, sat,step,stop)

G = 6.67384*10^-20;
M1 = centerBody.Mass;
M2 = secondBody.Mass;

% Non-dimensional variable
M_ = M1+M2;
l_ = 388000;
mu = M2 / M_;
w  = sqrt(G*M_/l_^3);
tau_ = 1/w;

% Non-dimensionalized vector
r1 = [-mu , 0 , 0]';
r2 = [1-mu, 0 , 0]';
r3 = r1 + sat.Ipos/l_;
v3 = sat.Ivel/l_*tau_ - cross([0,0,1],r1)';

% simulation step / stop
stop = round(stop/step);
step = step/tau_;

% solve
[orb,JC,orb_ECI,orb_centerECI,orb_otherECI] = rk89(@rframe_derived,step,stop,mu,r1,r2,r3,v3);
(orb(1:3,end)-r1)*l_
(orb(4:6,end) + cross([0,0,1],r1)')/tau_*l_

end

