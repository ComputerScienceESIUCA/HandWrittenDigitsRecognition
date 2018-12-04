load mnist.mat


X = testX;

i = reshape(X(3,:), 28, 28)';

image(i);