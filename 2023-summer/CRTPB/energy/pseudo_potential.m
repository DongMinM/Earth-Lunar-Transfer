function pf = pseudo_potential()

m_e = 5.9742*10^24;
m_l = 7.36*10^22;
mu = m_l / (m_e+m_l);


[x,y] = meshgrid(-1.5:0.01:1.5);

r_13 = sqrt((x+mu).^2+y.^2);
r_23 = sqrt((x-1+mu).^2+y.^2);
p = 0.5*(x.^2+y.^2) + (1-mu)./r_13 + mu ./ r_23;

pf = figure('Visible','off');
surf(x,y,-p,'EdgeAlpha',0.3,'DisplayName','potential field','FaceColor',[0.4,0.4,0.4],'FaceAlpha',0.5);
hold on
hold off
legend(Location="best")
title("Pseudo-Potential Field")
zlim([-4,0])



