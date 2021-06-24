function pos_orient = MGD()

% Lower bound & upper bound 
%lb = [-Inf, -Inf, -Inf, -Inf, -pi/4, -pi/4]; 
%ub = [Inf, Inf, Inf, Inf, pi/4, pi/4];
lb = [-0.00141, -0.00171, -0.00001, -0.85651, -0.70181, -0.18191]; 
ub = [0.0011, 0.00171, 0.021, 0.85651, 0.78541, 0.1891];
pos_orient_init = ones(1,6)*0.01;
opts = optimoptions(@fmincon,'Algorithm','interior-point','Display','off');
pos_orient = fmincon(@(pos_orient)0,pos_orient_init,[],[],[],[],lb,ub, @fminconstr, opts);


% func = @(pos_orient)constraints(pos_orient, L);
% pos_orient_init = zeros(1,6);
% % pos_orient = fsolve(func, pos_orient_init);









% function [c, ceq] = fminconstr1(L)
% %https://fr.mathworks.com/help/optim/ug/nonlinear-systems-with-constraints.html
%     c = [];
%     ceq = @(pos_orient)constraints(pos_orient,L);
% end
% 
% pos_orient = fmincon(@(pos_orient)0,pos_orient_init,[],[],[],[],[],[], @fminconstr1, opts);
% end