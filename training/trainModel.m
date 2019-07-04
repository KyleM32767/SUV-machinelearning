#{
	
	trainModel.m
	
	Trains a model for logistic regression, and stores it in model.txt
	
	Author: Kyle Mitard
	
	Created 3 July 2019
	
#}


% load data
X = load('data_x.txt');
y = load('data_y.txt');


% initialize useful values
m = length(y);  % number of training samples
n = length(X(1,:)); % number of features


% append the data with polynomial terms up to the 4th power
X = mapFeatures(X, 4);

