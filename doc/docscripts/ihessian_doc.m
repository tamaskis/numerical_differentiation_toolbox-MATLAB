%% |ihessian|
% Hessian matrix of a multivariate, scalar-valued function using the complex-step approximation.
% 
% <Numerical_Differentiation_Toolbox_Contents_doc.html Back to Numerical Differentiation Toolbox Contents>.
%% Syntax
%   H = ihessian(f,x)
%   H = ihessian(f,x,h)
%% Input/Output Parameters
% <html>
%   <table border=1>
%       <tr>
%           <td></td>
%           <td style="text-align:center"><b>Symbol</b></td>
%           <td style="text-align:center"><b>Variable</b></td>
%           <td style="text-align:center"><b>Description</b></td>
%           <td style="text-align:center"><b>Format</b></td>
%       </tr>
%       <tr>
%           <td rowspan="3" style="text-align:center"><b>Input</b></td>
%           <td style="text-align:center"><img src="https://latex.codecogs.com/svg.latex?\inline&space;f" title="" /></td>
%           <td><TT>f</TT></td>
%           <td>multivariate, scalar-valued function (<img src="https://latex.codecogs.com/svg.latex?\inline&space;f:\mathbb{R}^{n}\rightarrow\mathbb{R}" title="" />)</td>
%           <td style="text-align:center">1×1<BR>function_handle</td>
%       </tr>
%       <tr>
%           <td style="text-align:center"><img src="https://latex.codecogs.com/svg.latex?\inline&space;\mathbf{x}" title="" /></td>
%           <td><TT>x</TT></td>
%           <td>point at which to evaluate the Hessian matrix</td>
%           <td style="text-align:center">n×1<BR>double</td>
%       </tr>
%       <tr>
%           <td style="text-align:center"><img src="https://latex.codecogs.com/svg.latex?\inline&space;h" title="" /></td>
%           <td><TT>h</TT></td>
%           <td>(OPTIONAL) step size</td>
%           <td style="text-align:center">1×1<BR>double</td>
%       </tr>
%       <tr>
%           <td rowspan="1" style="text-align:center"><b>Output</b></td>
%           <td style="text-align:center"><img src="https://latex.codecogs.com/svg.latex?\inline&space;\mathbf{H}(\mathbf{x})" title="" /></td>
%           <td><TT>H</TT></td>
%           <td>Hessian matrix of <img src="https://latex.codecogs.com/svg.latex?\inline&space;f" title="" /> evaluated at <img src="https://latex.codecogs.com/svg.latex?\inline&space;\mathbf{x}" title="" /></td>
%           <td style="text-align:center">n×n<BR>double</td>
%       </tr>
%   </table>
% </html>
%% Example #1
% _Evaluate the derivative of $f(x)=x^{3}$ at $x=2$._
f = @(x) x^3;
df = iderivative(f,2)
%% Example #2
% _Evaluate the derivative $f(x)=\cos{x}$ at $x=0$._
f = @(x) cos(x);
df = iderivative(f,0)
%% See also
% <iderivative_doc.html |iderivative|> | 
% <igradient_doc.html |igradient|> | 
% <idirderivative_doc.html |idirderivative|> | 
% <ijacobian_doc.html |ijacobian|>