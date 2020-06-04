function [Q] = qmatrix_mul (A,B)
% This function calculate the product of two quaternion matrices A and B

% Q = zeros(2,2,4);
% Q(1,1,2) = 1;
% Q(1,2,4) =1;
% Q(2,2,3) =1;

C = qua2com2(A)*qua2com2(B);

Q = zeros(size(C(1:2:end,1:2:end)));

Q(:,:,1) = real(C(1:end/2, 1:end/2));
Q(:,:,2) = imag(C(1:end/2, 1:end/2));
Q(:,:,3) = real(C(1:end/2, end/2+1:end));
Q(:,:,4) = imag(C(1:end/2, end/2+1:end));

%sum(qvmul(squeeze(P(2,:,:)),squeeze(Q(:,1,:))));
return;