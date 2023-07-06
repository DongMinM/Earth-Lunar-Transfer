jc = jacobian_constant_2d(mu,JC(1));
figure(jc)
hold on
plot(out(1,:),out(2,:))
plot(-mu,0,'Marker','.','Markersize',30)
plot(1-mu,0,'Marker','.','Markersize',20)
hold off
grid on
xlim([-1.2,1.2])
ylim([-1.2,1.2])
title("Jacobi Constant = "+num2str(JC(1)))

% % 
figure("name","figure 2")
plot(eci(1,:)-earth(1,:),eci(2,:)-earth(2,:),'--')
hold on
plot(0,0,'--')
plot(lunar(1,:)-earth(1,:),lunar(2,:)-earth(2,:),'--')
hold off
% 
% w = animatedline("Marker",".","MarkerSize",10);
% wl = animatedline("Marker",".","MarkerSize",10);
% we = animatedline("Marker",".","MarkerSize",10);
% 
% for i = 1:20:stop
%     
%     x = eci(1,i);
%     y = eci(2,i);
%     
%     xl = lunar(1,i);
%     yl = lunar(2,i);
% 
%     xe = earth(1,i);
%     ye = earth(2,i);
% 
%     addpoints(w,x,y)
%     addpoints(wl,xl,yl)
%     addpoints(we,xe,ye)
% 
%     grid on
%     xlim([-2,2])
%     ylim([-2,2])
%     drawnow
% end
% 
% 
