---
title: "Codebook"
author: "Hectorooc"
date: "10/13/2020"
output: html_document
---

```{r setup, include=FALSE}
knitr::opts_chunk$set(echo = TRUE)
```

## Variables

 features <- Table which contains the features from the datset
    activities <- Table which contains the different activities measured in the test :
        names(Tidy_Table)[2] = "activity"
  "Acc", "Accelerometer" 
  "Gyro", "Gyroscope" 
  "BodyBody", "Body"
  "Mag", "Magnitude"
  "^t", "Time" : Time measurement for the  dataset
  "^f", "Frequency"
  "tBody", "TimeBody"
  "-mean()", "Mean" : Mean for the values in the dataset
  "-std()", "STD" : Standard Deviation for the values in the dataset
  "-freq()", "Frequency" : Frequency for the dataset
  "angle", "Angle"
  "gravity", "Gravity"
  
    subject_test <- Table which contains the subject code for the experiment
    x_test <- Table which contains the values for x in the test dataset
    y_test <- Table which contains the values for x in the test dataset
    subject_train <-Table which contains
    x_train <-Table which contains the values for x in the train dataset
    y_train <- Table which contains the values for y in the train dataset


