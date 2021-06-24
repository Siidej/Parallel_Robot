function F = constraints(pos_orient)
global L R; 
l1 = L(1);      L1 = l1/R;      
l2 = L(2);      L2 = l2/R;
l3 = L(3);      L3 = l3/R;

xc = pos_orient(1);     alpha = pos_orient(4);
yc = pos_orient(2);     beta = pos_orient(5);
zc = pos_orient(3);     gamma = pos_orient(6);

nx = cos(beta)*cos(gamma);
ny = cos(alpha)*sin(gamma)+cos(gamma)*sin(alpha)*sin(beta);
nz = sin(alpha)*sin(gamma)-cos(alpha)*cos(gamma)*sin(beta);

ox = -cos(beta)*sin(gamma);
oy = cos(alpha)*cos(gamma)-sin(alpha)*sin(beta)*sin(gamma);
oz = cos(gamma)*sin(alpha)+cos(alpha)*sin(beta)*sin(gamma);

Xc = xc/R; Yc = yc/R; Zc = zc/R;

% -------------6 equations for xc, yc, zc, alpha, beta, gamma--------------
F(1) = (nx+Xc-1)^2 + (ny+Yc)^2 + (nz+Zc)^2 - L1*L1;
F(2) = ((-nx+sqrt(3)*ox+2*Xc+1)^2 + (-ny+sqrt(3)*oy+2*Yc-sqrt(3))^2 + (-nz+sqrt(3)*oz+2*Zc)^2)/4 - L2*L2;
F(3) = ((-nx-sqrt(3)*ox+2*Xc+1)^2 + (-ny-sqrt(3)*oy+2*Yc+sqrt(3))^2 + (-nz-sqrt(3)*oz+2*Zc)^2)/4 - L3*L3;
% 3 physical constraints applied by flexi-star
F(4) = ny + Yc;
F(5) = ny - ox; 
F(6) = (nx - oy)/2 - Xc;
