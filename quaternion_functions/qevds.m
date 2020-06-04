function [Vq, Dq] = qevds(Q, k)

% convert the quaternion matrix into an equivalent complex matrix
A = qua2com2(Q);
% do EVD of the complex matrix A
%[Vc, Dc] = eig(A);
[Vc, Dc] = eigs(A, k);

% get half eigenvalues values of the diagonal
Dq = sum(Dc);
%Dq = Dq(1:2:end);
Dq = Dq(end-1:-2:1);
[B IX] = sort(-abs(Dq));  % the reason to sort Dq is because of the negative eigenvalues
Dq = Dq(IX)';


% convert from complex matrix to quaternion matrix
V = Vc(:,end-1:-2:1);
Vq = com2qua2(V(:,IX));


return;



