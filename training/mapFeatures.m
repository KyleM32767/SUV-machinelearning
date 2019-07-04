#{
	
	mapFeatures.m
	
	Maps all features in the input matrix to polynomial features
	
	Params:
	X = a matrix with every each example in separate rows
	degree = the highest power to be used
	
	Return:
	X_poly = a matrix in the same format as X with the new mapped features appended onto it
	
	Author: Kyle Mitard
	
	Created 3 July 2019
	
#}

function X_poly = mapFeatures(X, degree)
	
	% initialize useful values
	n = length(X(1,:)); % number of features
	
	% initialize the matrix with mapped features
	X_poly = X;
	
	% exponentiate every feature by themselves
	for i = 2:degree
		X_poly = [X_poly, X .^ i];
	endfor	

	
	% the weird middle terms where they are multiplied together
	% i.e. A*B, A*B^2, A^2*B, ... etc up to the degree
	
	% for every degree up to the max degree
	for h = 2:degree
		
		% for every combination of features
		for i = 1:(n-1)
			for j = (i+1):n
				
				% for every combination of powers
				for k = 1:(h-1)
					X_poly = [X_poly, (X(:,i) .^ k) .* (X(:,j) .^ (h-k))];
				endfor
				
			endfor
		endfor
		
	endfor
	
endfunction
