function d = qnorm(q)
% STAT Mean and standard deviation
%   For a vector x, stat(x) returns the
%   mean and standard deviation of x.
%   For a matrix x, stat(x) returns two row
%   vectors containing, respectively, the
%   mean and standard deviation of each column.

d = sqrt(sum(q.*q));