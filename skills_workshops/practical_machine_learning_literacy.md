# Practical Machine Learning Literacy - Zack Akil - Upskilling Talk

[All Workshops](README.md)

Zack's handle: @ZackAkil

## Objectives

- [x] Learn enough to know how to talk about it to anyone.
- [x] Key question to ask machine learning engineers.
- [x] Do some hands on machine learning.

## Background

Started as test engineer, went to machine learning meetups and did courses. Ran his own meetup. Google hired him to champion machine learning.

## What Is Machine Learning

Instead of defining rules, show algorithms data and let it come up with the rules.

You get feedback on if you were right or wrong, so you then learn what decisions to make.

Rules are found through training, from input data and labels.

After you have generated the rules, you can feed it new data and get the labels for that data.

You need contrasting data so the algorithm can work out the differences between the two.

The more data, correctly labelled, the better.

You can then split your dataset into training examples, and test examples.

Train your model with the training examples, then check it can do what you think it should be able to do with the test examples input data and compare the model's prediction to the known test examples output.

You must test the model with data it has never seen before.

You can then work out an accuracy of your model.

## Vocab

Input data  
Output/target/label Data
Feature Engineering  
Overfitting  
Train/Test split  
Train score  
Test score

## Types of ML

Supervised - Very useful, most ML, given some numbers, predict the rest

Un-Supervised - Pretty useful, customer segmentation

Reinforcement - cool, game playing AIs

## Supervised Learning

Outputs are either:

- Classification, predicting the class
- Regression, predicting the value, numeric

Tabular data is structured

Text and images are unstructured data

kaggle.com - data science dataset repositories

### Regression

Given the age of the pineapple, predict the weight

Collect the data of weight for a bunch of pineapples at known ages.

Linear regression, the line of best fit.

[Example](https://colab.research.google.com/github/ZackAkil/practical-machine-learning-literacy/blob/master/1_Line_Practical_ML_Literacy_.ipynb)

### Jupyter Notebook

This allows you to write markdown alongside python and run it in browser.

scikit learn. One of the most popular things.

### Classification

Predict the type of flower based on flower attributes.

Petal width and length, sepal width and length.

Decision tree algorithm helps you work it out

[Example](https://colab.research.google.com/github/ZackAkil/practical-machine-learning-literacy/blob/master/2_Tree_Practical_ML_Literacy_.ipynb)

scikit learn has a bunch of data sets that comes with it.

### Handling Text

Create a unique dictionary for your data set. Then for each sentence you can count the number of each word in it. This is called feature engineering.

[Example](https://colab.research.google.com/github/ZackAkil/practical-machine-learning-literacy/blob/master/3_Text_Tree_Practical_ML_Literacy_.ipynb)

### Choosing a Model

Mainly trial and error, and instinct.

If you try to solve a problem in ML, look for anyone else having solved the problem or a similar problem.

For example look for trigger word detection models.

Models that can solve different problems with different data of a similar structures.

## Overfitting

It is bad to do really closely fitted squiggly lines of best fit.

It over fits the training data.

To check this keep the test examples handy to test with afterwards.

If something is 99% accurate on test data, it's probably overfitted.

The accuracy on test data after training is important.

[Example](https://playground.tensorflow.org/#activation=relu&batchSize=4&dataset=circle&regDataset=reg-plane&learningRate=0.03&regularizationRate=0&noise=40&networkShape=4,4,4,4&seed=0.52140&showTestData=false&discretize=false&percTrainData=10&x=true&y=true&xTimesY=false&xSquared=false&ySquared=false&cosX=false&sinX=false&cosY=false&sinY=false&collectStats=false&problem=classification&initZero=false&hideText=false&activation_hide=true&regularization_hide=true&regularizationRate_hide=true&learningRate_hide=true&problem_hide=true&noise_hide=true&batchSize_hide=true&dataset_hide=true&discretize_hide=true&percTrainData_hide=false&numHiddenLayers_hide=true&stepButton_hide=true)

For example, a production model was only shown cars on roads. A cutout of a car didn't get picked up, because it was overfitted with the road included (the noise).

Improving the diversity of your data helps this.

Data augmentation can also be performed.

For example on the MNIST dataset, you can move about the images to generate more data.

[Example](https://colab.research.google.com/github/ZackAkil/practical-machine-learning-literacy/blob/master/4_Hand_writing_Overfitting_Practical_ML_Literacy.ipynb)

[Book](https://www.amazon.co.uk/Deep-Learning-Python-Francois-Chollet/dp/1617294438)

[Course](https://www.coursera.org/specializations/deep-learning)
