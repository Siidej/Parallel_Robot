function modelisation(T_01)
global workspaceP workspaceCounter
% We define the the distances between the centroid and the vertex, both R and
% r are eauql to 0.01 m 

% And the range of Links is [0.01, 0.02]

% The length of the needle is 0.015 m

%-----------------------------Robot Parames--------------------------------
global R r;
% Ball joints pos in Moving Platform frame{1}
Pb1_1 = [r; 0; 0];
Pb2_1 = [-r/2; sqrt(3)*r/2; 0];
Pb3_1 = [-r/2; -sqrt(3)*r/2; 0];
% Pin joints pos in Base Platform frame{0}
Pp1_0 = [R; 0; 0];
Pp2_0 = [-R/2; sqrt(3)*R/2; 0];
Pp3_0 = [-R/2; -sqrt(3)*R/2; 0];
% Ball joints pos in Base Platform frame{0}
Pb1_0 = T_01*[Pb1_1;1];
Pb2_0 = T_01*[Pb2_1;1];
Pb3_0 = T_01*[Pb3_1;1];
% Dehomogenisation
Pb1_0 = Pb1_0(1:3);
Pb2_0 = Pb2_0(1:3);
Pb3_0 = Pb3_0(1:3);
% Moving platform's origin's pos in base platform
Po_0  = (Pb1_0+Pb2_0+Pb3_0)./3;
% Links Length
Ll1 = norm(Pb1_0 - Pp1_0);
Ll2 = norm(Pb2_0 - Pp2_0);
Ll3 = norm(Pb3_0 - Pp3_0);

%-----------------------------3-D-Plot-------------------------------------
% h=gca;
% delete(h);
figure(1);
hold on
axis equal;
axis([-0.02, 0.02 -0.02, 0.02 -0.01, 0.036]);
grid on;
xlabel('X-axis / m');
ylabel('Y-axis / m');
zlabel('Z-axis / m');
view([1,1,1]);
% Plot Needle
oB1 = Pb1_0 - Po_0;
oB2 = Pb2_0 - Po_0;
needle = cross(oB1, oB2)/(sin(120)*r);
needle = needle+Po_0;

plot3([Po_0(1), needle(1)],...
      [Po_0(2), needle(2)],...
      [Po_0(3), needle(3)],...
      '-k', 'LineWidth', .5); 
%plot3(needle(1), needle(2), needle(3), '*c');
%norm(needle - Po_0);

%scatter3(needle(1), needle(2), needle(3));

workspaceP(workspaceCounter, :) = needle;

% Base frame
plot3([0,0.005], [0,0], [0,0], '-r', 'LineWidth', .5); % axis X
plot3(0.005, 0, 0, '>r');
plot3([0,0], [0,0.005], [0,0], '-g', 'LineWidth', .5); % axis Y
plot3(0, 0.005, 0, '<g');
plot3([0,0], [0,0], [0,0.005], '-b', 'LineWidth', .5); % axis Z
plot3(0, 0, 0.005, '^b');

f = [1 2 3];
vP = [Pp1_0'; Pp2_0'; Pp3_0'];
patch('Faces', f, 'Vertices', vP, 'FaceColor', 'black', 'FaceAlpha', .5);
vB = [Pb1_0'; Pb2_0'; Pb3_0'];
patch('Faces', f, 'Vertices', vB, 'FaceColor', 'cyan', 'FaceAlpha', .5);
% Plot Ball joints
plot3(Pb1_0(1), Pb1_0(2), Pb1_0(3), 'o','Color','b','MarkerSize',10,'MarkerFaceColor','#D9FFFF');
plot3(Pb2_0(1), Pb2_0(2), Pb2_0(3), 'o','Color','b','MarkerSize',10,'MarkerFaceColor','#D9FFFF');
plot3(Pb3_0(1), Pb3_0(2), Pb3_0(3), 'o','Color','b','MarkerSize',10,'MarkerFaceColor','#D9FFFF');
% Plot Pin joints
plot3(Pp1_0(1), Pp1_0(2), Pp1_0(3), 's','Color','k','MarkerSize',10,'MarkerFaceColor','#D9FFFF');
plot3(Pp2_0(1), Pp2_0(2), Pp2_0(3), 's','Color','k','MarkerSize',10,'MarkerFaceColor','#D9FFFF');
plot3(Pp3_0(1), Pp3_0(2), Pp3_0(3), 's','Color','k','MarkerSize',10,'MarkerFaceColor','#D9FFFF');
% Plot Links
plot3([Pp1_0(1), Pb1_0(1)], [Pp1_0(2), Pb1_0(2)], [Pp1_0(3), Pb1_0(3)], 'b', 'LineWidth', 2);
plot3([Pp2_0(1), Pb2_0(1)], [Pp2_0(2), Pb2_0(2)], [Pp2_0(3), Pb2_0(3)], 'b', 'LineWidth', 2);
plot3([Pp3_0(1), Pb3_0(1)], [Pp3_0(2), Pb3_0(2)], [Pp3_0(3), Pb3_0(3)], 'b', 'LineWidth', 2);
% Links length
str = ['LenL1 = ', num2str(Ll1)];
text(-0.02, 0.015, 0.02, [str, 'm'])
str = ['LenL2 = ', num2str(Ll2)];
text(-0.02, 0.015, 0.015, [str, 'm']);
str = ['LenL3 = ', num2str(Ll3)];
text(-0.02, 0.015, 0.01, [str, 'm']);
hold on
plot3(needle(1), needle(2), needle(3), '*c');







% figure(2);
% hold on;
% grid on;
% xlabel('X-axis / m');
% ylabel('Y-axis / m');
% zlabel('Z-axis / m');
% view([1,1,1]);
% axis equal;
% axis([-0.02, 0.02 -0.02, 0.02 -0.01, 0.036]);
% scatter3(needle(1), needle(2), needle(3));
% hold off 

