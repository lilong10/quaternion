function p = qatan(q)
% arctangent of qauternion q


d = pqnorm(q(2:4));

if d == 0
    p =[real(atan(q(1))) imag(atan(q(1))) 0 0];
else
    n = [0 q(2:4)]/d;
    p = qmul(-n, qatanh(qmul(q,n)));
end
