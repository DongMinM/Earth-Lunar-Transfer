function tof = find_TOF(mu,c,df,s,a)

% Get Parameter
% 범위 공부 필수.
alpha = 2 * asin( sqrt( s / (2*a) ) );
beta  = 2 * asin( sqrt( (s-c) / (2*a) ) );

% Range of beta
if df > pi
    beta = 2*pi-beta;
end

% Calculate time of flight
tof = a^(3/2) * ((alpha - sin(alpha))-(beta-sin(beta))) / sqrt(mu);

end
% End function

