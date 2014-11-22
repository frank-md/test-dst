
This README explains how the script run_analysis.R works.

Data Source:
------------
The dataset which this script works on are the data collected 
from the accelerometers of the Samsung Galaxy S smartphone. 
A full description is available at the site:
[link](http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones)
Here are the data for the project:
[link](https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip) 

For this course project, the data file are download from the above website to a local 
directory of desktop computer. The file are unZiped, and both training and testdata files 
together with features and activity lables files are copied to an user's R work directory.  

Purpose:
-----------
 1) Merges the training and the test sets to create one data set.
 2) Extracts only the measurements on the mean and standard deviation for each measurement. 
 3) Uses descriptive activity names to name the activities in the data set
 4) Appropriately labels the data set with descriptive variable names. 
 5) From the data set in step 4, creates a second, independent tidy data set with the average of
    each variable for each activity and each subject.

Functions:
----------
1. Read files into data.tables and merget test and data tables to creat one dataset.
After read in the files, we have the activity_lables contains all activity lables and its numerical ids, 
the features contains ids and 561 variables, the subjec_tain/y_train and subject_test/y_test contains the ids of 
subject/activity for each of the observations recorded in the X_train and x_test file, 
which each of them contains 561 varibales.

For the convenient of future analysis, we would like to bind subject and actvity to the observation data tables
x_train and x-test. In this step, we first renamed the activity/subject columns to V526/V563, and then used
cbind() to bind them to x_train and x_test respectively. 
  
Now we can use rbind() function to combine train and test data together resulting a data table b_x contains
total 10299 observations of 563 varibles

2. Extracts only the measurements on the mean and standard deviation for each measurement.

Subset the feature table to extract only rows contains 'std', resulting 33 entries.
subset the feature table to extract only rows contains 'mean'; resulting 46 entries.
As "mean" entries more than "std" entries, some of the "mean" entries are not measurements
(a true measurement result should always have both mean and std). Examing the "mean" entries found meanFreq does not
has its corresponding std entries. Using -grep() to filter "meanFreq" out.
Use rbind() to combine the 'std" and "mean" subsets and sort the result b_std_mean using the ids. 

Create an id list from b_std_mean (the V1 column), add id 562 and 563 for activity and subject columns.
Use select() function from dply package on the b_x data table from step 1, to obtain the subset 
which contains only means and its stds for each subject and activities. The resulting data table b_x_s

3. Uses descriptive activity names (6 of them) to name the activities in the data set
Use select function to obtain the content from the activity column (V562) in the b_x_s.
Use gsub fucntion to replaces activity ids with activy lables in the selected activty data table.
Use mutate to replace contents of the existing avtivity column with the transformed activity table.

4. Appropriately labels the data set with descriptive variable names. 
Without konwing the domain of the measurement, I would like to keep the the original variable names as much as possible, 
unless the abbreavations are to short and characters are not friendly to R. By reading the features_info, I also realize 
the column names in the dataset are not consistently labeled ( %Mag-mean should really be -mean-Mag), the typos (fBodyBody 
should really be fBody). I will use "_" to replace "-" and use it as a separator for data set normalization of future analysis.

Replace "tBody" with "Time_Body"
Replace "tGravity" with "Time_Gravity"
Replace "fBody" with "Frequncy_Body"
Replace "fGravity" with "Frequncy_Gravity"
replace "Mag-mean" with "_mean_Mag"
replace "Mag-std" with "_std_Mag"
replace  "()" with ""
replace "-" with "_"


5. From the data set in step 4, creates a second, independent tidy data set 
with the average of each variable for each activity and each subject.

Using aggregate function to group and calculate the average for each 
measurement variable...and put it in a list .. loop through all 66 variables.
Join 66 data frames in the list by using join_all in the library(plyr)
make a tidy long data set by using melt of library(reshape) and rename value colume to averageValue
write out the dataset:
write.table(df_tidy_long, file = "df_tidy_long.csv",row.names=FALSE, na="", sep=",")

You may reading file using either of following R statements:
df<-read.csv("df_tidy_long.csv)
df<-read.table("df_tidy_long.csv",stringsAsFactors=FALSE,na="",sep=",")


Extra: "normalize" the long tidy data:
-------------------------------------
TO make the data set more searchable (like a database table), we can normalize df_tidy_long by using separate function 
from library(tidyr) to separate the mesaurementVariables column into Unit (Time or Frequncy), measurementType (BodyAcc..), result_type (mean or std), and measures (x,y,z,mag).

As the mean and std come from the same measurement, we can use spread() fucntion to put them into separate columns and 
renames the column to meanAverage and stdAverage.

write out the file:
write.table(df_tidy_norm, file = "df_tidy_norm.csv",row.names=FALSE, na="", sep=",") 
You may reading file using either of following R statements:
df<-read.csv("df_tidy_norm.csv)
df<-read.table("df_tidy_norm.csv",stringsAsFactors=FALSE,na="",sep=",")

