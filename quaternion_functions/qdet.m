function [d] = qdet(A)

d = (det(qua2com2(A)));

%% or equivalently:
%[u s v] = qsvd(A); prod(abs(s).^2)