function p = qcos(q)
% cosine of qauternion q

t = q(1);

d = qnorm(q(2:4));

if d==0
   n = [0 0 0];   
else
    n = q(2:4)/d;
end

p = [cos(t)*cosh(d), -sin(t)*sinh(d)*n];