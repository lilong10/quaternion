function p = qsin(q)
% sine of qauternion q
% sin(q) = (sin(t)cosh(|v|), cos(t)sinh(|v|)v/|v|)

t = q(1);

d = qnorm(q(2:4));

if d==0
   n = [0 0 0];   
else
    n = q(2:4)/d;
end

p = [sin(t)*cosh(d), cos(t)*sinh(d)*n];