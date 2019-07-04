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

% append the data with polynomial terms up to the 2nd power
degree = 2;
X = mapFeatures(X, degree);

% get a model by minimizing the cost function with fminunc
initialTheta = zeros(length(X),1);
options = optimset('GradObj', 'on', 'MaxIter', 500);
[optTheta, functionVal, exitFlag] = fminunc( @(t)cost(t,X,y), initialTheta, options );

% save the model in model.txt
save 'model.txt' optTheta -ascii;
printf('Model trained with a cost of ')
disp(functionVal)

% initialize extraneous test cases
miata = [2, 0, 1, 2, 154.1, 68.1, 48.6, 4.92, 0]; % Mazda Miata (not an SUV)
miata = mapFeatures(miata, degree);
landCruiser = [4, 1, 3, 8, 196.5, 78.0, 77.6, 8.9, 2]; % Toyota Land Cruiser (SUV)
landCruiser = mapFeatures(landCruiser, degree);
soul = [4, 1, 2, 5, 165.2, 70.9, 63.0, 6.7, 1]; % Kia Soul (???)
soul = mapFeatures(soul, degree);

% evaluate test cases
printf('The Mazda Miata is ')
printf(num2str(sigmoid(miata * optTheta) * 100))
disp('% SUV')

printf('The Toyota Land Cruiser is ')
printf(num2str(sigmoid(landCruiser * optTheta) * 100))
disp('% SUV')

printf('The Kia Soul is ')
printf(num2str(sigmoid(soul * optTheta) * 100))
disp('% SUV')