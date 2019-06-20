# Examples and Intuitions I
A simple example of applying neural networks is by predicting x[1] AND x[2], which is the logical 'and' operator.

The graph of our functions will look like:
<img src="./img/neuralnetwork_gz_function.png" height="80"/>

Remember that x[0] is our bias variable and is always 1.

Let's set our first theta matrix as:

Θ^(1)=[−30, 20, 20]

This will cause the output of our hypothesis to only be positive if both x[1] and x[2] are 1. The calculations are as follows:
<img src="./img/logical_and_calculations.png" height="100"/>

So we have constructed one of the fundamental operations in computers by using a small neural network rather than using an actual AND gate. Neural networks can also be used to simulate all the other logical gates. The following is an example of the logical operator 'OR'.

<img src="./img/logical_Or_representation.png" height="150"/>

Where g(z) is the following:

<img src="./img/sigmoid_function.png" height="150"/>

# Examples and Intuitions II

The Θ^(1) matrices for AND, NOR, and OR are:
<img src="./img/theta_nums_for_logical_AND_OR_NOR.png" height="100"/>

We can combine these to get the XNOR logical operator (which gives 1 if x[1] and x[2] are both 0 or both 1).

<img src="./img/XNOR_neuralnetwork_idea.png" height="100"/>

For the transition between the first and second layer, we'll use a Θ^(1) matrix that combines the values for AND and NOR:

<img src="./img/XNOR_layer1_theta.png" height="60"/>

For the transition between the second and third layer, we'll use a Θ(2) matrix that uses the value for OR:

<img src="./img/XNOR_layer2_theta.png" height="30"/>

Let's write out the values for all our nodes:

<img src="./img/XNOR_activation_node_calculation.png" height="100"/>

And there we have the XNOR operator using a hidden layer with two nodes! The following summarizes the above algorithm:

<img src="./img/XNOR_screenshot.png" height="250"/>

# MultiClass classification

To classify data into multiple classes, we let our hypothesis function return a vector of values. Say we wanted to classify our data into one of four categories. We will use the following example to see how this classification is done. This algorithm takes as input an image and classifies it accordingly:

<img src="./img/one-vs-all-screenshot.png" height="250"/>

We can define our set of resulting classes as y:

<img src="./img/multiclass-outputs.png" height="80"/>

Each y^(i) represents a different image corresponding to either a car, pedestrian, truck, or motorcycle. The inner layers, each provide us with some new information which leads to our final hypothesis function. The setup looks like:

<img src="./img/multiclass-neuralnetwork-idea.png" height="80"/>

Our resulting hypothesis for one set of inputs may look like:

<img src="./img/multiclass-example-output.png" height="80"/>

In which case our resulting class is the third one down, or hΘ(x)3, which represents the motorcycle.
