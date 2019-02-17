# Model Representation

 - is supervised learning
 
## Example
Size of House(X) -> h (Hypothesis) -> Estimated Price(Y)

h maps X to Y

## Representing h
h(x) = theta[0] + theta[1] * x

# Cost Function
Recall that hypothesis is h(x) = theta[0] + theta[1] * x

But how to choose theta[i]?

## Idea
Choose theta[0], theta[1] so that h(x) is close to y for our training examples (x,y).

## In equation

Step 1: The following represents minimizing theta[0] and theta[1] to match our output(y) as much as possible
![Minimizing Cost Function - 1](./minCostFunc_1.png)


Step 2: Let J(theta[0], theta[1]) be most of our cost function.
![Minimizing Cost Function - 2](./minCostFunc_2.png)


Step 3: Combine step 1 and step 2 equations to get
![Minimizing Cost Function - 3](./minCostFunc_3.png)

Equation J(theta[0], theta[1]) is also known as the **"Squared Error Function"**.

## Summary
![Summary of Cost Function](./CostFuncSummary.png)

# Gradient Descent
 - Finding best theta[0] and theta[1] to minimize cost function.

 