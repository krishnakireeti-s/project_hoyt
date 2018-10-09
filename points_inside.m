function [points_in_ellipse,points_not_in_ellipse] = points_inside(a, b, x_0, y_0)

c = [];
for i = (x_0 - a) : 0.1 : (x_0 + a)
    for j = (y_0 - b): 0.1 : (y_0 + b)
        c = [c; i,j];
    end
end

x = c(:,1);
y = c(:,2);

points_in_ellipse = [];
points_not_in_ellipse = [];

[p,~] = size(x);

for i  = 1: p
    if( (((x(i) - x_0)/a)^2)  + (((y(i) - y_0)/b)^2) <= 1)
        points_in_ellipse = [points_in_ellipse; x(i) , y(i)];
    else
        points_not_in_ellipse = [points_not_in_ellipse ; x(i) , y(i)];
    end
end

% figure;
% 
% plot(points_in_ellipse(:,1),points_in_ellipse(:,2),'b.');
% hold on;
% plot(points_not_in_ellipse(:,1), points_not_in_ellipse(:,2),'r+');
% plot(x_0,y_0,'g*');
% axis on;
% grid on;
% hold off;

end
    
    
   