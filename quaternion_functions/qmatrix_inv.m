function [P] = qmatix_inv (Q)
% This function calculate the inverse of the input quaternion matrix Q

% Q = zeros(2,2,4);
% Q(1,1,2) = 1;
% Q(1,2,4) =1;
% Q(2,2,3) =1;

B = inv(qua2com2(Q));

P = zeros(size(Q));
P(:,:,1) = real(B(1:end/2, 1:end/2));
P(:,:,2) = imag(B(1:end/2, 1:end/2));
P(:,:,3) = real(B(1:end/2, end/2+1:end));
P(:,:,4) = imag(B(1:end/2, end/2+1:end));

%sum(qvmul(squeeze(P(2,:,:)),squeeze(Q(:,1,:))));
return;