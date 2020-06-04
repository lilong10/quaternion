function [a, b] = qua2com(q)
% hypercomplex numbers can be represented as a pair of 
% complex numbers in the following way. 
% The numbers a and b are complex numbers
%   Let h = x + yi + zj + wk.
%       a = (x-w) + i(y+z)
%       b = (x+w) + i(y-z)

a = [q(1)-q(4), q(2)+q(3)];
b = [q(1)+q(4), q(2)-q(3)];
