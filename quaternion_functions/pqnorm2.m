function d = pqnorm2(q)
% magnitude/length of pure quaternion q

d = sqrt(sum(q.*q, 3));