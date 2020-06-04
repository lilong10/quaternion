function p = pqrot180(r, q)
% The unit quaternion q which rotates theta radians about the axis,
% whose vector is r


p = [r(1)+2*q(2)*(q(1)*r(2)-q(2)*r(1))-2*q(3)*(q(3)*r(1)-q(1)*r(3)),
     r(2)+2*q(3)*(q(2)*r(3)-q(3)*r(2))-2*q(1)*(q(1)*r(2)-q(2)*r(1)),
     r(3)+2*q(1)*(q(3)*r(1)-q(1)*r(3))-2*q(2)*(q(2)*r(3)-q(3)*r(2))]';
 
%p = [ r+2*cross(q,cross(q,r))];
