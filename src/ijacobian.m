%==========================================================================
%
% ijacobian  Jacobian matrix of a multivariate, vector-valued function 
% using the complex-step approximation.
%
%   J = ijacobian(f,x)
%   J = ijacobian(f,x,h)
%
% See also iderivative, igradient, idirderivative, ihessian.
%
% Copyright © 2021 Tamas Kis
% Last Update: 2021-08-04
% Website: tamaskis.github.io
% Contact: tamas.a.kis@outlook.com
%
% REFERENCES:
%   [1] Squire et. al, "Using Complex Variables to Estimate Derivatives of 
%       "Real Functions", https://epubs.siam.org/doi/pdf/10.1137/S003614459631241X
%   [2] Martins et. al, "The Complex-Step Derivative Approximation",
%       https://dl.acm.org/doi/pdf/10.1145/838250.838251
%   [3] https://en.wikipedia.org/wiki/Jacobian_matrix_and_determinant
%
%--------------------------------------------------------------------------
%
% ------
% INPUT:
% ------
%   f       - (function_handle) multivariate, vector-valued function 
%             (f:Rn->Rm)
%   x       - (n×1 double) point at which to evaluate the Jacobian matrix
%   h       - (OPTIONAL) (1×1 double) step size (defaults to sqrt(eps))
%
% -------
% OUTPUT:
% -------
%   J       - (m×n double) Jacobian matrix of f evaluated at x
%
%==========================================================================
function J = ijacobian(f,x,h)

    % sets the default step size if not input
    if nargin == 2 || isempty(h)
        h = sqrt(eps);
    end
    
    % determines size of Jacobian
    m = length(f(x));
    n = length(x);
    
    % preallocates array to store Jacobian
    J = zeros(m,n);
    
    % complex-step matrix
    dX = h*1i*eye(n);
    
    % evaluates Jacobian matrix
    for j = 1:n
        J(:,j) = imag(f(x+dX(:,j))/h);
    end
    
end