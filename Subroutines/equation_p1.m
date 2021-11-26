%_________________________________________________________________
% Author: Mahsa Yousefi (2021)
%_________________________________________________________________

% This code sove following linear system:
% (B + sigma I)p = -g ===>>> p* = -inv(B + sigma I)*g
% instead:
% Sherman-Morison-Woodbury (SMW) Formula for computing "inv(B + sigma I)"

function p = equation_p1(tau, g, Psi, Minv)
Z = tau * Minv + Psi'*Psi;
f = Psi'*g;
p = -( g - Psi*(Z\f) ) / tau;


