# run_Analysis.R Code Book

### Program Scope 
The run_Analysis program tides up a large dataset of experimental data that record the gyroscopic and accelerometric sensors readings of a Samsung Galaxy mobile phone among with human activity type 
and finally constructs and saves a new tidy dataset which averages a subset of columns by human activity and subject. The results are
recorded in tidy_dataset.txt file

### The dataset 
According to the researchers remarks, the experiments have been carried out with a group of 30 volunteers 
within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, we captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. The experiments have been video-recorded to label the data manually. The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data. 
The sensor signals (accelerometer and gyroscope) were pre-processed by applying noise filters and then sampled in fixed-width sliding windows of 2.56 sec and 50% overlap (128 readings/window). The sensor acceleration signal, which has gravitational and body motion components, was separated using a Butterworth low-pass filter into body acceleration and gravity. The gravitational force is assumed to have only low frequency components, therefore a filter with 0.3 Hz cutoff frequency was used. From each window, a vector of features was obtained by calculating variables from the time and frequency domain. See 'features_info.txt' for more details. 
#### For each record it is provided:
- Triaxial acceleration from the accelerometer (total acceleration) and the estimated body acceleration.
- Triaxial Angular velocity from the gyroscope. 
- A 561-feature vector with time and frequency domain variables. 
- Its activity label. 
- An identifier of the subject who carried out the experiment.
The dataset includes the following files:
=========================================

#### The files containing the original dataset are :
- 'features_info.txt': Shows information about the variables used on the feature vector.
- 'features.txt': List of all features.
- 'activity_labels.txt': Links the class labels with their activity name.
- 'train/X_train.txt': Training set.
- 'train/y_train.txt': Training labels.
- 'test/X_test.txt': Test set.

- 'test/y_test.txt': Test labels.
The following files are available for the train and test data. Their descriptions are equivalent. 
- 'train/subject_train.txt': Each row identifies the subject who performed the activity for each window sample. Its range is from 1 to 30. 
- 'train/Inertial Signals/total_acc_x_train.txt': The acceleration signal from the smartphone accelerometer X axis in standard gravity units 'g'. Every row shows a 128 element vector. The same description applies for the 'total_acc_x_train.txt' and 'total_acc_z_train.txt' files for the Y and Z axis. 
- 'train/Inertial Signals/body_acc_x_train.txt': The body acceleration signal obtained by subtracting the gravity from the total acceleration. 
- 'train/Inertial Signals/body_gyro_x_train.txt': The angular velocity vector measured by the gyroscope for each window sample. The units are radians/second. 

#### Notes: 
- Features are normalized and bounded within [-1,1].
- Each feature vector is a row on the text file.

The dataset is available in https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip 

## The requested Processing and clean-up of the original dataset
The processing requested on original dataset was :
 You should create one R script called run_analysis.R that does the following. 

    Merges the training and the test sets to create one data set.
    Extracts only the measurements on the mean and standard deviation for each measurement. 
    Uses descriptive activity names to name the activities in the data set
    Appropriately labels the data set with descriptive variable names. 
    From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.


## How to run run_Analysis.R
- download this run_Analysis.R script
- run line by line
- the program will install the essential packages if they are not present in your system
- then it will create a working subdirectory named foton263tidy/ within your working directory in your disk 
(you can locate this by using getwd() afterwards...)
- it will download the original dataset zip file and will unzip it
- it will process and gather the dataset into a dataframe named combodf discarding the intermediate dfs from memory
- it will then calculate the new dataset named tidedf and will write it to the foton263tidy/tidy_dataset.txt file
 
#####  thank you for taking time to evaluate my work and may the R be with you...


