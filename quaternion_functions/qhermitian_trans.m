function [B] = qhermitian_trans(A)

[n m d] = size(A);
B = zeros([m n d]);
B(:,:,1) =  A(:,:,1)';
B(:,:,2) = -A(:,:,2)';
B(:,:,3) = -A(:,:,3)';
B(:,:,4) = -A(:,:,4)';

return;
