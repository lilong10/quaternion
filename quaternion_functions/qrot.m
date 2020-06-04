function p = qrot(q, mu, theta)
% The unit quaternion q which rotates theta radians about the axis,
% whose vector is r

cos_theta = cos(theta/2);
sin_theta = sin(theta/2);
L = [cos_theta, mu(2:4)*sin_theta];
R = [cos_theta, -mu(2:4)*sin_theta];

p = qmul(qmul(L,q),R);
