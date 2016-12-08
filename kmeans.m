function [centroids C] = kmeans(X, centroids, MAX_ITER)
	% Initialize useful variables
	m = size(X, 1); % Number of examples
	K = size(centroids, 1); % Number of clusters
	C = zeros(m, 1); % Indexes to which cluster each example is assigned
	iter = 0;

	oldCentroids = rand(size(centroids));
	while (iter < MAX_ITER && oldCentroids != centroids)

		oldCentroids = centroids;

		fprintf('Iteration %d/%d\n', iter+1, MAX_ITER);
		if exist('OCTAVE_VERSION')
        	fflush(stdout);
    	endif
    	
		C = findClosestCentroids(X, centroids);
		centroids = updateCentroids(X, C, K);
		
		iter = iter + 1;
	endwhile

	if (iter == MAX_ITER)
		printf('Reached last iteration.\n\n');
    else
    	printf('Reached convergence\n\n')
    endif
    
    if exist('OCTAVE_VERSION')
        	fflush(stdout);
	endif

