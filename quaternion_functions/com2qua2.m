function [Q] = com2qua2(A)
% This function convert of complex matrix A into an 
% equivlent quaternion matrix Q which the half size of A

A_upper = A(1:end/2,:);
A_lower = A(end/2+1:end,:);

Q = cat(3, real(A_upper), imag(A_upper), -real(A_lower), imag(A_lower));


% A = [a1, a2; -Q(:,:,3)+Q(:,:,4)*i, Q(:,:,1)-Q(:,:,2)*i];
% Q(:,:,1) = [real(a1), real(a2)];
% Q(:,:,2) = [imag(a1), imag(a2)];
% Q(:,:,3) = [real(b1), real(b2)];
% Q(:,:,4) = [imag(b1), imag(b2)];

return;