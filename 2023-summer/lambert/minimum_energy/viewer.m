[X,Y,Z]=sphere();
X=6400*X;
Y=6400*Y;
Z=6400*Z;

figure;

surf(X,Y,Z,'EdgeColor','none','FaceColor',[0,0.1,0.65])

hold on
plot3(ri(1),ri(2),ri(3),'o')
plot3(rf(1),rf(2),rf(3),'o')
quiver3(ri(1),ri(2),ri(3),v(1),v(2),v(3),100)

plot3(orb(1,:),orb(2,:),orb(3,:),'--')
hold off


% xlim([-1,1]*1e4)
% ylim([-1,1]*1e4)
% zlim([-1,1]*1e4)