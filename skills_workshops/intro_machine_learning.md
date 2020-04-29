# Intro To Machine Learning - Seminar

[All Workshops](README.md)

## What is Machine Learning

> Machine learning is the science of getting computers to act without being explicitly programmed.

Stanford

> Traditionally, software engineering combined human created rules with data to create answers to a problem. Instead Machine Learning uses data and answers to discover the rules behind the problem.

Chollet

> The field of machine learning seeks to answer the question "How can we build computer systems that automatically improve with experience, and what are the fundamental laws that govern all learning processes?"

Carnegie Mellon

## Famous Applications

### Recommendations

In EBay, Amazon, Netflix etc.

Based on what other users have done in the past it will recommend other products, movies etc.

### Self Driving Cars

Computer vision reads the context of the road to drive the car

### Phishing Emails

Phishing emails want you to click malicious links.

Machine learning can help distinguish between real and fake emails.

### Photo Categorisation

Yelp uses a a model to tell if images of seating are inside or outside.

## Approach

Supervised Learning vs Unsupervised Learning vs Reinforcement Learning

### Supervised

- Provide an input and output.
- Image of orange, tell model this is an orange.
- Require labelled data.
- Labour intensive to create large labelled datasets.
- The model can learn to identify features that are shared, but have different values between different data.
- Then to test, provide an unlabelled image, the model hopefully will be able to identify it.

### Unsupervised

- The data is not labelled.
- The model tries to find patterns and similarity, and differences.
- It won't know what to call it, but you can tell it what the category it has identified is called later.

### Reinforcement Learning

- Ask something of the model.
- Correct its response.
- The model will adjust its assessment of the data.

## Process

- Data collection: get data
- Data preparation: remove unnecessary duplicates etc
- Training: expose model to data as above
- Evaluation: test it
- Tuning: correct it

A lot of time (75%) will be on data collection and preparation.

### How to Evaluate

| .             | .        | **Actual**     | **Actual**     |
| ------------- | -------- | -------------- | -------------- |
| .             | .        | Positive       | Negative       |
| **Predicted** | Positive | True Positive  | False Positive |
| **Predicted** | Negative | False Negative | True Negative  |

Accuracy and F1 scores can tell you how good your model is. 

## Example of Rule based vs Machine learning

Phishing emails are usually dealt with by rules set by humans.

Machine learning could also be used to discover what things indicate an email as phishing vs real.

Demonstrate what your model can do better than a rules based approach.

## Studying and Become an Expert in Machine Learning

You can do it!

Go ahead and learn it with any course.

Become learned!

## Difficulties facing Machine Learning

Biased or unlabelled data sets.

## AI, Machine Learning, Deep Learning

AI is everything.

Machine learning is part of AI.

Deep learning is a technique to facilitate learning in Machine Learning, alternative to supervised/unsupervised.

### Links

[Coursera](https://www.coursera.org/learn/machine-learning)
