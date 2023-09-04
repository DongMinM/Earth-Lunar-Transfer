function xyz = oev2eci(oev,df)
%% input
% oev.a : orbit semi-axis
% oev.e : orbit eccentricity
% oev.i : orbit inclination
% oev.w : orbit argument of perigee
% oev.o : orbit right ascending angle
% oev.v : true anomaly of r1(one of position)
% df    : angle between r1, r2
%% Output
% xyz   : eci orbit between r1, r2
%
%


nu          =   linspace ( oev.v , oev.v+df , 1000 );
rorb        =   oev.a * ( 1 - oev.e * oev.e ) ./ ( 1 + oev.e * cos( nu ) );

p           =   rorb .* cos ( nu );
q           =   rorb .* sin ( nu );

ci          =   cos ( oev.i ); si = sin ( oev.i );
cw          =   cos ( oev.w ); sw = sin ( oev.w );
cr          =   cos ( oev.o ); sr = sin ( oev.o );

swci        =   sw * ci;
cwci        =   cw * ci;

xyz(1,:)    =   ( cw * cr - swci * sr ) * p + ( -sw * cr - cwci * sr ) * q;
xyz(2,:)    =   ( cw * sr + swci * cr ) * p + ( -sw * sr + cwci * cr ) * q;
xyz(3,:)    =   sw * si * p + cw * si * q;


end