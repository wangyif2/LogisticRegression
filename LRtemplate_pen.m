%%
clear all;
close all;

%% load data
% load('spiral1_test.mat');
% load('spiral1_train.mat');

% load('spiral2_test.mat');
% load('spiral2_train.mat');

load('mnist_test.mat');
load('mnist_train.mat');
[n,m] = size(inputs_train);

%learning rate
parameters.learning_rate = 0.01
%weight regularization parameter
parameters.weight_regularization = 0.2
%number of iterations
parameters.num_iterations = 500
%logistics regression weights
weights = -ones(n+1, 1);
% weights = -rand(n+1, 1);

%% verify that your logistic function produces the right gradient, diff should be very close to 0
%this creates small random data with 20 examples and 10 dimensions and checks the gradient on
%that data
nexamples = 20;
ndimensions = 10;
diff = checkgrad('logistic', ...
	randn((ndimensions + 1), 1), ... % weights
    0.001,... % perturbation
    randn(nexamples, ndimensions), ... % data        
    rand(nexamples, 1), ... % targets
    parameters)

if(diff > 1e-007)
	error('Grad check failed');
end
	
% begin learning with gradient descent
for t = 1:parameters.num_iterations
	% find the negative log likelihood and derivative w.r.t. weights
	[f, df, frac_correct_train] = logistic_pen(weights, inputs_train', target_train(1,:)', parameters);

	% find the fraction of correctly classified validation examples
	[temp, temp2, frac_correct_valid] = logistic_pen(weights, inputs_test', target_test(1,:)', parameters);

	%
    if isnan(f) || isinf(f)
		error('nan/inf error');
	end

	% update parameters
	weights = weights - parameters.learning_rate .* df;

	% print some stats
	fprintf(1, 'ITERATION:%4i   LOGL:%4.2f   TRAIN FRAC:%2.2f   VALID FRAC:%2.2f\n',...
			t, f, frac_correct_train*100, frac_correct_valid*100);
	
	% plot the log-likelihood vs iteration
	hold on;
	plot(t, f, 'b*');	
end
