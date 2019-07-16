function [J grad] = nnCostFunction(nn_params, ...
                                   input_layer_size, ...
                                   hidden_layer_size, ...
                                   num_labels, ...
                                   X, y, lambda)
%NNCOSTFUNCTION Implements the neural network cost function for a two layer
%neural network which performs classification
%   [J grad] = NNCOSTFUNCTON(nn_params, hidden_layer_size, num_labels, ...
%   X, y, lambda) computes the cost and gradient of the neural network. The
%   parameters for the neural network are "unrolled" into the vector
%   nn_params and need to be converted back into the weight matrices. 
% 
%   The returned parameter grad should be a "unrolled" vector of the
%   partial derivatives of the neural network.
%

% Reshape nn_params back into the parameters Theta1 and Theta2, the weight matrices
% for our 2 layer neural network
Theta1 = reshape(nn_params(1:hidden_layer_size * (input_layer_size + 1)), ...
                 hidden_layer_size, (input_layer_size + 1));

Theta2 = reshape(nn_params((1 + (hidden_layer_size * (input_layer_size + 1))):end), ...
                 num_labels, (hidden_layer_size + 1));

% Setup some useful variables
m = size(X, 1);
         
% You need to return the following variables correctly 
J = 0;
Theta1_grad = zeros(size(Theta1));
Theta2_grad = zeros(size(Theta2));

% disp("c0")
% disp(size(Theta1_grad))
% disp(size(Theta2_grad))

% ====================== YOUR CODE HERE ======================
% Instructions: You should complete the code by working through the
%               following parts.
%
% Part 1: Feedforward the neural network and return the cost in the
%         variable J. After implementing Part 1, you can verify that your
%         cost function computation is correct by verifying the cost
%         computed in ex4.m
%
% Part 2: Implement the backpropagation algorithm to compute the gradients
%         Theta1_grad and Theta2_grad. You should return the partial derivatives of
%         the cost function with respect to Theta1 and Theta2 in Theta1_grad and
%         Theta2_grad, respectively. After implementing Part 2, you can check
%         that your implementation is correct by running checkNNGradients
%
%         Note: The vector y passed into the function is a vector of labels
%               containing values from 1..K. You need to map this vector into a 
%               binary vector of 1's and 0's to be used with the neural network
%               cost function.
%
%         Hint: We recommend implementing backpropagation using a for-loop
%               over the training examples if you are implementing it for the 
%               first time.
%
% Part 3: Implement regularization with the cost function and gradients.
%
%         Hint: You can implement this around the code for
%               backpropagation. That is, you can compute the gradients for
%               the regularization separately and then add them to Theta1_grad
%               and Theta2_grad from Part 2.
%

% disp(size(Theta1)) % 25x401
% disp(size(Theta2)) % 10x26
% disp(size(X))	% 5000x400
% disp(hidden_layer_size) % 25
% disp(input_layer_size)	% 400
% disp(num_labels)	% 10
% disp(size(y))	% 5000x1
% yVec size = 5000x10

% PART 1
a1 = [ones(m,1) X];	% 5000x401
z2 = a1 * Theta1';	% 5000x401 x 401x25 = 5000x25
a2 = sigmoid(z2);

a2 = [ones(m,1) a2];	% 5000x26
a3 = a2 * Theta2';	% 5000x10
hx = sigmoid(a3);		

yVec = zeros(m,num_labels);
for i = 1:m
    yVec(i,y(i)) = 1;
end

J = 0;
for i = 1:m
	term1 = yVec(i,:) .* log(hx(i, :));	% 5000x10
	term2 =  (1-yVec(i,:)) .* log(1-hx(i,:));	% 5000x10
	J = J + sum(term1 + term2);
end
J = -1 * (1/m) * sum(J);

% Regularization
theta_1_reg = 0;
for j = 1:size(Theta1, 1)
	for k = 2:size(Theta1, 2)
		theta_1_reg = theta_1_reg + Theta1(j,k)^2 ;
	end
end

theta_2_reg = 0;
for j = 1:size(Theta2, 1)
	for k = 2:size(Theta2, 2)
		theta_2_reg = theta_2_reg + Theta2(j,k)^2;
	end
end

regulator = theta_1_reg + theta_2_reg;
J = J + (lambda / (2 * m)) * regulator;


% PART 2
% disp(size(X))		% 5000x401
% disp(size(Theta1_grad))	% 25x401
% disp(size(Theta2_grad)) % 10x26
% disp(size(Theta2)) % 10x26

big_delta1 = zeros(size(Theta1_grad));
big_delta2 = zeros(size(Theta2_grad));

for t=1:m
	% 1. Feed-Forward
	a1 = [1 X(t,:)];	% X(t,:) = 1x401 => 1x401
	z2 = a1 * Theta1';	% 1x401 * 401x25 x  = 1x25
	a2 = [1 sigmoid(z2)];	% 1x26

	z3 = a2 * Theta2';	% 1x26 * 26x10 = 1x10
	a3 = sigmoid(z3);

	% Data Process result matrix.
	yy = ([1:num_labels]==y(t)); %1x10

	% 2. Calculate 'Error Values' (final layer)
	delta3 = a3 - yy;	% 1x10

	% 3. Calculate 'Error Values' (hidden layer)
	d2_1 = delta3 * Theta2;
	d2_2 = [1 sigmoidGradient(z2)]; % 1x26
	delta2 = d2_1 .* d2_2; % 1x26

	delta2 = delta2(2:end);	% Removing bias row => 1x25

	% !! delta_1 is not calculated because we do not associate error with the input layer   

	% 5. Calculate Capital Delta Matrix
	Theta1_grad = Theta1_grad + delta2' * a1;
	Theta2_grad = Theta2_grad + delta3' * a2;
end

% Adding Regularization
reg_theta1_grad = lambda * Theta1(:, 2:end)
Theta1_grad = (1/m) * (Theta1_grad + [zeros(size(Theta1, 1), 1) reg_theta1_grad]);		% 25x401

reg_theta2_grad = lambda * Theta2(:, 2:end)
Theta2_grad = (1/m) * (Theta2_grad + [zeros(size(Theta2, 1), 1) reg_theta2_grad]);		% 10x26

% -------------------------------------------------------------

% =========================================================================

% disp("d0")
% disp(size(Theta1_grad))
% disp(size(Theta2_grad))

% Unroll gradients
grad = [Theta1_grad(:) ; Theta2_grad(:)];
% disp("d1")
% size(grad)

end
