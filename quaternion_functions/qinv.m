function p = qinv(q)
% Inverse of the quaternion z (inv(q)) : 

p = qconj(q)/sum(q.*q);