function [J, grad] = linearRegCostFunction(X, y, theta, lambda)
%LINEARREGCOSTFUNCTION Compute cost and gradient for regularized linear 
%regression with multiple variables
%   [J, grad] = LINEARREGCOSTFUNCTION(X, y, theta, lambda) computes the 
%   cost of using theta as the parameter for linear regression to fit the 
%   data points in X and y. Returns the cost in J and the gradient in grad

% Initialize some useful values
m = length(y); % number of training examples

% You need to return the following variables correctly 
J = 0;
grad = zeros(size(theta));

% ====================== YOUR CODE HERE ======================
% Instructions: Compute the cost and gradient of regularized linear 
%               regression for a particular choice of theta.
%
%               You should set J to the cost and grad to the gradient.
%

% disp("sizes")
% disp(size(X))	% 12 x 2
% disp(size(y))	% 12 x 1
% disp(size(theta))	% 2 x 1
% disp(size(lambda))	% 1 x 1

hx = X * theta; % 12 x 1
squared_error = (hx - y) .^ 2; % 12 x 1
cost_term_one = sum(squared_error);

theta_start_with_zero = [0; theta(2:end)];	% 2 x 1
cost_term_two = sum(theta_start_with_zero .^ 2);

J = ((1 / (2 * m)) * cost_term_one) + ((lambda / (2 * m)) * cost_term_two);

grad_term_one = (1 / m) * sum((hx - y) .* X); % 1 x 2 | X = 12 x 2, (hx - y) = 12 x 1, (hx - y) .* X = 12 x 2, sum(..) = 1 x 2
grad_term_two = (lambda / m) * theta_start_with_zero; % 2 x 1
grad = grad_term_one +  grad_term_two'; % 1 x 2

% =========================================================================

grad = grad(:);

end
