function p = qacos(q)
% arccosine of qauternion q

d = pqnorm(q(2:4));

if d == 0
    p =[real(acos(q(1))) imag(acos(q(1))) 0 0];
else
  n = [0 q(2:4)]/d;
  p = qmul(-n, qacosh(q));
end