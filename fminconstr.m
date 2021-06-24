function [c, ceq] = fminconstr(pos_orient)
%https://fr.mathworks.com/help/optim/ug/nonlinear-systems-with-constraints.html
c = [];
ceq = constraints(pos_orient);
end 

% zc + (sin(alpha)*sin(gamma))/100 - (cos(alpha)*cos(gamma)*sin(beta))/100
% zc - (sin(alpha)*sin(gamma))/200 + (3^(1/2)*(cos(gamma)*sin(alpha) + cos(alpha)*sin(beta)*sin(gamma)))/200 + (cos(alpha)*cos(gamma)*sin(beta))/200
% zc - (sin(alpha)*sin(gamma))/200 - (3^(1/2)*(cos(gamma)*sin(alpha) + cos(alpha)*sin(beta)*sin(gamma)))/200 + (cos(alpha)*cos(gamma)*sin(beta))/200
