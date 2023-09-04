function [oev, h_dir, e_vector] = classic_lambert(mu, r1, r2, TOF_target, a_init, a_min)
%% (INPUT)
% mu          : gravity constant of centric planet
% r1, r2      : Two position vectors
% TOF_target  : tof from r1 to r2
% a_init      : initial condition for lambert problem
% a_min       : minimum semi-axis solution of lambert problem
%% (OUTPUT)
% oev         : keplerian 6 orbit elements
% h_dir       : anguler momentum of transfer orbit
% e_vector    : eccentricity vector of transfer orbit



%% (Init) 6 Elements of transfer orbit
oev.a  = 0;
oev.e  = 0;
oev.i  = 0;
oev.w  = 0;
oev.o  = 0;
oev.v  = 0;


%% semi axis
% semi axis is function of time of filght
oev.a = find_semiaxis(mu, r1, r2, TOF_target, a_init, a_min);


%% eccentricity & true anomaly
% Can find from orbit equation of two positions
[oev.e, oev.v] = find_ecc_ano(mu,r1,r2,oev.a);


%% inclination
% can find normal vector of anguler momentum from two position vectors
h_dir = cross( r1 , r2 ) / ( norm( r1 ) * norm( r2 ) );
oev.i = acos( dot( [0,0,1] , h_dir ) / norm( h_dir ) );


%% ascending node
% Can find normal vector of node vector from normal vector of anguler
% momentum
n_dir = cross([0,0,1],h_dir);
oev.o = atan2(n_dir(2),n_dir(1));


%% argument of perigee
rot = acos(dot(n_dir,r1)/(norm(n_dir)*norm(r1)));
rot_dir = cross(n_dir,r1)'./h_dir;

if rot_dir(1) < 0
    rot = 2*pi-rot;
end

oev.w = rot-oev.v;

e_vector = quternion_rot(n_dir', h_dir,-oev.w);
end
% End function


