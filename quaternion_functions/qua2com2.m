function [A] = qua2com2(Q)
% This function convert of quaternion matrix Q into an 
% equivlent complex matrix A which the double size of Q

a1 = Q(:,:,1)+Q(:,:,2)*i;
a2 = Q(:,:,3)+Q(:,:,4)*i;

% A = [a1, a2; -Q(:,:,3)+Q(:,:,4)*i, Q(:,:,1)-Q(:,:,2)*i];

A = [a1, a2; -conj(a2), conj(a1)];

return;