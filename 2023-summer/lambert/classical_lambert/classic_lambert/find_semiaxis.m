function a = find_semiaxis(mu, r1, r2, TOF_target, a, a_min, tol)

%% Substitution parameters
c = norm(r2-r1);
df = acos(dot(r1,r2) / ( norm(r1) * norm(r2) ));
s = (norm(r1)+norm(r2)+c)/2;



%% Bisects method
% function : TOF(a) - TOF_target = 0
% find a

step = 2000;
y1 = find_TOF(mu,c,df,s,a) - TOF_target;
y2 =  find_TOF(mu,c,df,s,a+step) - TOF_target;

% Iteration
i=1;
while(true)
    error(i) = y2;

    if y1*y2 < 0
        step = step/2;
    elseif y1 < 0
        a = a-step;
        if(a < a_min)
            a = a_min;
        end
    elseif y2 > 0
        a = a+step;
    end

    % End condition
    if abs(error(i)) < 1e-9
        break;
    end

    
    y1 = find_TOF(mu,c,df,s,a) - TOF_target;
    y2 =  find_TOF(mu,c,df,s,a+step) - TOF_target;
    i = i+1;
end
%% End Bisects


end
% End Function

