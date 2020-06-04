function p = pqrot(q, r)
% The quaternion q which rotates theta  radians about the axis,
% whose vector is r

p = pqinv(r)*q;
