function centroids = initializeCentroids(X, K)
	% Initialize useful variables
	[m n] = size(X);
	centroids = zeros(K, n);
	
	% Randomly select K examples to be the initial centroids
	centroids = X(randperm(m, K), :);
end