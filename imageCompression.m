% K-means clustering algorithm for image compression.
clear ; close all; clc;

% Starting K
K = 2;

MAX_ITERS = 10;

img = double(imread('birds.jpg'));
img = img / 255; % Scale image to values between 0 and 1
imgSize = size(img);

figure('Position', [0 0 1240 680]);
subplot(2, 3, 1);
imshow(img); % Plot original image
title('Original');

subplotIndex = 2;

% Run k-means for K = 2, 4, 8, 16, and 32
while (K <= 32)
	% Reshape m x n image to a m*n x 3 matrix
	X = reshape(img, imgSize(1) * imgSize(2), 3);

	% Randomly choose K points as centroids
	centroids = initializeCentroids(X, K);

	fprintf('Running K-means with K = %d\n', K);

	% Get centroids and to which centroid each point is assigned
	[centroids C] = kmeans(X, centroids, MAX_ITERS);

	% Set each point to the centroid it is assigned
	X = centroids(C, :);

	% Reshape m*n x 3 matrix to an mxn image
	compressedImage = reshape(X, imgSize(1), imgSize(2), 3);
	
	% Save image
	filename = strcat('birds', num2str(K), '.jpg');
	imwrite(compressedImage, filename);
	
	% Plot compressed image
	subplot(2, 3, subplotIndex);
	imshow(compressedImage);
	title(sprintf('Compressed (K = %d)', K));
	
	K = K * 2;
	subplotIndex = subplotIndex + 1;
endwhile