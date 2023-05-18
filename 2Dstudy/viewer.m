% Lunar SOI
theta = linspace(0,2*pi,100);
x_soi = lunar_SOI*cos(theta)+lunar_posATinj(1);
y_soi = lunar_SOI*sin(theta)+lunar_posATinj(2);

xe_mission = (Rmission+R_lunar)*cos(theta)+lunar_posATinj(1);
ye_mission = (Rmission+R_lunar)*sin(theta)+lunar_posATinj(2);

xl_mission = (Rmission+R_lunar)*cos(theta);
yl_mission = (Rmission+R_lunar)*sin(theta);


% Tricky Lunar position at transfer time
lunar_w         =   [0,0,2*pi / (27*24*3600)];
l = length(y_trans);
lunar_position(:,l+1) = lunar_posATinj;
lunar_velocity(:,l+1) = cross(lunar_w,lunar_posATinj);

for i = 1:l
    lunar_position(:,l+1-i) = lunar_position(:,l+2-i) - lunar_velocity(:,l+2-i)*dt';
    lunar_velocity(:,l+1-i) = cross(lunar_w,lunar_position(:,l+2-i))';
end

% All lunar position
lunar_position2 = [lunar_position(:,1:end-1),lunar_position_inj];
lunar_velocity2 = [lunar_velocity(:,1:end-1),lunar_velocity_inj];


% Relative
relative_position = y(1:3,:)-lunar_position2;
relative_velocity = y(4:6,:)-lunar_velocity2;

% Figure
fg          = figure("Color",[0.15,0.15,0.15]);
fg.Position = [500,70,960,720];

% Sub Plot 2
subplot(2,2,2);
plot(relative_position(1,:),relative_position(2,:),'Color','White')
hold on
plot(xl_mission,yl_mission,'--')
plot(0,0,'Marker','o')
xlim([-2,2]*10^4);
ylim([-2,2]*10^4)
set(gca,'color',[0.2,0.2,0.2],'XColor',[0.8,0.8,0.8],'YColor',[0.8,0.8,0.8])
hold off
grid on


% Sub Plot 1
subplot(2,2,1);
plot(y(1,:),y(2,:),'Color','White')
hold on
plot(0,0,'Marker','o','Color','g')
plot(lunar_position2(1,:),lunar_position2(2,:))
plot(lunar_posATinj(1),lunar_posATinj(2),'Marker','o','Color','Y')
plot(x_soi,y_soi,'--','Color','w')
plot(xe_mission,ye_mission,'--','Color','w')
text(x_soi(1),y_soi(1),{' Lunar',' SOI'},'color','White')

set(gca,'color',[0.2,0.2,0.2],'XColor',[0.8,0.8,0.8],'YColor',[0.8,0.8,0.8])
grid on
xlim([-1,5]*10^5);
ylim([-4,4]*10^5);

shipWriter = animatedline('Color','r','Marker',".",'MarkerSize',15,'MarkerFaceColor','r','MaximumNumPoints',1);
moon_writer = animatedline('Color',[1,0.4,0],'Marker',".",'MarkerSize',15,'MarkerFaceColor',[1,0.4,0],'MaximumNumPoints',1);
soi_writer = animatedline('Color','w','MaximumNumPoints',100,'LineStyle','--','MaximumNumPoints',100);

speed = 100;
for k = 1:speed:length(y)-(speed-1)
    xvec = y(1,k);
    yvec = y(2,k);
    zvec = y(3,k);

    lunarx = lunar_position2(1,k);
    lunary = lunar_position2(2,k);
    lunarz = lunar_position2(3,k);

    soix = lunar_SOI*cos(theta)+lunar_position2(1,k);
    soiy = lunar_SOI*sin(theta)+lunar_position2(2,k);
    soiz = 0*sin(theta)+lunar_position2(3,k);

    addpoints(shipWriter,xvec,yvec,zvec)
    addpoints(moon_writer,lunarx,lunary,lunarz)
    addpoints(soi_writer,soix,soiy,soiz)
    drawnow
end

hold off
