function P = qconj2(Q)
% Conjugate of the quaternion q (q*) : 

P = -Q;
P(:,:,1) = Q(:,:,1);