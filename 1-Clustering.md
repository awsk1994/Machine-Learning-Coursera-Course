# Unsupervised Learning: Introduction

 - In supervised learning problems, we are given a set of labels to fit a hypothesis to it.
 - In contrast, in unsupervised learning problem we're given **data that does not have any labels** associated with it. 
 - We simply give this sort of unlabeled training set to an algorithm and ask the algorithm to **find some structure in the data** for us.

Below is supervised learning, where we have labels x and o, and we want to fit a hypothesis.
<img src="./img/1/supervised_learning.png" height="200"/>

Below is unsupervised learning, where we don't have any labels.
<img src="./img/1/unsupervised_learning.png" height="200"/>

Given the data set above, since it looks like there are two seaprate clusters of points, we might have an algorithm finds clusters.

<img src="./img/1/clustering_algorithm.png" height="200"/>

This would be our first type of unsupervised learning. There will be other types of unsupervised learning algorithms that we'll talk about later that finds other types of structure or other types of patterns in the data. 

## Applications

Early in this class I already mentioned a few applications:

1. Market Segmentation
 - where you may have a database of customers and want to group them into different marker segments so you can sell to them separately or serve your different market segments better.

 2. Social network analysis.
 - There are groups that have done things like looking at a group of people's social networks. (eg. Facebook, Google+, or maybe information about who other people that you email the most frequently and who are the people that they email the most frequently) and find coherence in groups of people.
 - This would be another maybe clustering algorithm where you know want to find who are the coherent groups of friends in the social network? 

3. Organize computer cluster.
 - Use clustering to organize computer clusters or to organize data centers better. 
 - Because if you know which computers in the data center in the cluster tend to work together, you can use that to reorganize your resources and how you layout the network and how you design your data center communications. 

4. Astronomial Data Analysis.
 - Using clustering algorithms to understand galaxy formation and using that to understand astronomical data.
 
# K-means algorithm
 - The K Means algorithm is by far the most popular and widely used clustering algorithm.

## Informal Steps
1. Below is a graph of our unlabled data.

<img src="./img/1/k-means-step1.png" height="200"/>

2. Randomly initialize two points, called the "cluster centroids". 
    - as shown by the two crosses in image below.
    - I have two of them because I want to group my data into two clusters.

 <img src="./img/1/k-means-step2.png" height="200"/>

3. Then there are 2 iterative steps:

4. Cluster Assignment Step

    - Going through each of the data points (the green dots) and depending on whether it's closer to the red cluster centroid or the blue cluster centroid, it is going to assign each of the data points to one of the two cluster centroids.

<img src="./img/1/k-means-step3.png" height="200"/>

5. Move Centroid Step
    - We are going to take the two cluster centroids, that is, the red cross and the blue cross, and move them to the average of the points colored the same colour. 
    - We look at all the red points and compute the average (the mean of the location of all the red points,) and move the red cluster centroid there. And the same things for the blue cluster centroid.
    - The red and blue cluster centroid moved. 

6. And then we repeat the Cluster Assignment and Move Centroid Step.
    - In fact, at some point, if you keep running additional iterations of K means, the cluster centroids and the colours of the points will not change any further. 
    - This is when we say K means has converged.


<img src="./img/1/k-means-step4.png" height="200"/>


<img src="./img/1/k-means-step5.png" height="200"/>


<img src="./img/1/k-means-step6.png" height="200"/>

## Formal Definition
<img src="./img/1/k-means-input.png" height="200"/>

The K means algorithm takes two inputs:

1. Parameter K, which is the number of clusters you want to find in the data. 
    - I'll later say how we might go about trying to choose k

2. Unlabeled traininset of Xs.
    - And for unsupervised learning of the K means, I'm going to use the convention that Xi is an R^N dimensional vector. 
    - that's why my training examples are now N dimensional rather N plus one dimensional vectors. (??)

<img src="./img/1/k-means-algo.png" height="200"/>

For the Cluster assignment step, we use <img src="./img/1/closest_algo.png" height="20"/> to find the "cluster centroid closest to x(i)



