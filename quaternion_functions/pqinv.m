function p = pqinv(q)
% Inverse of the quaternion z (inv(q)) : 

p = pqconj(q)/sum(q.*q);