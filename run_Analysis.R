### Run Analysis on big data
library(plyr) #load the select,filter mutate summarize library
library(tidyr) # load the gather separate spread extract library
library(dplyr) # 
library(utils) # unzip read.table
# the data source
source_url<-"https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
workdir<-"foton263tidy" # project's directory
zipdestination<-"foton263tidy/har_dataset.zip" # destination path and download name
if (!file.exists(workdir)) {dir.create(workdir)} # create work directory safely
if (!file.exists(zipdestination)) 
   {download.file(url = source_url,destfile = zipdestination) #download the dataset
    unzip(zipfile = zipdestination,exdir = workdir) # extract the files
   } 
message("the directory of the project is :", paste(getwd(),"/",workdir,sep=""))
message("dont forget to delete it after you evaluate my code")
subpath<-paste(workdir,"/UCI HAR Dataset/",sep = "") # this is the dataset sub directory
trainpath<-paste(subpath,"train/",sep="") # training set subdirectory
testpath<-paste(subpath,"test/",sep="") # test set subdirectory
# load the primary data 
subjtrain<- read.table(paste(trainpath,"subject_train.txt",sep="")) # subjects id vector
xtrain <- read.table(paste(trainpath,"X_train.txt",sep="")) # train set measurements df
ytrain <- read.table(paste(trainpath,"y_train.txt",sep="")) # human activity type vector
subjtest<- read.table(paste(testpath,"subject_test.txt",sep="")) # subjects id vector
xtest <- read.table(paste(testpath,"X_test.txt",sep="")) # test set measurements df
ytest <- read.table(paste(testpath,"y_test.txt",sep="")) # human activity type vector
columnames <- read.table(paste(subpath,"features.txt",sep=""),stringsAsFactors = FALSE) # the column names
############################################################################
#START TASK 1. Merge the training and the test sets to create one data set.#
###########################################################################
subjlist<-list(subjtrain,subjtest) 
xlist<-list(xtrain,xtest)
ylist<-list(ytrain,ytest)
  # merge with a fast plyr row binding method filling any gap with NA (for checking)
mergedsubj<-rbind.fill(subjlist)
mergedx<-rbind.fill(xlist)
mergedy<-rbind.fill(ylist)
## remove uselees vars from memory and make space
rm(ytest,ytrain,xtest,xtrain,subjtest,subjtrain)
##### END OF TASK 1 ######################################

#############################################################
# TASK 2. Extract mean and std columns from the merged data #
#############################################################
## process the columns names dataframe
# first spot any douplicate column name 
columnames$doubles<-duplicated(columnames[2])
# second  give labels to columns names dataframe
colnames(columnames)<-c("cnr","cname","double")
# third  create unique column names combining "cname" with "cnr" 
# only for duplicate names using a bit of dplyr pipeline grammar sweetness...
columnames <- columnames %>% mutate(cname = ifelse(doubles== TRUE,paste(cname,cnr,sep="_"),cname))
# assign the unique columnnames to the merged x data frame
names(mergedx)<-columnames$cname
# pick the columns you need easily with dplyr::select 
meandf<-select(.data =mergedx,contains("mean()",ignore.case = TRUE) )
stddf<-select(.data =mergedx,contains("std()",ignore.case = TRUE) )
# last thing we name the subjects column
names(mergedsubj)<-"Subjects_ID"
##### END OF TASK 2 ######################################

#################################################################################
### TASK 3 Use descriptive activity names to name the activities in the data set#
################################################################################
# reading activity labels 
activitylabels <- read.table(paste(subpath,"activity_labels.txt",sep=""),stringsAsFactors = FALSE)
# baptize the activity types columns
names(activitylabels)<-c("act_nr","act_label")
# baptize the merged activity vector
names(mergedy)<-"subject_activity"
#add a verbose column in mergedy dataframe with dplyr grammar
mergedy <- mergedy %>% mutate(activity_type=activitylabels$act_label[subject_activity])
# we construct the  dataframe who contains subjects, measurements and activities
combodf<-cbind(mergedsubj,mergedy,meandf,stddf)
##### END OF TASK 3 and inherently TASK 4 (naming the columns) ######################################

#####################################################################
### TASK 5. Group-average the measurements per activity and subject #
#####################################################################
# from combodf to tidydf via plyr after 3 hours of playing around with .fun finally see who does that locomotion!
tidedf<- ddply(combodf,.(activity_type,Subjects_ID),.fun = function(x) colMeans(x[,2:67]))
########## END OF TASK 5 ##########################################################################

# TASK 6 we prepare for upload ################
write.table(tidedf, paste(workdir,"/","tidy_dataset.txt",sep=""),sep = "  ", row.names=FALSE)
