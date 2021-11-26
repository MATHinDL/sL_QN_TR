%_________________________________________________________________
% Author: Mahsa Yousefi (2021)
%_________________________________________________________________

% This code computes phi and the derivative values at "sigma".
% phi and phi_prim are used in the Newton method. 

function [phi, phi_prim] = phi_phiprim(sigma, delta, a, lambda)
obs_tol    = 1e-10;

t = lambda + sigma;

% ZERO in a fraction's nominator or denominator of ||p(sigma)||:
if ( sum(abs(a) < obs_tol) > 0 ) || ( sum(abs(t) < obs_tol) > 0 )
    llpll2     = 0;
    llpll_prim = 0;
    for i = 1: length(a)
        if ( abs(a(i)) > obs_tol) && ( abs(t(i)) < obs_tol) 
            phi      = -1/delta;
            phi_prim = 1/obs_tol;
            return
        elseif ( abs(a(i)) > obs_tol) && ( abs(t(i)) > obs_tol) 
            llpll2     = llpll2     + ( a(i)   /t(i)   )^2;
            llpll_prim = llpll_prim + ( a(i)^2 /t(i)^3 );
        end
    end
    llpll    = sqrt(llpll2);
    phi      = 1/llpll - 1/delta;
    phi_prim = llpll_prim / llpll^3;
    return
end

% NO ZERO in a fraction's nominator or denominator of ||p(sigma)||:
llpll     = norm(a./t);
phi       = 1/llpll - 1/delta;
phi_prim  =  sum( a.^2 ./ t.^3 ) / llpll^3;
end