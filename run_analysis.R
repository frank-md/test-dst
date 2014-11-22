# The datafile "getdata_projectfiles_UCI HAR Dataset.zip"
# has been downloaded to user local directory and unziped
# The related training dataset files and test datasets files 
# are copied to the R work directory.

#reading label files
activity_lables <- read.table("activity_labels.txt") # 6 activities
features <- read.table("features.txt")               # 561 variables
#
# reading test data files
subject_test <- read.table("subject_test.txt") # 2947 obs. total 9 unique subject 
x_test <- read.table("x_test.txt")  #2947 obs, 561 variables
y_test <- read.table("y_test.txt") # 2947 obs, 6 unique activities 

# reading training data files
subject_train <- read.table("subject_train.txt") # 7352 obs, 21 unique subject
x_train <- read.table("x_train.txt") # 7352 obs, 561 variables
y_train <- read.table("y_train.txt") # 7352 obs, 6 unique activities

# add labels for subject and activity table columns.
names(y_test)[1] <- paste("V562") # activity column
names(y_train)[1] <- paste("V562")
names(subject_test)[1] <- paste("V563") # subject column
names(subject_train)[1] <-paste("V563")

# add activity and subject columns to the X data tables
# this is needed for future data analysis

b_x_test <- cbind(x_test,y_test,subject_test)
b_x_train <- cbind(x_train,y_train,subject_train)

# Task 1-- merge test and train data tables to create on dataset
b_x <- rbind(b_x_test,b_x_train) #10299 obs. of  563 variables:
#
# Task 2 -- Extracts only the measurements on the mean and standard deviation
# for each measurement.
# 
std_v <-features[grep("std",features$V2),] # std labels (33 total)
mean_v <- features[grep("mean()",features$V2),] #  mean labels (46 total)
# get rid of meanFreq columns (13 total) as it does not have stds associated with
mean_v <- mean_v[-grep("meanFreq",mean_v$V2),] 
b_std_mean <- rbind(mean_v, std_v) # merge two tables ( 66 total)
b_std_mean <- arrange(b_std_mean, V1) # sort table using the id column 
library(dplyr) # load dplyr package
list_v1 <- select(b_std_mean,V1) # put id column into a list.
list_a <- simplify2array(list_v1) # simpliyfy the data frame into a one-dim array
list_a[67] <-562 # add activiy column
list_a[68] <-563 # add subject column
# now we get a list of column numbers in list_a which corresponding to 
# the mean and std columns in the b_x table
# use dplyr select function to obtain the subset which contains only means and its stds 
# columns for each subject and activities plus activity and subject columns
 b_x_s <- select(b_x,num_range("V",list_a[1:68])) # 10299 obs with 68 variables

# Task 3 Uses descriptive activity names (6 of them) to name 
# the activities in the data set
# 
ac_tbl <- select(b_x_s, V562) # obtain the activity vector
ac_v <- gsub("1", activity_lables[,2][1], ac_tbl[,c("V562")])
ac_v <- gsub("2", activity_lables[,2][2], ac_v)
ac_v <- gsub("3", activity_lables[,2][3], ac_v)
ac_v <- gsub("4", activity_lables[,2][4], ac_v)
ac_v <- gsub("5", activity_lables[,2][5], ac_v)
ac_v <- gsub("6", activity_lables[,2][6], ac_v)
b_x_s <- mutate(b_x_s, V562=ac_v) # replace the V562 colume with the transformed activity columns.

# Task 4 Appropriately labels the data set with descriptive variable names.
# Without knowning the domain of the measurement, I would like to keep the the 
# original variable names as much as possible, unless the abbreviations are to short 
#and characters are not friendly to R. By reading the features_info, I also realize 
#the column names in the dataset are not consistently labeled 
#(*Mag-mean should really be -mean-Mag), the typos (fBodyBody) 
#should really be fBody). I will use "_" to replace "-" and use it as a separator 
#for tidy dataset transformations.
                                                                                                                 should really be fBody). I will use "_" to replace "-" and use it as a separator for data set normalization of future analysis.
col_names <- b_std_mean[,c("V2")] # the second volume contains 66 names
col_names <- gsub("\\(\\)","",col_names) # remove () from names
col_names <- gsub("\\-","_",col_names) # replace - with _
col_names <- gsub("fBodyBody","fBody",col_names) # fix the typo
col_names <- gsub("fBody","frequency_Body",col_names) # expand f to frequency
col_names <- gsub("tBody","time_Body",col_names) # expand t to time
col_names <- gsub("tGravity","time_Gravity",col_names) # expand t to time
col_names <- gsub("Mag_mean","_mean_Mag",col_names) # mag is the same type as X,Y,Z
col_names <- gsub("Mag_std","_std_Mag",col_names)  # 
colnames(b_x_s) <- col_names # apply corrected column names
names(b_x_s)[67] <- paste("activity") # Add activity lable 
names(b_x_s)[68] <- paste("subject")  # Add subject lable
#
# Task 5 From the data set in step 4, creates a second, independent tidy data set 
# with the average of each variable for each activity and each subject.
#
# using aggregate function to group and calculate the average for each 
# measurement variable...and put it in a list .. loop through all 66 variables. 
df_list <- list()
for(i in 1:66){
   df_a<-aggregate(b_x_s[,i]~subject+activity,data=b_x_s,mean) # 180 obs.
   names(df_a)[3]<-paste(col_names[i])
   df_list[[i]] <- df_a
 }
# join 66 data frames in the list by using join_all in the library(plyr)
library(plyr)
df_joined<-join_all(df_list) # joining by subject and activity.
#make a tidy long data set by using melt..
library(reshape)
df_tidy_long <- melt(df_joined,id=c("subject","activity")) #11880 obs, 4 variables
# name the colume properly
names(df_tidy_long)[4]<-paste("averageValue")
names(df_tidy_long)[3]<-paste("measurementVariable")
# write out the tidy_long dataset into a file as an intermediate result.
# write.table(df_tidy_long, file = "df_tidy_long.csv",row.names=FALSE, na="", sep=",")
# Now we get a long tidy data set, but the measurementVariable is still encoded some variables..
# To make the data set more searchable like a database table, we can separate measurementVariable
# into Unit (Time or Frequency), measurementType such as BodyAcc, result_type (mean or std), and measures( x,y,z,mag)
library(tidyr)
df_t<-separate(data=df_tidy_long,col=measurementVariable,into=c("unit","measurementType","result_type","measures"))
#
# spread mean and std as they actually come from one measurement,and they should not be separated
# as a convention of scientific result representation.
df_tidy_norm<-spread(df_t,result_type,averageValue)  #5940 obs and 7 variables
names(df_tidy_norm)[6]<-paste("meanAverage") # the mean is actually an averaged mean
names(df_tidy_norm)[7]<-paste("stdAverage") # the std is actually an averaged std
#write out the file
write.table(df_tidy_norm, file = "df_tidy_norm.csv",row.names=FALSE, na="", sep=",")
