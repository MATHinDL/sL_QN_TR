%_________________________________________________________________
% Author: Mahsa Yousefi (2021)
%_________________________________________________________________

% This code computes the value of "phi" at "sigma":
% phi(sigma) = 1/||p(sigma)|| - 1/delta              (( Eq: 8 ))

function phi = phi(sigma, delta, a, lambda)
obs_tol    = 1e-10;

t = lambda + sigma; 

% ZERO in a fraction's nominator or denominator of ||p(sigma)||
if ( sum(abs(a) < obs_tol) > 0 ) || ( sum(abs(t) < obs_tol) > 0 )
    llpll2 = 0;
    for i = 1: length(a)
        if ( abs(a(i)) > obs_tol) && ( abs(t(i)) < obs_tol) 
            phi = -1/delta;
            return
        elseif ( abs(a(i)) > obs_tol) && ( abs(t(i)) > obs_tol) 
            llpll2 = llpll2 + ( a(i)/t(i) )^2;
        end
    end
    phi = 1/sqrt(llpll2) - 1/delta;
    return
end

% NO ZERO in a fraction's nominator or denominator of ||p(sigma)||
llpll     = norm( a./t );
phi       = 1/llpll - 1/delta;
end