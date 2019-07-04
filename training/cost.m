#{
	cost.m
	
	The cost function for logistic regression, which will be minimized with fminunc
	
	author: Kyle Mitard
	
	Created 3 August 2019
#}

function [J, grad] = cost(theta, X, y)
	
	% some useful values
	m = length(y);  % number of training samples
	n = length(theta); % number of features
	lambda = 1; % regularization parameter
	
	% set cost function
	J = sum( -y' * log(sigmoid(X * theta)) - (1 - y)' * log(1 - sigmoid(X * theta))) / m + lambda / (2 * m) * sum([0, ones(1, n - 1)] * theta .^ 2);
	
	% set gradient
	grad(1) = sum((sigmoid(X * theta) - y) .* X(:, 1)) / m;
	for i ; 2:n
		grad(i) = sum((sigmoid(X * theta) - y) .* X(:, i)) / m + theta(i) * lambda / m;   
	endfor
	
endfunction 
