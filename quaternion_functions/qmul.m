function q = qmul(u,v)
% multiply two arbitary quaternion u, v
% u = [w x y z]
% v = [a b c d]
% u*v = [wa-xb-yc-zd, wb+xa+yd+zc, wc-xd+ya-zb, wd+xc-yb+za]

%q = [u(1)*v(1)-dot(u(2:4),v(2:4)), u(1)*v(2:4)+v(1)*u(2:4)+cross(u(2:4),v(2:4))];

q = [u(1)*v(1) - u(2)*v(2) - u(3)*v(3) - u(4)*v(4),...
     u(1)*v(2) + u(2)*v(1) + u(3)*v(4) - u(4)*v(3),...
     u(1)*v(3) - u(2)*v(4) + u(3)*v(1) - u(4)*v(2),...
     u(1)*v(4) + u(2)*v(3) - u(3)*v(2) + u(4)*v(1)];
