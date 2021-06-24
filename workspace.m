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
delta = 0.001; % Pas de la simulation
%-------------------Enter the Links Length Here---------------------------
% And the range of Links is [0.01, 0.02]
L = [Lmin-delta Lmin-delta Lmin-delta];
%-------------------------------------------------------------------------

obj = VideoWriter('animation');
obj.Quality = 100;
obj.FrameRate = 20;
open(obj);

for i = 1 : (Lmax - Lmin)/delta
    L(1) = L(1) + delta;
     for j = 1 : (Lmax - Lmin)/delta
         L(2) = L(2) + delta;
        for k = 1 : (Lmax - Lmin)/delta
            cla
            L(3) = L(3) + delta;
            pos_orient = MGD();
            T_01 = AE2MT(pos_orient);
            modelisation(T_01);
            f= getframe(gcf);
            writeVideo(obj,f);
            workspaceCounter = workspaceCounter + 1;
            scatter3(workspaceP(:,1),workspaceP(:,2),workspaceP(:,3) );
        end
        L(3) = Lmin;
     end
     L(2) = Lmin;
end
close(obj)
figure(2);
hold on
axis equal;
axis([-0.02, 0.02 -0.02, 0.02 0.01, 0.036]);
grid on;
xlabel('X-axis / m');
ylabel('Y-axis / m');
zlabel('Z-axis / m');
view([1,1,1]);
scatter3(workspaceP(:,1),workspaceP(:,2),workspaceP(:,3) );





