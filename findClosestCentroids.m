function C = findClosestCentroids(X, centroids)
	m = size(X, 1); % Number of examples
	K = size(centroids, 1); % Number of centroids
	C = zeros(m, 1);

	% For each example select which centroid is closest to it
	for ex = 1 : m
		minDist = inf;
		for cI = 1 : K
			dist = norm(X(ex, :) - centroids(cI, :)) ^ 2;
			if (dist < minDist)
				minDist = dist;
				C(ex, :) = cI;
			endif
		endfor
	endfor
end