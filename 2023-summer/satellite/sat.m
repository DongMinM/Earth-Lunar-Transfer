function sat = sat()

sat = {};

% Keplerian Orbit elements
sat.a       = 6900;
sat.ecc     = 0;
sat.inc     = 0;
sat.argper  = 0;
sat.raan    = 0;
sat.f       = 0;

% UTC Date ( epoch date )
year    = 2023;
mon     = 6;
day     = 9;
hour    = 3;
min     = 10;
sec     = 0;
sat.UTCdate = [year,mon,day,hour,min,sec];

theta = 70*pi/180;

r = 6874;
v = 10.62;

sat.Ipos = [r*cos(theta),-r*sin(theta),0]';
sat.Ivel = [v*sin(theta),v*cos(theta),0]';

% sat.Ipos =    1.0e+05 *[0.435218492675022,...
%    1.905080000000000,...
%                    0]';
% sat.Ivel =   [-0.713951619120904,...
%    0.726363886903592,...
%                    0]';

end