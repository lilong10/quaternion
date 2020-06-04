function [C, z0, z1] = QBM(Q)

% calculate m1
E_q0 = mean(mean(Q(:,:,1)));
E_q1 = mean(mean(Q(:,:,2)));
E_q2 = mean(mean(Q(:,:,3)));
E_q3 = mean(mean(Q(:,:,4)));
m1 = [E_q0 E_q1 E_q2 E_q3];
m1 = m1 - 0.01;
% translate data points
q0 = Q(:,:,1) - E_q0;
q1 = Q(:,:,2) - E_q1;
q2 = Q(:,:,3) - E_q2;
q3 = Q(:,:,4) - E_q3;

% calculate m2
q0_sqr = q0.*q0;
q1_sqr = q1.*q1;
q2_sqr = q2.*q2;
q3_sqr = q3.*q3;
q_sqr_sum = q0_sqr+q1_sqr+q2_sqr+q3_sqr;
m2 = mean(mean(q_sqr_sum));

% calculate m3
m3 = zeros(1,4);
m3(1) = mean(mean(q_sqr_sum.*q0));
m3(2) = mean(mean(q_sqr_sum.*q1));
m3(3) = mean(mean(q_sqr_sum.*q2));
m3(4) = mean(mean(q_sqr_sum.*q3));
m3;

% calculate c0, c1
c0 = -m2;
c1 = -m3/m2;

% calculate u, v, w, a1, a2
u = (c1(1)*c1(3) - c1(2)*c1(4))/(c1(4)*c1(4)+c1(3)*c1(3));
v = (c1(2)*c1(3) + c1(1)*c1(4))/(c1(4)*c1(4)+c1(3)*c1(3));
w = (c1(2)*v + c1(1)*u + c1(3))/(c1(1)*v - c1(2)*u + c1(4));
a1= (1+w*w)*(1+u*u+v*v);
a2 = w*(u*c1(1)+v*c1(2)+c1(3)) - u*c1(2) + v*c1(1) + c1(4);

% calculate z0, z1
z0 = zeros(1,4);
z1 = zeros(1,4);

z0(4) = (-sqrt(a2*a2-4*a1*c0)-a2)/(2*a1);
z0(1) = (w*u+v)*z0(4);
z0(2) = (w*v-u)*z0(4);
z0(3) = w*z0(4);

z1(4) = (sqrt(a2*a2-4*a1*c0)-a2)/(2*a1);
z1(1) = (w*u+v)*z1(4);
z1(2) = (w*v-u)*z1(4);
z1(3) = w*z1(4);

z1 = z1+m1;
z0 = z0+m1;

% calculate binary map
C = ones(size(Q,1), size(Q,2));
s = sum(z0.*z0 - z1.*z1)/(2*(z0(1)-z1(1)));
t1 = (z0(2)-z1(2))/(z0(1)-z1(1));
t2 = (z0(3)-z1(3))/(z0(1)-z1(1));
t3 = (z0(4)-z1(4))/(z0(1)-z1(1));
q = s - t1*Q(:,:,2) - t2*Q(:,:,3) - t3*Q(:,:,4);
%q = sum(z0.*z0 - z1.*z1)/2 - (z0(2)-z1(2))*Q(:,:,2) - (z0(3)-z1(3))*Q(:,:,3) - (z0(4)-z1(4))*Q(:,:,4);

C(find(q>0)) = 0;

