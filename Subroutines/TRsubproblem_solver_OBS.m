%_________________________________________________________________
% Author: Mahsa Yousefi (2021)
%_________________________________________________________________
% main Ref: https://github.com/johannesbrust/OBS

function p_star = TRsubproblem_solver_OBS(delta, gamma, g, Psi, Minv)
global show

obs_tol            = 1e-10;
% ----------------------------------------------------------------------
[Q, R]             = qr(Psi,0);
RMR                = R*(Minv\R');
RMR                = (RMR + RMR')/2;

% ----------------------------------------------------------------------
% ------------------------------ eigen_values---------------------------
[eig_ve, eig_va]   = eig(RMR);
[lambda_hat, idx]  = sort(diag(eig_va));
U                  = eig_ve(:,idx);
lambda1            = lambda_hat + gamma;
lambda             = [lambda1; gamma];
% ----------------------------------------------------------------------
% ------------------------------min eigen_value ------------------------
lambda       = lambda.*( abs(lambda) > obs_tol );
lambda_min   = min(lambda(1), gamma);
% ----------------------------------------------------------------------
% --------------------------- P_ll,  |p_perb|,  a ---------------------
P_ll         = Q*U;
g_ll         = P_ll'*g;
llg_perbll   = sqrt( abs( g'*g - g_ll'*g_ll ) );

if llg_perbll^2 < obs_tol 
  llg_perbll = 0;
end
a            = [g_ll; llg_perbll];         
% ----------------------------------------------------------------------
% -------------------- Cases (3 cases + Newton) ------------------------

%phi(sigma)>=0 ~~ ||v(sigma)|| <= delta:
%case_1
if ( lambda_min > 0 ) && ( phi(0, delta, a, lambda)>= 0 )
    sigma_star     = 0;
    tau_star       = gamma + sigma_star;
    p_star         = equation_p1(tau_star, g, Psi, Minv);
    
%case_2   
elseif ( lambda_min <= 0 ) && ( phi(-lambda_min, delta, a, lambda)>= 0 )   
        sigma_star = -lambda_min; 
        p_star     = equation_p2(sigma_star, gamma, g, a, lambda, P_ll, g_ll);
%case_3
        if ( lambda_min < 0 )
            p_hat = p_star;
            p_star  = equation_p3(lambda_min, delta, p_hat, lambda, P_ll);
        end
        
%phi(sigma)<0 ~~ ||v(sigma)|| > delta:        
else
    if lambda_min > 0
        sigma_star  = newton_method(0, delta, a, lambda);
    else
        sigma_hat = max(abs(a)./delta - lambda);
        if sigma_hat > -lambda_min
            sigma_star  = newton_method(  sigma_hat, delta, a, lambda);
        else
            sigma_star  = newton_method(-lambda_min, delta, a, lambda);
        end
    end
           
    tau_star      = sigma_star + gamma;
    p_star        = equation_p1(tau_star, g, Psi, Minv);
end

% ------------------------- Optimality Check ---------------------------

if show == 1
    Bp_star   = gamma*p_star + Psi*( Minv\(Psi'*p_star) );  % by Eq(4)
    opt1      = norm( Bp_star + sigma_star*p_star + g );
    opt2      = sigma_star * abs( delta-norm(p_star) );
    spd_check = lambda_min + sigma_star;
    fprintf('\nOptimality condition #1: %8.3e', opt1);
    fprintf('\nOptimality condition #2: %8.3e', opt2);
    fprintf('\nlambda_min + sigma_star: %8.2e', spd_check);
    fprintf('\n\n');
end

end


% Lambda = diag(Lambda1             , Lambda2)
% Lambda = diag(Lambda_hat + gamma*I, gamma*I) 
%lambda  = diag(Lambda)
% a{j}   = (g_||)j,  j=1:k
% a{k+1} = |g_perp|
%
% case 1:
%          lambda_1,...,lambda_k > 0           &  gamma >0
% case 2: 
%          lambda_1 = 0 (with r multiplicity)  &  
%          lambda_r+1,...,lambda_k > 0         &  gamma > 0
% case 3: 
%          the min eig.value is the most NEGATIVE one!
%          lambda_min = gamma    or 
%          lambda_min = lambda_1 (with r multiplicity)