clc;
clear all;
tic;

%load seed points from data_matrix

load('xi_values.mat');
load('yi_values.mat');
I = imread('139.tif');
 I_sub = I(1:480,1:640,:);

I_rgb2gray = rgb2gray(I_sub);

% [xi,yi] = get_seed_points(I_rgb2gray);
% pause;
figure;
imshow(I_rgb2gray);
hold on;
xi = round(xi);
yi = round(yi);
plot(xi,yi,'r*');
impixelinfo;
colorbar;
axis 'on';
grid on;
hold off;

% determined portion of sub-image and indices manually
I_test = I_rgb2gray(315:390,210:310,:);

seed_pt = [59,45;49,24;29,38];
[m,n] = size(seed_pt);

%length and breadth given as vector
lb_mat = [28, 22;28,22; 20 16];

%call the function 'seed_point_script.m' for the number of rows in
%seed_pt_matrix
figure;

for i = 1:m
[structure(i).points_in_mat , structure(i).points_not_in_mat] = seed_point_script(seed_pt(i,:),I_test,lb_mat(i,1),lb_mat(i,2));

%shape constraint - rectangular shape constraint
l = lb_mat(i,1);
b = lb_mat(i,2);

subplot(2,2,i);

imshow(I_test);
hold on;

%plot border - green *'s
for yi_t = (seed_pt(i,2)-b/2) : (seed_pt(i,2) + b/2)
     for xi_t = (seed_pt(i,1) - l/2) : (seed_pt(i,1) + l/2)
         if((yi_t == (seed_pt(i,2)-b/2)) || (yi_t == (seed_pt(i,2) + b/2)))
                 plot(xi_t,yi_t,'g*');
         elseif((yi_t ~= (seed_pt(i,2)-b/2))||(yi_t ~=(seed_pt(i,2) + b/2)))
                  temp1 = (seed_pt(i,1) - l/2);                 
                  temp2 = (seed_pt(i,1) + l/2);
                  plot(temp1,yi_t,'g*',temp2,yi_t,'g*');
         end
    end
end

%plot points satisfying threshold from the matrix - blue +'s
plot(structure(i).points_in_mat(:,2),structure(i).points_in_mat(:,1),'b.');

% plot the seed point in a different color - yellow *
plot(seed_pt(i,1),seed_pt(i,2),'y*');
% suptitle('Segmented Cells using Region Growing Algorithm');
axis 'on';
grid on;
impixelinfo;
hold off;

end

subplot(2,2,4)
imshow(I_test);
title('Original Image considered for segmentation');
axis 'on';
grid on;
impixelinfo;

toc;



