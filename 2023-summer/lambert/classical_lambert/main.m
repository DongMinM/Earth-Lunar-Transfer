clear
addpath("classic_lambert\","minimun_lambert\","utility\")

%% Inputs
mu          =   398600;
r1          =   [-7100,2000,2000]';
r2          =   [-7000,-5000,4000]';
TOF_target  =   2000;
a_init      =   3000;


%% Minimum Case
[a_min,t_amin] = minimum_lambert( mu , r1, r2 );
if a_init < a_min || TOF_target > t_amin
    disp("error");
end


%% Classical Case
tolerance_of_tof = 1e-9; % seconds
[oev,h_normv,e_vector] = classic_lambert(mu, r1, r2, TOF_target, a_init, a_min);


%% Draw Orbit between r1, r2 ( oev.v ~ oev.v + df )
df = acos(dot(r1,r2)/(norm(r1)*norm(r2)));
orbit = oev2eci(oev,df);


%% Viewer
viewer;
