function [xi,yi] = get_seed_points(image)

figure;
imshow(image);
[xi,yi] = getpts;

end
