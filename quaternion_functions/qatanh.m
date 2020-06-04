function p = qatanh(q)
% arctanh of qauternion q
% atanh(q) = ln((1+q)/(1-q))/2

if q(2)==0 & q(3)==0 & q(4)==0
   p = [real(atanh(q(1))) imag(atanh(q(1))) 0 0] ;
else    
   p = qln(qdiv([1 0 0 0]+q, [1 0 0 0]-q))/2;
end
