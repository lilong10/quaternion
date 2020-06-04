function p = qln(q)
% ln of qauternion q

t = q(1);
v = q(2:4);
d = qnorm(v);

if d == 0
    n = [0 0 0];
else
    n = v/d;
end

p = [log(t*t+dot(v,v))/2, atan2(pqnorm(v), t)*n];


