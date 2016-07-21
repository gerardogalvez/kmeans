function centroids = updateCentroids(X, C, K)
	% Initialize useful variables
	[m n] = size(X);
	centroids = zeros(K, n);

	% Update each centroid to the mean of all the examples assigned to it
	for cI = 1 : K
		centroids(cI, :) = mean(X(find(C == cI), :));
	endfor
end