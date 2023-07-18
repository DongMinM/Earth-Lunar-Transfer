% Earth - Lunar Transfer & maneuver
% Dynamic model : CR3BP
%% revision history %%
% 2023-07-05 Dongmin
% 
% 
%%%%%%%%%%%%%%%%%%%%
clear
format long
addpath("body\","satellite\","energy\","utility\","solver\")

% simulation time
step = 100;
stop = 70*3600*24;

% set Bodies
centerBody = earth();
secondBody = lunar();
sat        = sat();

% solve


% [mu,out,eci,earth,lunar,JC] = CRTBP(centerBody,secondBody,sat,step,stop);
% viewer


figure;
for i = 1:10
    sat.Ivel = sat.Ivel*1.002;
    norm(sat.Ivel)
    [mu,out,eci,earth,lunar,JC] = CRTBP(centerBody,secondBody,sat,step,stop);


    [x,y] = meshgrid(linspace(-1.2,1.2,120));
    
    z = (x.^2+y.^2) + 2*(1-mu)./sqrt((x+mu).^2+y.^2) + 2 * mu ./sqrt((x-1+mu).^2+y.^2);
    contourf(x,y,-z,'LevelList',-JC(1),'FaceColor',[0.4,0.4,0.4],'DisplayName','ZVC');

    hold on
    plot(out(1,:),out(2,:))
    plot(-mu,0,'Marker','.','Markersize',30)
    plot(1-mu,0,'Marker','.','Markersize',20)
    hold off
    grid on
    xlim([-1.2,1.2])
    ylim([-1.2,1.2])
    title("Jacobi Constant = "+num2str(JC(1)))
    drawnow

end


