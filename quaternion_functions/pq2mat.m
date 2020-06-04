function [m, n] = pq2mat(q)
% The quaternions can be represented using complex 2x2 matrix
% return:
%   m - real part of the matrix 
%   n - real part of the matrix

m = [0 q(2); -q(2) 0];
n = [q(1) q(3); -q(3) -q(1)];




