function p = qasin(q)
% arcsine of qauternion q

d = pqnorm(q(2:4));

if d == 0
    p =[real(asin(q(1))) imag(asin(q(1))) 0];
else
    n = [0 q(2:4)]/d;
    p = qmul(-n, qasinh(qmul(q,n)));   
end


