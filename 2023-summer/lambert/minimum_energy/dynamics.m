function out = dynamics(mu,rv)
    
    r = rv(1:3);
    v = rv(4:6);

    a = -mu/norm(r)^3*r;
    out = [v;a];

end

