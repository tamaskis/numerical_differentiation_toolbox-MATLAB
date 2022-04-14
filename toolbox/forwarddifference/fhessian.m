%==========================================================================
%
% fhessian  Hessian of a multivariate, scalar-valued function using the 
% forward difference approximation.
%
%   H = fhessian(f,x0)
%   H = fhessian(f,x0,h)
%
% See also fderivative, fpartial, fgradient, fdirectional, fjacobian.
%
% Copyright © 2021 Tamas Kis
% Last Update: 2022-04-12
% Website: https://tamaskis.github.io
% Contact: tamas.a.kis@outlook.com
%
% TOOLBOX DOCUMENTATION:
% https://tamaskis.github.io/Numerical_Differentiation_Toolbox-MATLAB/
%
% TECHNICAL DOCUMENTATION:
% https://tamaskis.github.io/documentation/Numerical_Differentiation_using_Finite_Difference_and_Complex_Step_Approximations.pdf
%
%--------------------------------------------------------------------------
%
% ------
% INPUT:
% ------
%   f       - (1×1 function_handle) multivariate, scalar-valued function,
%             f(x) (f : ℝⁿ → ℝ)
%   x0      - (n×1 double) evaluation point, x₀ ∈ ℝⁿ
%   h       - (1×1 double) (OPTIONAL) relative step size (defaults to ε¹ᐟ³)
%
% -------
% OUTPUT:
% -------
%   H       - (n×1 double) Hessian of f with respect to x, evaluated at
%             x = x₀
%
% -----
% NOTE:
% -----
%   --> This function requires n+1 evaluations of f(x).
%
%==========================================================================
function H = fhessian(f,x0,h)
    
    % defaults relative step size if not input
    if nargin == 2 || isempty(h)
        h = eps^(1/3);
    end
    
    % determines dimension of x0
    n = length(x0);
    
    % preallocates matrix to store Hessian
    H = zeros(n);
    
    % evaluates f(x₀)
    f0 = f(x0);
    
    % preallocates arrays to store absolute step sizes and function evals
    a = zeros(n,1);
    b = zeros(n,1);
    
    % populates "a" and "b"
    for k = 1:n
        
        % absolute step size
        dxk = h*(1+abs(x0(k)));
        
        % steps in kth direction
        x0(k) = x0(k)+dxk;
        
        % function evaluation
        b(k) = f(x0);
        
        % resets x0
        x0(k) = x0(k)-dxk;
        
        % stores "dxk" in "a"
        a(k) = dxk;
        
    end
    
    % evaluates Hessian, looping through the upper triangular elements
    for k = 1:n
        for j = k:n
            
            % steps in the jth and kth directions
            x0(j) = x0(j)+a(j);
            x0(k) = x0(k)+a(k);
            
            % evaluates (j,k)th element of the Hessian
            H(j,k) = (f(x0)-b(j)-b(k)+f0)/(a(j)*a(k));
            
            % symmetry
            H(k,j) = H(j,k);
            
            % resets x0
            x0(j) = x0(j)-a(j);
            x0(k) = x0(k)-a(k);
            
        end
    end
    
end