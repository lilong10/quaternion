function p = qinv2(q)
% Inverse of the quaternion z (inv(q)) : 

s = sum(q.*q,3);
q = qconj(q);
p = cat(3,q(:,:,1)./s,q(:,:,2)./s,q(:,:,3)./s,q(:,:,4)./s);