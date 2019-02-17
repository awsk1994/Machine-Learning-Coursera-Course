# Definition of Machine Learning
## Arthur Samuel (1959). 
Machine Learning: Field of study that gives computers the ability to learn without being explicitly programmed. 
## Tom Mitchell (1998) 
Well-posed Learning Problem: A computer program is said to learn from experience E with respect to some task T and some performance measure P, if its performance on T, as measured by P, improves with experience E. 

### Example
Suppose your email program watches which emails you do or do not mark as spam, and based on that learns how to better filter spam.  What is the task T in this setting?

T = Classifying emails as spam or not spam. 

E = Watching you label emails as spam or not spam.

P = The number (or fraction) of emails correctly classified as spam/not spam. 

# Supervised Learning
 - Create model from dataset to predict an outcome, given the input.

 - Datasets are labeled.

 - Types:
   - **Regression**: Predict continuous valued output (eg. price)

   - **Classification**: Discrete valued output (0 or 1)

 - Examples:
    - (Classification) Given email labeled as spam/not spam, learn a spam filter.

    - (Classification) Given a dataset of patients diagnosed as either having diabetes or not, learn to classify new patients as having diabetes or not. 

# Unsupervised Learning

 - Learn relationships between elements (or group them) in a data set and classify the raw data without "help."

 - Given a set of news articles found on the web, group them into set of articles about the same story. 

 - Given a database of customer data, automatically discover market segments and group customers into different market segments. 

 - Examples:
    - Given a set of news articles found on the web, group them into set of articles about the same story. 
    - Given a database of customer data, automatically discover market segments and group customers into different market segments. 