

Q = zeros(2,2,4);

Q(1,1,:) = [1 1 1 1 ];
Q(1,2,:) = [2 1 0 -1];
Q(2,1,:) = [1 0 -1 2];
Q(2,2,:) = [3 2 -2 1];

A = qua2com2(Q);
[Uc, Sc, Vc] = svd(A);

Sq = sum(Sc);
Sq = Sq(1:2:end);

Uq = com2qua2(Uc);
Vq = qhermitian_trans(com2qua2(Vc));

qmul(squeeze(Uq(2,1,:)),squeeze(Vq(1,2,:)))*Sq(1)+qmul(squeeze(Uq(2,2,:)),squeeze(Vq(2,2,:)))*Sq(2)

Uq = zeros(2,2,4);

