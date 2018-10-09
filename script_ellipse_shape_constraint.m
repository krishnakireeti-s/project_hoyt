% points script for plotting

seed_pt = [2,3];
x_0 = seed_pt(1);
y_0 = seed_pt(2);
a = 5;
b = 3;
[points_in_ellipse,points_not_in_ellipse] = points_inside(a, b, x_0, y_0);
[bound_points_mat] = ellipse_bound_pts(seed_pt);

%plotting
figure;
%plot boundary points
plot(bound_points_mat(:,1), bound_points_mat(:,2), 'g*');
hold on; 
plot(points_in_ellipse(:,1),points_in_ellipse(:,2),'b.');
plot(x_0,y_0,'r*');
axis on;
grid on;
hold off;

