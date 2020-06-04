function H = qifft2(fft_type, f, mu1, mu2)


[M N d] = size(f);
mu3 = qmul(mu1, mu2);
MU1 = cat(3, zeros(M,N), zeros(M,N)+mu1(2), zeros(M,N)+mu1(3), zeros(M,N)+mu1(4));
MU2 = cat(3, zeros(M,N), zeros(M,N)+mu2(2), zeros(M,N)+mu2(3), zeros(M,N)+mu2(4));
MU3 = cat(3, zeros(M,N), zeros(M,N)+mu3(2), zeros(M,N)+mu3(3), zeros(M,N)+mu3(4));
ha = zeros(M, N)*i;
hb = zeros(M, N)*i;

A = inv([mu1(2) mu2(2) mu3(2);...
         mu1(3) mu2(3) mu3(3);...
         mu1(4) mu2(4) mu3(4)]);

% decompose quaternion function f 
for m = 1:M
    for n = 1:N
        h = A*[f(m,n,2);f(m,n,3);f(m,n,4)];
        ha(m,n) = f(m,n,1)+h(1)*i;
        hb(m,n) = h(2)+h(3)*i;  
%         h = [f(m,n,1),f(m,n,2),f(m,n,3), f(m,n,4)];
%         [a b] = decompose_f(h,A);
%         ha(m,n) = a;
%         hb(m,n) = b;   
    end
end


if fft_type == 1
   s = ifft2(ha);
   t = ifft2(flipdim(hb,2));
   Hc = repmat(imag(s), [1 1 4]).*MU1 + cat(3, real(s),s*0,s*0,s*0) +...
       qmul2(repmat(imag(t), [1 1 4]).*MU1 + cat(3, real(t),t*0,t*0,t*0), MU2);
   H = (Hc+flipdim(Hc,2))/2 + qmul2((Hc-flipdim(Hc,2))/2, -MU3);
elseif fft_type==2
   s = ifft2(ha);
   t = ifft2(hb);
   H = repmat(imag(s), [1 1 4]).*MU1 + cat(3, real(s),s*0,s*0,s*0) +...
       qmul2(repmat(imag(t), [1 1 4]).*MU1 + cat(3, real(t),t*0,t*0,t*0), MU2);
else
   s = ifft2(ha);
   t = fft2(hb);  
    H = repmat(imag(s), [1 1 4]).*MU1 + cat(3, real(s),s*0,s*0,s*0) +...
       qmul2(repmat(imag(t), [1 1 4]).*MU1 + cat(3, real(t),t*0,t*0,t*0), MU2);
end;

return
