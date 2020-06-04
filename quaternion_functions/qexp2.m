function p = qexp2(q)
% exp of of quaternion q

[m n d] = size(q);
p_r = zeros(m,n);
p_i = zeros(m,n);
p_j = zeros(m,n);
p_k = zeros(m,n);
q_r = q(:,:,1);
q_i = q(:,:,2);
q_j = q(:,:,3);
q_k = q(:,:,4);

h = exp(q(:,:,1));
d = pqnorm2(q(:,:,2:4));
p_r = h;

f = find(d~=0);     
p_r(f) = h(f).*cos(d(f));
p_i(f) = h(f).*sin(d(f))./d(f).*q_i(f);
p_j(f) = h(f).*sin(d(f))./d(f).*q_j(f);
p_k(f) = h(f).*sin(d(f))./d(f).*q_k(f);
p = cat(3, p_r, p_i, p_j, p_k);
