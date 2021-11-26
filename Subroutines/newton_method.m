%_________________________________________________________________
% Author: Mahsa Yousefi (2021)
%_________________________________________________________________

function sigma   = newton_method(sigma_0, delta, a, lambda)
newton_tol      = 1e-10;
newton_maxit    = 100;

k               = 0;
sigma           = sigma_0;
[phi, phi_prim] = phi_phiprim(sigma, delta, a, lambda);

while (abs(phi)> newton_tol) && (k < newton_maxit)
    sigma           = sigma - phi/phi_prim;
    [phi, phi_prim] = phi_phiprim(sigma, delta, a, lambda);
    k               = k + 1;
end

end
