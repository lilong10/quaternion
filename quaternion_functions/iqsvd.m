function [U_prime,S_prime] = iqsvd(U,S, y_prime)


p = size(S,1);
%y_prime = y-x_bar; 
clear y;

g = qmatrix_mul(qhermitian_trans(U), y_prime);
h = y_prime-qmatrix_mul(U, g);
h_norm = sqrt(sum(sum(h.*h)));
h_hat = zeros(size(h));
if (h_norm > 0.0000000001)
    h_hat = h.*(1/h_norm);   
end 
gamma = qmatrix_mul(qhermitian_trans(h_hat), y_prime);
clear y_prime;
clear h;

D = [zeros(p,p,4) g; zeros(1,p,4) gamma];
D(1:p,1:p,1) = diag(S);

[R,S_prime,v] = qsvd(D);
clear D, v;

U_prime = qmatrix_mul([U,h_hat],R);

