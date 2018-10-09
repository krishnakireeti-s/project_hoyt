

A = imread('139.tif');
A_oneeighth = A(1:480,1:640,:);



I = rgb2gray(A_oneeighth);
I = adapthisteq(I);
I = imclearborder(I);
I = wiener2(I, [3 3]);

bw = imbinarize(I, graythresh(I));

bw2 = imfill(bw,'holes');

bw3 = imopen(bw2, strel('disk',2));

bw4 = bwareaopen(bw3, 50);

bw4_perim = bwperim(bw4);
overlay1 = imoverlay(I, bw4_perim, [1 .3 .3]);
% Discover putative cell centroids
maxs = imextendedmax(I,  5);
maxs = imclose(maxs, strel('disk',3));
maxs = imfill(maxs, 'holes');
maxs = bwareaopen(maxs, 2);
overlay2 = imoverlay(I, bw4_perim | maxs, [1 .3 .3]);

% modify the image so that the background pixels and the extended maxima pixels are forced to be the only local minima in the image.
% Jc = imcomplement(I);
I_mod = imimposemin(I, bw4 | maxs);
L = watershed(I_mod);

labeledImage = label2rgb(L);

[L, num] = bwlabel(L);
mask = imbinarize(L, 1);
overlay3 = imoverlay(I, mask, [1 .3 .3]);
imshow(overlay3);

% plot the obtained images
subplot(3,4,1);
imshow(A_oneeighth);
title('Original Image sliced 1/8th');

subplot(3,4,2);
imshow(I);
title('Image after Wiener Filtering');

subplot(3,4,3);
imshow(bw);
title('Image binarized');

subplot(3,4,4);
imshow(bw2);
title('Image filled with holes artificially');

subplot(3,4,5);
imshow(bw3);
title('Image after image opening operation w/ disk as strel');

subplot(3,4,6);
imshow(bw4);
title('Image after performing area-opening operation');


subplot(3,4,7);
imshow(bw4_perim);
title('Image showing perimeter of the area enclosed');

subplot(3,4,8);
imshow(overlay1);
title('Overlay Image 1');

subplot(3,4,9);
imshow(overlay2);
title('Overlay Image 2');

subplot(3,4,10);
imshow(overlay1);
title('Overlay Image 3');

subplot(3,4,11);
imshow(labeledImage);
title('Labeled Image');

subplot(3,4,12);
imshow(L);
title('Watershed function');
