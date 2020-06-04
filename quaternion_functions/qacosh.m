function p = qacosh(q)
% arccosh of qauternion q
% acosh(q) = ln(q + (q^2-1)^.5)

p = qln(q+ qpow(qpow(q,[2 0 0 0])-[1 0 0 0], [0.5 0 0 0]));