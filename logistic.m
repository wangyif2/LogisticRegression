%%%%
%Calculate log likelihood and derivatives with respect to weights
% Inputs:
% 	weights - (M+1) by 1 vector of weights, last element corresponds to bias (intercepts)
% 	data - N by M data matrix where each row corresponds to one data point
%	targets - N by 1 vector of targets class probabilites
% 	parameters - structure with additional parameters
% Outputs:
%	f - cross entropy
%	df - (M+1) by 1 vector of derivatives
%	frac_correct - fraction of correctly classified examples
%%%%
function [f, df, frac_correct] = logistic(weights, data, targets, parameters)

%get the dimention of the output
[n,m] = size(targets);

%append a column of zero for w0
data = [ones(size(data,1),1), data];	

%compute the prob of our classification
p = sigmoid(data*weights);

%compute the cross-entropy for where targets only takes value of 0 or 1
f = -sum(targets .* log(p) + (1 - targets) .* log(1 - p));

%compute the derivative
for k = 1:size(weights)
	df(k,1) = sum((p-targets) .* data(:, k));
end

%compute the correctly predicted output
p = (p >= 0.5);
frac_correct = sum(targets == p) / size(targets, 1);

end