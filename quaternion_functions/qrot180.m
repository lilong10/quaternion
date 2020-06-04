function p = qrot180(q, r)
% The unit quaternion q which rotates theta radians about the axis,
% whose vector is r

r = r(2:4);
q = q(2:4);
p = [0, r+2*cross(q,cross(q,r))];

