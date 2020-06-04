function q = com2qua(c,d)
% Conversely, if we have a hypercomplex number given to us 
% in the form (a,b), we can solve for x, y, z, and w. The solution to 
% 
%      c = (x-w) + i(y+z)
%      d = (x+w) + i(y-z)
% 
% is 
%      x = (real(c) + real(d))/2
%      y = (imag(c) + imag(d))/2
%      z = (imag(c) - imag(d))/2
%      w = (real(d) - real(c))/2

q = [c(1) + d(1), c(2) + d(2), c(2) - d(2), d(1)-c(1)]/2;