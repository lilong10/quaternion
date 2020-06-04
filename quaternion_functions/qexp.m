function p = qexp(q)
% exp of of quaternion q

h = exp(q(1));
d = pqnorm(q(2:4));

if d == 0
    p = [h 0 0 0];
else
     p = [h*cos(d), (h*sin(d)/d)*q(2:4)];
end
