clear
m_e = 5.9742*10^24;
m_l = 7.36*10^22;
mu = m_l / (m_e+m_l);


[x,y] = meshgrid(linspace(-1.5,1.5,200));

z = (x.^2+y.^2) + 2*(1-mu)./sqrt((x+mu).^2+y.^2) + 2 * mu ./sqrt((x-1+mu).^2+y.^2);

JC = linspace(2.98,3.15,70);
% JC = 3.18;

figure
for i = 1:length(JC)
    contourf(x,y,-z,'LevelList',-JC(i),'FaceColor',[0.4,0.4,0.4],'DisplayName','ZVC')
    hold on
    plot(-mu,0,'Marker','.','MarkerSize',40,'DisplayName','Earth')
    plot(1-mu,0,'Marker','.','MarkerSize',10,'DisplayName','Lunar')
    hold off
    title("Jacobi Constant = "+num2str(JC(i)))
    grid on
    legend()

    xlabel("LD")
    ylabel("LD")
    zlabel("LD")

    drawnow  
    frame = getframe(1);
    im = frame2im(frame);
    [imind,cm] = rgb2ind(im,256);
    if i==1
        imwrite(imind,cm,'jc.gif','gif','Loopcount',inf);
    else
        imwrite(imind,cm,'jc.gif','gif','DelayTime',0.05,'WriteMode','append');
    end

end