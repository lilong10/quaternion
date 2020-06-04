function p = qln2(q)
% ln of qauternion q
[m n d] = size(q);
q_r = q(:,:,1);
q_i = q(:,:,2);
q_j = q(:,:,3);
q_k = q(:,:,4);

d = qnorm2(q(:,:,2:4));
f = find(d~=0);

n_i = zeros(m,n);
n_j = zeros(m,n);
n_k = zeros(m,n);
n_i(f) = q_i(f)./d(f);
n_j(f) = q_j(f)./d(f);
n_k(f) = q_k(f)./d(f);
clear d;

s = atan2(pqnorm2(q(:,:,2:4)), q_r);
p_r = log(q_r.*q_r+ sum(q(:,:,2:4).*q(:,:,2:4),3))/2;

p = cat(3, p_r, s.*n_i, s.*n_j, s.*n_k);


