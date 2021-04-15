---
title: "CodeBook"
author: "Daria Karpova"
date: "4/14/2021"
output:
  html_document:
    keep_md: yes
---

## Project Description
This codebook is created for *Getting and Cleaning Data* course project from 'Data Science Specialization' on Coursera procided by 'Johns Hopkins University'.
According to the instructions the purpose of this project is to demonstrate one's ability to collect, work with, and clean a data set. The goal is to prepare tidy data that can be used for later analysis. 

## Study design and data processing

### Collection of the raw data
The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, we captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. The experiments have been video-recorded to label the data manually. The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data.

The sensor signals (accelerometer and gyroscope) were pre-processed by applying noise filters and then sampled in fixed-width sliding windows of 2.56 sec and 50% overlap (128 readings/window). The sensor acceleration signal, which has gravitational and body motion components, was separated using a Butterworth low-pass filter into body acceleration and gravity. The gravitational force is assumed to have only low frequency components, therefore a filter with 0.3 Hz cutoff frequency was used. From each window, a vector of features was obtained by calculating variables from the time and frequency domain.

Full description is available under http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

## Creating the tidy datafile

### Guide to create the tidy data file
To create the tidy data file one needs to run the 'run_analysis.R' script. The script checks the working directory for the 'UCI HAR Dataset' folder and if it's not present downloads the data and unpacks it. Later the data is cleaned and the oustcome is saved to the 'tidy_data.txt' file.

### Cleaning of the data
Cleaning part consists of the following steps:

1. Merging of the train and test sets into one data frame.
2. Only measurements providing informatiion on mean or standard deviation have been left. Particularly, all names not containing 'mean' or 'std' have been discarded (except for 'Subject' and 'Activity' fields).
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
    c. One spelling mistake have been removed:
        + 'BodyBody' -> 'Body'
5. The final tidy dataset is created with measurements substitud by their average for each activity and each subject.

## Description of the variables in the tiny_data.txt file
Th dataset contains 68 variables, two of which are identifiers ('Subject' and 'Activity'), the rest is measurements. 

### Identifiers
| Variable name       |Data type       |  Range  | Description                                                                                                          |
|---------------------|----------------|---------|----------------------------------------------------------------------------------------------------------------------|
| Subject             | integer        |  1 - 30 | Person identifier.                                                                                                   |
| Activity            | factor         |  1 -  6 | Activity type: WALKING, WALKING UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING                              |

### Averages of time domain variables
|           Variable name                                             |Data type|  Range  | Description                                                                         |
|---------------------------------------------------------------------|---------|---------|-------------------------------------------------------------------------------------|
| Average-TimeDomainBodyAccelerometer-Mean-X                          | numeric | [-1, 1] | Averages means of the body acceleration on X axis.                                  |
| Average-TimeDomainBodyAccelerometer-Mean-Y                          | numeric | [-1, 1] | Averages means of the body acceleration on Y axis.                                  |
| Average-TimeDomainBodyAccelerometer-Mean-Z                          | numeric | [-1, 1] | Averages means of the body acceleration on Z axis.                                  |
| Average-TimeDomainBodyAccelerometer-StandardDeviation-X             | numeric | [-1, 1] | Averages standard deviations of the body acceleration on X axis.                    |
| Average-TimeDomainBodyAccelerometer-StandardDeviation-Y             | numeric | [-1, 1] | Averages standard deviations of the body acceleration on Y axis.                    |
| Average-TimeDomainBodyAccelerometer-StandardDeviation-Z             | numeric | [-1, 1] | Averages standard deviations of the body acceleration on Z axis.                    |
| Average-TimeDomainGravityAccelerometer-Mean-X                       | numeric | [-1, 1] | Averages means of the gravity acceleration on X axis.                               |
| Average-TimeDomainGravityAccelerometer-Mean-Y                       | numeric | [-1, 1] | Averages means of the gravity acceleration on Y axis.                               |
| Average-TimeDomainGravityAccelerometer-Mean-Z                       | numeric | [-1, 1] | Averages means of the gravity acceleration on Z axis.                               |
| Average-TimeDomainGravityAccelerometer-StandardDeviation-X          | numeric | [-1, 1] | Averages standard deviations of the gravity acceleration on X axis.                 |
| Average-TimeDomainGravityAccelerometer-StandardDeviation-Y          | numeric | [-1, 1] | Averages standard deviations of the gravity acceleration on Y axis.                 |
| Average-TimeDomainGravityAccelerometer-StandardDeviation-Z          | numeric | [-1, 1] | Averages standard deviations of the gravity acceleration on Z axis.                 |
| Average-TimeDomainBodyAccelerometerJerk-Mean-X                      | numeric | [-1, 1] | Averages means of the jerk of the body acceleration on X axis.                      |
| Average-TimeDomainBodyAccelerometerJerk-Mean-Y                      | numeric | [-1, 1] | Averages means of the jerk of the body acceleration on Y axis.                      |
| Average-TimeDomainBodyAccelerometerJerk-Mean-Z                      | numeric | [-1, 1] | Averages means of the jerk of the body acceleration on Z axis.                      |
| Average-TimeDomainBodyAccelerometerJerk-StandardDeviation-X         | numeric | [-1, 1] | Averages standard deviations of the jerk of the body acceleration on X axis.        |
| Average-TimeDomainBodyAccelerometerJerk-StandardDeviation-Y         | numeric | [-1, 1] | Averages standard deviations of the jerk of the body acceleration on Y axis.        |
| Average-TimeDomainBodyAccelerometerJerk-StandardDeviation-Z         | numeric | [-1, 1] | Averages standard deviations of the jerk of the body acceleration on Z axis.        |
| Average-TimeDomainBodyGyroscope-Mean-X                              | numeric | [-1, 1] | Averages means of the angular velocity on X axis.                                   |
| Average-TimeDomainBodyGyroscope-Mean-Y                              | numeric | [-1, 1] | Averages means of the angular velocity on Y axis.                                   |
| Average-TimeDomainBodyGyroscope-Mean-Z                              | numeric | [-1, 1] | Averages means of the angular velocity on Z axis.                                   |
| Average-TimeDomainBodyGyroscope-StandardDeviation-X                 | numeric | [-1, 1] | Averages standard deviations of the angular velocity on X axis.                     |
| Average-TimeDomainBodyGyroscope-StandardDeviation-Y                 | numeric | [-1, 1] | Averages standard deviations of the angular velocity on Y axis.                     |
| Average-TimeDomainBodyGyroscope-StandardDeviation-Z                 | numeric | [-1, 1] | Averages standard deviations of the angular velocity on Z axis.                     |
| Average-TimeDomainBodyGyroscopeJerk-Mean-X                          | numeric | [-1, 1] | Averages means of the jerk of the angular velocity on X axis.                       |
| Average-TimeDomainBodyGyroscopeJerk-Mean-Y                          | numeric | [-1, 1] | Averages means of the jerk of the angular velocity on Y axis.                       |
| Average-TimeDomainBodyGyroscopeJerk-Mean-Z                          | numeric | [-1, 1] | Averages means of the jerk of the angular velocity on Z axis.                       |
| Average-TimeDomainBodyGyroscopeJerk-StandardDeviation-X             | numeric | [-1, 1] | Averages standard deviations of the jerk of the angular velocity on X axis.         |
| Average-TimeDomainBodyGyroscopeJerk-StandardDeviation-Y             | numeric | [-1, 1] | Averages standard deviations of the jerk of the angular velocity on Y axis.         |
| Average-TimeDomainBodyGyroscopeJerk-StandardDeviation-Z             | numeric | [-1, 1] | Averages standard deviations of the jerk of the angular velocity on Z axis.         |
| Average-TimeDomainBodyAccelerometerMagnitude-Mean                   | numeric | [-1, 1] | Averages means of the magnitude of the body acceleration.                           |
| Average-TimeDomainBodyAccelerometerMagnitude-StandardDeviation      | numeric | [-1, 1] | Averages standard deviations of the magnitude of the body acceleration.             |
| Average-TimeDomainGravityAccelerometerMagnitude-Mean                | numeric | [-1, 1] | Averages means of the magnitude of the gravity acceleration.                        |
| Average-TimeDomainGravityAccelerometerMagnitude-StandardDeviation   | numeric | [-1, 1] | Averages standard deviations of the magnitude of the gravity acceleration.          |
| Average-TimeDomainBodyAccelerometerJerkMagnitude-Mean               | numeric | [-1, 1] | Averages means of the magnitude of the jerk of the body acceleration.               |
| Average-TimeDomainBodyAccelerometerJerkMagnitude-StandardDeviation  | numeric | [-1, 1] | Averages standard deviations of the magnitude of the jerk of the body acceleration. |
| Average-TimeDomainBodyGyroscopeMagnitude-Mean                       | numeric | [-1, 1] | Averages means of the magnitude of the angular velocity.                            |
| Average-TimeDomainBodyGyroscopeMagnitude-StandardDeviation          | numeric | [-1, 1] | Averages standard deviations of the magnitude of the angular velocity.              |
| Average-TimeDomainBodyGyroscopeJerkMagnitude-Mean                   | numeric | [-1, 1] | Averages means of the magnitude of the jerk of the angular velocity.                |
| Average-TimeDomainBodyGyroscopeJerkMagnitude-StandardDeviation      | numeric | [-1, 1] | Averages standard deviations of the magnitude of the jerk of the angular velocity.  |

### Averages of the frequency domain variables
| Variable name                                                           |Data type|  Range  | Description                                                                         |
|-------------------------------------------------------------------------|---------|---------|-------------------------------------------------------------------------------------|
| Average-FrequencyDomainBodyAccelerometer-Mean-X                         | numeric | [-1, 1] | Averages means of the body acceleration on X axis.                                  |
| Average-FrequencyDomainBodyAccelerometer-Mean-Y                         | numeric | [-1, 1] | Averages means of the body acceleration on Y axis.                                  |
| Average-FrequencyDomainBodyAccelerometer-Mean-Z                         | numeric | [-1, 1] | Averages means of the body acceleration on Z axis.                                  |
| Average-FrequencyDomainBodyAccelerometer-StandardDeviation-X            | numeric | [-1, 1] | Averages standard deviations of the body acceleration on X axis.                    |
| Average-FrequencyDomainBodyAccelerometer-StandardDeviation-Y            | numeric | [-1, 1] | Averages standard deviations of the body acceleration on Y axis.                    |
| Average-FrequencyDomainBodyAccelerometer-StandardDeviation-Z            | numeric | [-1, 1] | Averages standard deviations of the body acceleration on Z axis.                    |
| Average-FrequencyDomainBodyAccelerometerJerk-Mean-X                     | numeric | [-1, 1] | Averages means of the jerk of the body acceleration on X axis.                      |
| Average-FrequencyDomainBodyAccelerometerJerk-Mean-Y                     | numeric | [-1, 1] | Averages means of the jerk of the body acceleration on Y axis.                      |
| Average-FrequencyDomainBodyAccelerometerJerk-Mean-Z                     | numeric | [-1, 1] | Averages means of the jerk of the body acceleration on Z axis.                      |
| Average-FrequencyDomainBodyAccelerometerJerk-StandardDeviation-X        | numeric | [-1, 1] | Averages standard deviations of the jerk of the body acceleration on X axis.        |
| Average-FrequencyDomainBodyAccelerometerJerk-StandardDeviation-Y        | numeric | [-1, 1] | Averages standard deviations of the jerk of the body acceleration on Y axis.        |
| Average-FrequencyDomainBodyAccelerometerJerk-StandardDeviation-Z        | numeric | [-1, 1] | Averages standard deviations of the jerk of the body acceleration on Z axis.        |
| Average-FrequencyDomainBodyGyroscope-Mean-X                             | numeric | [-1, 1] | Averages means of the jerk of the angular velocity on X axis.                       |
| Average-FrequencyDomainBodyGyroscope-Mean-Y                             | numeric | [-1, 1] | Averages means of the jerk of the angular velocity on Y axis.                       |
| Average-FrequencyDomainBodyGyroscope-Mean-Z                             | numeric | [-1, 1] | Averages means of the jerk of the angular velocity on Z axis.                       |
| Average-FrequencyDomainBodyGyroscope-StandardDeviation-X                | numeric | [-1, 1] | Averages standard deviations of the jerk of the angular velocity on X axis.         |
| Average-FrequencyDomainBodyGyroscope-StandardDeviation-Y                | numeric | [-1, 1] | Averages standard deviations of the jerk of the angular velocity on Y axis.         |
| Average-FrequencyDomainBodyGyroscope-StandardDeviation-Z                | numeric | [-1, 1] | Averages standard deviations of the jerk of the angular velocity on Z axis.         |
| Average-FrequencyDomainBodyAccelerometerMagnitude-Mean                  | numeric | [-1, 1] | Averages means of the magnitude of the body acceleration.                           |
| Average-FrequencyDomainBodyAccelerometerMagnitude-StandardDeviation     | numeric | [-1, 1] | Averages standard deviations of the magnitude of the body acceleration.             |
| Average-FrequencyDomainBodyAccelerometerJerkMagnitude-Mean              | numeric | [-1, 1] | Averages means of the magnitude of the jerk, of the body acceleration.              |
| Average-FrequencyDomainBodyAccelerometerJerkMagnitude-StandardDeviation | numeric | [-1, 1] | Averages standard deviations of the magnitude of the jerk of the body acceleration. |
| Average-FrequencyDomainBodyGyroscopeMagnitude-Mean                      | numeric | [-1, 1] | Averages means of the magnitude of the angular velocity.                            |
| Average-FrequencyDomainBodyGyroscopeMagnitude-StandardDeviation         | numeric | [-1, 1] | Averages standard deviations for the magnitude of the angular velocity.             |
| Average-FrequencyDomainBodyGyroscopeJerkMagnitude-Mean                  | numeric | [-1, 1] | Averages means of the magnitude of jerk  of the angular velocity.                   |
| Average-FrequencyDomainBodyGyroscopeJerkMagnitude-StandardDeviation     | numeric | [-1, 1] | Averages standard deviations of the magnitude of the jerk of angular velocity.      |

