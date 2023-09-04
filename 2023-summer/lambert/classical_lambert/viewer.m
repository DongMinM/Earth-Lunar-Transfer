
[X,Y,Z] = sphere();
X = X*6400;
Y = Y*6400;
Z = Z*6400;

%% Earth overview

figure('Name','Main')
view(3)
surf(X,Y,Z,'FaceColor',[0.2,0.2,0.2]','EdgeAlpha',0.2,'DisplayName','Earth')
hold on

quiver3(0,0,0,h_normv(1),h_normv(2),h_normv(3),20000,'LineWidth',1.2,'DisplayName','anguler momentum')
quiver3(0,0,0,e_vector(1),e_vector(2),e_vector(3),20000,'LineWidth',1.2,'DisplayName','eccentricity vector')
plot3(orbit(1,:),orbit(2,:),orbit(3,:),'DisplayName','orbit')
plot3(r1(1),r1(2),r1(3),'Marker','.','MarkerSize',20,'Color',[0.9,0.1,0.1],'DisplayName','r1')
plot3(r2(1),r2(2),r2(3),'Marker','.','MarkerSize',20,'Color',[0.1,0.7,0.1],'DisplayName','r2')

hold off

legend('Location','northeast')
grid on
xlim([-2,2]*1e4);
ylim([-2,2]*1e4);
zlim([-2,2]*1e4);
