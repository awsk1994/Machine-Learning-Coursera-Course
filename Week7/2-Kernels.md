# Kernels 1

When faced with non-linear decision boundary, we can use more complex polynomial. And then you end up with a hypothesis X that:
   - predicts1, if you know that sum(theta * x) > 0
   - predict 0, otherwise.

<img src="./img/2/non-linear_decision_boundary.png" height="80"/>

## A) Features

To introduce a level of new notation that I'll use later, is that we can think of a hypothesis as computing a decision boundary using the new denotation f1, f2, f3 and so on to denote these new sort of features.

<img src="./img/2/thetaXF.png" height="80"/>

The question is, **Is there a different choice of features or is there better sort of features than this high order polynomials**? 

Because you know it's not clear that this high order polynomial is what we want and high order polynomials are computationally expensive. You have to ask: **Is there a different or a better choice of the features that we can use to plug into this sort of hypothesis form?**. 

So, here is one idea for how to define new features f1, f2, f3.

## B) Landmarks

<img src="./img/2/landmarks.png" height="80"/>

Now introducing another notation, l (for landmark). The formula is given in the slide.

The similarity function sometimes called "kernel" and "Gaussian kernel" is one type of kernel we chose: this is basically the exp(...) function.

To be specific, f1 is exp function over a summation of all x's distance to a particular l (landmark). 

<img src="./img/2/similarity_function.png" height="80"/>

<img src="./img/2/calculating_features.png" height="120"/>

## C) contours

<img src="./img/2/contour.png" height="200"/>

sigma^2 controls the contour. It is more obvious on a 3D graph above. As number of sigma decreases, the mountain/tip is more narrow; and vice versa.

# Kernels 2

## Where to get landmark from? or How to choose where to place landmarks?

1. Set up Landmark
   - Given X=[(x1,y1), (x2,y2),...], set l_i = x_i (set landmark = training set)

2. Compute feature
     - Example:
        - f_1 = similarity(x, l_1)
        - f_2 = similarity(x, l_2)
        - ...
    - You want to end up with a general 'f', where f = [f_0, f_1, ..., f_m]
    - Do set f_0 to 1 though.
    - Because landmark = training set, at one point, you will be comparing f_i^i = similarity(x^i, l^i) = 1.

## Minimizing Theta
<img src="./img/2/get_theta_formula.png" height="50"/>

 - There are 3-rd party software out there that will do the minimization problem. Use those. Do not write program that has already been written! Also, they usually have more advanced optimization tricks.

## C (=1/lambda)
 - Large C = lower bias, high variance
 - Small C = higher bias, lower variance.

## sigma^2
 - Large sigma^2: 
   - Features f_i vary more smoothly.
   - Higher bias, Lower variance.
 - Small sigma^2:
   - Features f_i vary less smoothly.
   - Lower bias, Higher variance.
