%_________________________________________________________________
% Author: Mahsa Yousefi (2021)
%_________________________________________________________________
% In Hard Case, lanmda_min = min{lambda_1, gamma}
% eig.vector u_min depends on eig.val lambda_min: 
% case 1: lambda_min = lambda_1
% case 2: lambda_min = gamma

function  p_star  = equation_p3(lambda_min, delta, p_hat, lambda, P_ll)
eq_tol = 1e-10;
alpha  = sqrt( delta^2 - p_hat'*p_hat );

% case 1:lambda(1)
if ( abs( lambda_min - lambda(1) ) < eq_tol )   
    u_min  = P_ll(:,1)/norm(P_ll(:,1));
    z_star = alpha * u_min;
    
% case 2:gamma
else 
    [n,k] = size(P_ll);  % P_ll: n*k  --->  rank(P_ll)=k
    e     = zeros(n,1);
    found = 0; 
    for i = 1: k
        e(i) = 1;       
        u_min = e - P_ll*P_ll(i,:)'; % u_min = (I - P_ll*P_ll')*e(i)
        if ( norm(u_min) > eq_tol )
            found = 1;
            break
        end
        e(i) = 0;
    end
    if found ==0
        e(i+1) = 1;
        u_min  = e - P_ll*P_ll(i+1,:)'; % u_min = (I - P_ll*P_ll')*e(i)
    end
    u_min  = u_min/norm(u_min );
    z_star = alpha * u_min;
end
p_star = p_hat + z_star;
end
 

    
