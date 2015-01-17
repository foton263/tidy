# tidy
### My Getting and Cleaning Data Course Project folder that contains the files requested to be available here.

The file run_Analysis.R submitted in this folder does the following required by the course project exercise :
First, it loads the libraries plyr, dplyr that are in focus in this course and the library utils
If you don't already have these packages you must install them before running the script. 
Second, the script prepares all necessary directories and downloads and unzips the primary dataset
(Please note that during the script run the directory foton263tidy will be created. After you evaluate my effort
you can delete it).
Then It reads also the column names from features.txt. The problem is that some column names are duplicates so 
this is rectified before we can assign them to the data frame we built. Why we need unique column names? It's because we want to use the select () verb to choose the columns we are interested by their name with the contains () inner function, at a later stage. Following, the train and test data frames are merged into one row-wise, we columnbind subjects and activities dataframe and we come up with a big dataframe named :
####combodf, 
to which we assign the unique columns names, using what we learned about dpyr we select the columns in interest
finally, we use this dataframe to produce the tidy dataset named :
####tidedf
comprising of mean values of locomotion charactristics of each subject grouped by activity per subject. The ddply function did the miracle... 
##### May the R be with you!
