function p = qpow(q, r)
% power of q to r

if q(1)==0 & q(2)==0 & q(3)==0 & q(4)==0 
    p = [0 0 0 0];
else
    p = qexp(qmul(qln(q), r));
end
