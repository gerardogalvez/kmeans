clear ; close all; clc;
K = 2;
MAX_ITERS = 10;

img = double(imread('birds.jpg'));
img = img / 255;
imgSize = size(img);

figure('Position', [0 0 1240 680]);
subplot(2, 3, 1);
imshow(img);
title('Original');

subplotIndex = 2;

while (K <= 32)
	X = reshape(img, imgSize(1) * imgSize(2), 3);
	centroids = initializeCentroids(X, K);

	fprintf('Running K-means with K = %d\n', K);
	[centroids C] = kmeans(X, centroids, MAX_ITERS);
	C = findClosestCentroids(X, centroids);

	X = centroids(C, :);

	compressedImage = reshape(X, imgSize(1), imgSize(2), 3);
	
	subplot(2, 3, subplotIndex);
	imshow(compressedImage);
	title(sprintf('Compressed (K = %d)', K));
	
	K = K * 2;
	subplotIndex = subplotIndex + 1;
endwhile

