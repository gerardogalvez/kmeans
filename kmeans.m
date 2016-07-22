function [centroids C] = kmeans(X, centroids, MAX_ITER)
	% Initialize useful variables
	m = size(X, 1); % Number of examples
	K = size(centroids, 1); % Number of clusters
	C = zeros(m, 1); % Indexes to which cluster each example is assigned

	for iter = 1 : MAX_ITER
		fprintf('Iteration %d/%d\n', iter, MAX_ITER);
		if exist('OCTAVE_VERSION')
        		fflush(stdout);
    		endif
		C = findClosestCentroids(X, centroids);
		centroids = updateCentroids(X, C, K);
	endfor
end
