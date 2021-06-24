function pos_orient = MGD()

% Lower bound & upper bound // will be replaced by l'espace de travaille
%lb = -Inf(1, 6);    ub = Inf(1,6);
lb = [-Inf, -Inf, -Inf, -Inf, -pi/4, -pi/4]; ub = [Inf, Inf, Inf, Inf, pi/4, pi/4];
pos_orient_init = ones(1,6);
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