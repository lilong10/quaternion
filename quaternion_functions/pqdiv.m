function p = pqdiv(q, r)
% Division of the quaternions q and r => q/r 
% q = w + xi + yj + zk
% r = a + bi + cj + dk
%  q/r = q*inv(r)

p = pqmul(q,pqinv(r));
