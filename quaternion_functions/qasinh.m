function p = qasinh(q)
% arcsinh of qauternion q
% asinh(q) = ln(q + (q^2+1)^.5)

if q(2)==0 & q(3)==0 & q(4)==0
   p = [asinh(q(1)) 0 0 0]    ;
else
    p = qln(q+qpow(qpow(q,[2 0 0 0])+[1 0 0 0], [0.5 0 0 0]));
end