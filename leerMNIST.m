load mnist.mat


X = testX;
Y = testY;
i = reshape(X(3,:), 28, 28)';

image(i);