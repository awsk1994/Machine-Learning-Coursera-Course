# Model Representation

 - is supervised learning
 
## Example
Using an example of house prices based on size of the house, you can think of the model being like:

Size of House(X) -> h (Hypothesis) -> Estimated Price(Y)

 - h maps X to Y
 - h can be represented by: **h(x) = theta[0] + theta[1] * x**

# Cost Function
Recall that hypothesis is h(x) = theta[0] + theta[1] * x

But how to choose theta[i]?

## Idea
Choose theta[0], theta[1] so that h(x) is close to y for our training examples (x,y).

## In equation

Step 1: The following represents minimizing theta[0] and theta[1] to match our output(y) as much as possible

<img src="./img/minCostFunc_1.png" width="400">

Step 2: Let J(theta[0], theta[1]) be most of our cost function.

<img src="./img/minCostFunc_2.png" width="400">

Step 3: Combine step 1 and step 2 equations to get

<img src="./img/minCostFunc_3.png" width="400">

Equation J(theta[0], theta[1]) is also known as the **"Squared Error Function"**.

## Summary
<img src="./img/CostFuncSummary.png" width="400">

# Gradient Descent
 - Finding best theta[0] and theta[1] to minimize cost function.

 - If we plot J(theta[0],theta[1]), theta[0] and theta[1] together, we should see something like this:

<img src="./img/gradientDescent_1.png" width="400">

 - Looking below, the right side is the same graph as above, but the J(theta[0], theta[1]) is sqeezed down and we are using a xy-plot on theta[0] and theta[1]. 
 - The circled circle represents a selected J(theta[0],theta[1]). And how that looks like on our cost function is shown on the graph on the left.

 - The global minimum point (of J(theta[0], theta[1])) is our optimial solution because we want the smallest cost possible - but how do we find that?

 - The answer is **Gradient Descent**.

<img src="./img/gradientDescent_2.png" width="400">

## Basic Outline of Strategy

1. Start with some theta[0], theta[1].
2. Keep changing theta[0] and theta[1] to reduce J(theta[0], theta[1]) until we hopefully end up at a minimum.

## Algorithm
<img src="./img/gradientDescentAlgorithm.jpg" width="400">

 - Since we are dealing with linear regression, we can sub the cost function, J(theta).

<img src="./img/gradientDescentAlgorithm_linearRegression.png" width="400">

 - The derivative will move our theta to the local minimum.

<img src="./img/gradientDescentAlgorithm_Explanation.png" width="400">

 - So isn't it a problem since it moves to the local minimum? 
 - It turns out that cost function of linear regression will always be bow shaped; local minimum = global minimum.

 - **Learning Rate**(depicted by alpha) is also vey important. It determines how much we attempt to reach the minimum. 

<img src="./img/gradientDescent_learningRate.png" width="400">

 - Lastly, this method looks at every example in the entire training set on every step, and is called **batch gradient descent.**

