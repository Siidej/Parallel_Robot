% This function use the convention XYZ(Taite-Bryan angles) as the representation of rotation 
% Where : 
% Alpha -> rotation around axis x  /Roll(Roulis)
% Beta -> rotation around axis y /Pitch(Tangage)
% Yaw -> rotation around axis z /Yaw(Lacet)
function T_01 = AE2MT(pos_orient)
xc = pos_orient(1);
yc = pos_orient(2);
zc = pos_orient(3);
alpha = pos_orient(4);
beta = pos_orient(5);
gamma = pos_orient(6);

N = [cos(beta)*cos(gamma); cos(alpha)*sin(gamma)+cos(gamma)*sin(alpha)*sin(beta); sin(alpha)*sin(gamma)-cos(alpha)*cos(gamma)*sin(beta)];
O = [-cos(beta)*sin(gamma); cos(alpha)*cos(gamma)-sin(alpha)*sin(beta)*sin(gamma); cos(gamma)*sin(alpha)+cos(alpha)*sin(beta)*sin(gamma)];
A = [sin(beta); -cos(beta)*sin(alpha); cos(alpha)*cos(beta)];
pos = [xc; yc; zc];

T_01 = [N,O,A,pos];

T_01 = [T_01; [0 0 0 1]]; % homogenisation
