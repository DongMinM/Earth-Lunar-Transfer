function out = quternion_rot(v,axis,rot)
    axis_norm = axis./norm(axis);
    ca = dot([1,0,0],axis_norm)/norm(axis_norm);
    cb = dot([0,1,0],axis_norm)/norm(axis_norm);
    cr = dot([0,0,1],axis_norm)/norm(axis_norm);

    q0 = cos(rot/2);
    q1 = ca*sin(rot/2);
    q2 = cb*sin(rot/2);
    q3 = cr*sin(rot/2);

    M = [q1^2-q2^2-q3^2+q0^2,  2*(q1*q2+q3*q0),  2*(q1*q3-q2*q0);...
         2*(q1*q2-q3*q0),   -q1^2+q2^2-q3^2+q0^2,   2*(q2*q3+q1*q0);...
         2*(q1*q3+q2*q0),  2*(q2*q3-q1*q0),   -q1^2-q2^2+q3^2+q0^2];

    out = M*v;


end