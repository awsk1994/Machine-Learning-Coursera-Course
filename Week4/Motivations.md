# Non-Linear Hypothesis
Suppose you have a non-linear regression with a lot of features (as shown below).

<img src="./img/motivations_non_linear_regression_graph.png" height="200"/> <img src="./img/motivations_non_linear_regression_features.png" height="200"/>

Suppose we have 100 features. If we were to include all quadratic terms (meaning second or polynomial terms), there would be a lot of them. Specifically, around 5000 features. (approx n^2/2 to n^2):

<img src="./img/motivations_non_linear_num_features.png" height="100"/>

Another option is to include only a subset of these. 