%_________________________________________________________________
% Author: Mahsa Yousefi (2021)
%_________________________________________________________________

function p_star = TRsubproblem_solver_OBB(delta, gamma, g, Psi, Minv)
global show

obb_tol            = 1e-10;
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

lambda_min   = min(lambda(1), gamma);
   
% ----------------------------------------------------------------------
% --------------------------- P_ll,  |p_perb|,  a ---------------------
P_ll         = Q*U;
g_ll         = P_ll'*g;
llg_perbll   = sqrt( abs( g'*g - g_ll'*g_ll ) );

if llg_perbll^2 < obb_tol 
  llg_perbll = 0;
end
a            = [g_ll; llg_perbll];         
% ----------------------------------------------------------------------
% --------------------  (1 case + Newton) ------------------------

%phi(sigma)>=0 ~~ ||v(sigma)|| <= delta:
%case_1
if ( phi(0, delta, a, lambda) >= 0 )
    sigma_star     = 0;
    tau_star       = gamma + sigma_star;
    p_star         = equation_p1(tau_star, g, Psi, Minv);
        
%phi(sigma)<0 ~~ ||v(sigma)|| > delta:        
else
    sigma_star    = newton_method(0, delta, a, lambda);           
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
