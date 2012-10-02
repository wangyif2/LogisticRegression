function plotSpiral(inputs,target,flag)

if nargin <3
    flag = 1;
end

hold on;

if flag ==1
	for i = 1:size(inputs,2)
		if target(1,i) == 0
            plot(inputs(1,i),inputs(2,i),'r*');
		else 
            plot(inputs(1,i),inputs(2,i),'bo');
		end
	end
elseif flag == 0
	for i = 1:size(inputs,2)
		plot(inputs(1,i),inputs(2,i),'y.');
	end
else
	for i = 1:size(inputs,2)
		plot(inputs(1,i),inputs(2,i),'g.');
	end
end
