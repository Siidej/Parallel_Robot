clear
close all
clc

%-----------------------------Pos Init-------------------------------------

global L R r workspaceP
r = 1e-2;% radius of Moving Platform at m
R = 1e-2;% radius of Base Platform at m
L = [0.01 0.01 0.015];
workspaceP = [0 0 0];

pos_orient = MGD();
T_01 = AE2MT(pos_orient);
modelisation(T_01);
MGI(T_01)




















% L = [0.015, 0.015, 0.0];
% target = MGD(L)