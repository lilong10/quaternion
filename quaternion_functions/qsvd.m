function [Uq, Sq, Vq] = qsvd(Q)

% convert the quaternion matrix into an equivalent complex matrix
A = qua2com2(Q);
% do SVD of the complex matrix A
[Uc, Sc, Vc] = svd(A,0');

% get half singular values of the diagonal
if(size(Sc,1)>size(Sc,2))
   Sq = sum(Sc,1);
else
   Sq = sum(Sc,2); 
end
Sq = Sq(1:2:end);
Sq = Sq';

[B IX] = sort(-abs(Sq));  % the reason to sort Dq is because of the negative eigenvalues
Sq = Sq(IX)';

% take half of the coloums by downsampling the matrix Uc and Vc
% convert from complex matrix to quaternion matrix
U = Uc(:,1:2:end);
Uq = com2qua2(U(:,IX));
% convert from complex matrix to quaternion matrix
% and take the hermitian transpose of it
V = Vc(:,1:2:end);
Vq = com2qua2(V(:,IX));

%return;



