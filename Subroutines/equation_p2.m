%_________________________________________________________________
% Author: Mahsa Yousefi (2021)
%_________________________________________________________________
% This code solves linear system: (B + sigma I)p = -g 

function p = equation_p2(sigma, gamma, g, a, lambda, P_ll, g_ll)
eq_tol  = 1e-10;

t       = lambda + sigma;

idx     = find( abs(t) > eq_tol );
c       = length(t);
v       = zeros(c,1);
v(idx)  = a(idx)./( lambda(idx) + sigma );   % Indirectely find first r zero-eignvalues 

if abs(gamma + sigma) < eq_tol
    p = -P_ll*v(1:c-1);      % here, all first k abs(t)>0
else
    p = -P_ll*v(1:c-1) - (g - P_ll*g_ll)/(gamma+sigma);
end
end



% Explainations:
% B
% lambda = [lambda1] --> k*1
%          [gamma  ] --> 1*1

% B + sigma*I
% lambda + sigma = [lambda1 + sigma]  --> k*1
%                  [gamma   + sigma]  --> 1*1
%--------------------------------------------------------------------------
% sigma = -lambda_min: 

% ((1)) lambda_min = gamma       ======>  g_perb = 0

% t = [lambda1 + gamma + sigma] = [lambda1]--> v(1:k)~= 0  --> g_ll   ~= 0 
%     [          gamma + sigma]   [ 0     ]--> v(k+1) = 0  --> |g_perb| = 0


% ((2)) lambda_min = lambda(1)   ======>  g_|| = 0  for j=1:r

% t = [lambda1 + gamma + sigma]--> v(1:k)-->  g_ll    = 0   for j=1:r
%     [          gamma + sigma]--> v(k+1)    --> |g_perb| ~=0
