function plotKnn(data_train, label_train, data_test, label_test)

if (nargin < 4)
   error('Not enough input arguments');
end

hold on;

for k=0:29
	result = knn(k+1, data_train, label_train, data_test);
	total = sum( abs( label_test(1,:) - result(1,:)));
	percent_correct = ( size(label_test,2) - total )/size(label_test,2) ;
	plot(k+1, percent_correct, 'b*');	
end

