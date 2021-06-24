clear
close all
clc

%-----------------------------Pos Init-------------------------------------
global L R r Lmax Lmin workspaceP workspaceCounter
r = 1e-2;% radius of Moving Platform at m
R = 1e-2;% radius of Base Platform at m
Lmax = 2e-2;
Lmin = 1e-2;
workspaceP = [0 0 0];
workspaceCounter = 1;
%-------------------Enter the Links Length Here---------------------------
% And the range of Links is [0.01, 0.02]
L = [0.01 0.01 0.01];
%-------------------------------------------------------------------------
delta = 0.001;
% figure(1);
% hold on;
obj = VideoWriter('animation');
obj.Quality = 100;
obj.FrameRate = 5;
open(obj);

traj = [-0.0041 -0.0072 0.028-0.015 0 0 0;
    0.0039 -0.0037 0.0276-0.015 0 0 0;
    -0.002 0 0.026-0.015 0 0 0;
    0.0039 0.0037 0.0276-0.015 0 0 0;
    -0.0041 0.0072 0.028-0.015 0 0 0];

pos_orient = zeros(1,6);
for i = 1 : length(traj)-1
    pos_orient = traj(i,:);
    T_01 = AE2MT(pos_orient);
    modelisation(T_01);
    f= getframe(gcf);
    writeVideo(obj,f);
    workspaceCounter = workspaceCounter + 1;
end

% for i = 1 : (Lmax - Lmin)/delta
%     L(1) = L(1) + delta;
%      for j = 1 : (Lmax - Lmin)/delta
%          L(2) = L(2) + delta;
%         for k = 1 : (Lmax - Lmin)/delta
%             L(3) = L(3) + delta;
%             pos_orient = MGD();
%             T_01 = AE2MT(pos_orient);
%             modelisation(T_01);
%             f= getframe(gcf);
%             writeVideo(obj,f);
%             workspaceCounter = workspaceCounter + 1;
%         end
%         L(3) = Lmin;
%      end
%      L(2) = Lmin;
% end
scatter3(workspaceP(:,1),workspaceP(:,2),workspaceP(:,3) );
close(obj)
