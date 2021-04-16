---
title: "README"
author: "Daria Karpova"
date: "4/16/2021"
output: html_document
---

## About this repository 

This repository contains the course project for Getting and Cleaning Data course by John Hopkins university on Coursera.

The dataset used for this assignment is Human Activity Recognition Using Smartphones. It can be collected at: 
https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip  

All of the information on the original raw data is available at:
http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones 

This repository contains the following:

1. CodeBook.md describes the process of obtaining the outcome data and the data itself.

2. run_analysis.R script checks the working directory for the 'UCI HAR Dataset' folder and if it's not present downloads the data and unpacks it. Later the data is cleaned and the result is saved to the 'tidy_data.txt' file.

    Cleaning part consists of the following steps:

        1. Merging of the train and test sets into one data frame.
        2. Only measurements providing informatiion on mean or standard deviation have been left. Particularly, all names not containing 'mean' or 'std'  have been discarded (except for 'Subject' and 'Activity' fields).
        3. Replacement of the activity identifiers ( numbers from 1 to 6) by the corresponding activity names from the "activity_labels.txt".
        4. Replaccement of the column names by the ones which are more descriptive.
            a. All special symbols except for dashes were removed. Dashes have been left for better readability.
            b. Abbreviations have been removed:
                 + 'f' -> 'FrequencyDomain' 
                 + 't' -> 'TimeDomain'
                 + 'Acc' -> 'Accelerometer'
                 + 'Gyro' -> 'Gyroscope'
                 + 'Mag' -> 'Magnitude'
                 + 'mean' -> 'Mean
                 + 'std' -> 'StandardDeviation'
            c. One spelling mistake has been removed:
                 + 'BodyBody' -> 'Body'
        5. The final tidy dataset is created with measurements substituted by their average for each activity and each subject.The dataset is saved as 'tidy_data.txt'
