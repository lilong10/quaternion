function p = qtanh(q)
% arctanh of qauternion q
% atanh(q) = ln((1+q)/(1-q))/2

p = qln(qdiv([1 0 0 0]+q, [1 0 0 0]-q))/2;