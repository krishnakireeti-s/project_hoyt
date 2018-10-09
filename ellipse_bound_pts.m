function [bound_points_mat] = ellipse_bound_pts(seed_pt)

x_0 = seed_pt(1);
y_0 = seed_pt(2);

a = 5;
b = 3;

x = (x_0 - a) : (a/x_0)*0.01 : (x_0 + a);
y_1 = y_0 + b*(sqrt(1 - ((x - x_0)/a).^2));
y_2 = y_0 - b*(sqrt(1 - ((x - x_0)/a).^2));

bound_points_mat = [ x', y_1' ; x', y_2'];
% figure;
% plot(bound_points_mat(:,1), bound_points_mat(:,2), 'g.');
% hold on; 
% plot(x_0,y_0,'b*');
% axis on; grid on;
% 

end