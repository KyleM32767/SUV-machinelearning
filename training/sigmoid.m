#{
	sigmoid.m
	
	an implementation of the sigmoid function for any number, vector, or matrix
	
	author: Kyle Mitard
	
	Created 3 August 2019
#}

function g = sigmoid(z)
	
	euler = e * ones(size(z));
	g = (1 + e .^ -z) .^ -1;
	
endfunction