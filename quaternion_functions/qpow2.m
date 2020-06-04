function p = qpow2(q, r)
% power of q to r


[m n d] = size(q);
q_r = q(:,:,1);
q_i = q(:,:,2);
q_j = q(:,:,3);
q_k = q(:,:,4);


f = find(sum(abs(q),3)==0);
clear q;
if (length(f)>0)
  q_r(f) = 0;
  q_i(f) = 0;
  q_j(f) = 0;
  q_k(f) = 0;
end

r = repmat(r,[m n 1]);
q = reshape(cat(3,q_r,q_i,q_j, q_k),[m n d]);
p = qexp2(qmul2(qln2(q), r));

