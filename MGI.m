function L = MGI(T_01)
R = 1e-02;
nx = T_01(1,1);     ox = T_01(1,2);     Xc = T_01(1,4)/R;
ny = T_01(2,1);     oy = T_01(2,2);     Yc = T_01(2,4)/R;
nz = T_01(3,1);     oz = T_01(3,2);     Zc = T_01(3,4)/R;

L1 = sqrt((nx+Xc-1)^2 + (ny+Yc)^2 + (nz+Zc)^2);
L2 = sqrt(((-nx+sqrt(3)*ox+2*Xc+1)^2 + (-ny+sqrt(3)*oy+2*Yc-sqrt(3))^2 + (-nz+sqrt(3)*oz+2*Zc)^2)/4);
L3 = sqrt(((-nx-sqrt(3)*ox+2*Xc+1)^2 + (-ny-sqrt(3)*oy+2*Yc+sqrt(3))^2 + (-nz-sqrt(3)*oz+2*Zc)^2)/4);

l1 = L1/R; l2 = L2/R; l3 = L3/R;
L = [l1; l2; l3];
