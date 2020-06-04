function [s,q] = pqmul(u,v)
% multiply two pure quaternion u, v
% return:
%     s - scalar
%     q - pure quaternion
s = -dot(u,v);
q = cross(u,v);