%% For using gauss-newton method
%  
% r1 = a(1-e^2)/(1+ecos(n));
% r2 = a(1-e^2)/(1+ecos(n+df));
% eccentricity, true anomaly에 따른 r1 , r2 분포 확인

%% (Init) Inputs
clear
mu          =   398600;
r1          =   [-7100,2000,2000]';
r2          =   [8000,-5000,4000]';
df = acos(dot(r1,r2) / ( norm(r1) * norm(r2) ));
a = 9.270625076158285e+03;

% Solution for above I.C
% e = 0.471195122830780
% nu = 1.648472623352548

pnt_number = 200;

%% Domain space
e = linspace(0,1,pnt_number);
n = linspace(0,2*pi,pnt_number);

%% Cal Oribit
rr  = zeros(pnt_number,pnt_number);
rr2 = zeros(pnt_number,pnt_number);

for i = 1:pnt_number
    rr(i,:)  = a*(1-e(i)^2)./(1+e(i)*cos(n));
    rr2(i,:) = a*(1-e(i)^2)./(1+e(i)*cos(n+df));
end

%% meshgrid
[x,y] = meshgrid(n,e);
r_i = ones(pnt_number,pnt_number)*norm(r1);
r_f = ones(pnt_number,pnt_number)*norm(r2);
z = zeros(pnt_number,pnt_number);


%% (View) Contour of Roots
figure(1)
contour(x,y,rr-r_i,'LevelList',0,'Color','k','DisplayName','root of r1')
hold on
contour(x,y,rr2-r_f,'LevelList',0,'Color','b','DisplayName','root of r2')
hold off
xlabel('True anomaly [rad]')
ylabel('Eccentricity')
grid on
title("Contour of Roots")
legend('Location','best')

%% (View) Shape of Function
figure(2)
surf(x,y,rr-r_i,'FaceAlpha',0.5,'FaceColor','k','EdgeColor','none','DisplayName','r1')
hold on
surf(x,y,rr2-r_f,'FaceAlpha',0.5,'FaceColor','b','EdgeColor','none','DisplayName','r2')
surf(x,y,z,'EdgeColor','none','FaceColor',[0.8,0.8,0],'DisplayName','root')
hold off
xlabel('True anomaly [rad]')
ylabel('Eccentricity')
title("Shape of Function")
legend('Location','best')