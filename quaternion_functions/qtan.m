function p = qtan(q)
% tangent of qauternion q
% Note: since the unit vectors of sine and cosine
% are the same, these two commute so the order is irrelevant. 

p = qdiv(qsin(q), qcos(q));
