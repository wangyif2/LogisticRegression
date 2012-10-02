function [output] = sigmoid(totalIn)
  output = 1.0 ./ (ones(size(totalIn)) + exp(-totalIn));

