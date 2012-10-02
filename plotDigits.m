function plotDigits(digitPats)

% After calling this function, re-size your figure window so that
% each pixel is approximately square.

colormap('gray');
j=0;
examplesPerDigit = size(digitPats,2)/2;
clf;
subplot(2,examplesPerDigit,1);
for dig = 1:2
  for pat = 1:examplesPerDigit
    j = j+1;
    axis off, subplot(2,examplesPerDigit,j);
    imagesc(reshape(digitPats(:,(dig-1)*examplesPerDigit+pat),28,28)');
  end
end
