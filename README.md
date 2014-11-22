
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
directory of desktop computer. The file are unzipped, and both training and test data files
together with features and activity labels files are copied to an user's R work directory.  

Purpose:
--------
 + 1) Merges the training and the test sets to create one data set. 
 + 2) Extracts only the measurements on the mean and standard deviation for each measurement.
 + 3) Uses descriptive activity names to name the activities in the data set
 + 4) Appropriately labels the data set with descriptive variable names.
 + 5) From the data set in step 4, creates a second, independent tidy data set with the average of
    each variable for each activity and each subject.

Functions:
----------
* 1) Read files into data.tables and merge test and data tables to create one dataset.
After read in the files, we have the activity_labels contains all activity labels and its numerical ids,
the features contains ids and 561 variables, the subject_train/y_train and subject_test/y_test contains the ids of
subject/activity for each of the observations recorded in the x_train and x_test file,
which each of them contains 561 variables.

For the convenient of future analysis, we would like to bind subject and activity to the observation data tables
x_train and x_test. In this step, we first renamed the activity/subject columns to V526/V563, and then used
cbind() to bind them to x_train and x_test respectively.
 
Now we can use rbind() function to combine train and test data together resulting a data table b_x contains
total 10299 observations of 563 variables.

* 2) Extracts only the measurements on the mean and standard deviation for each measurement.

Subset the feature table to extract only rows contains 'std', resulting 33 entries.
Subset the feature table to extract only rows contains 'mean'; resulting 46 entries.
As "mean" entries more than "std" entries, some of the "mean" entries are not measurements...

A true measurement result should always have both mean and std.

 Examining the "mean" entries found meanFreq does not has its corresponding std entries.

Using -grep() to filter out "meanFreq" .
Use rbind() to combine the 'std" and "mean" subsets and sort the result b_std_mean using the ids.

Create an id list from b_std_mean (the V1 column), add id 562 and 563 for activity and subject columns.
Use select() function from dply package on the b_x data table obtained from step 1 to get the subset of columns
which contains only means and its stds for each subject and activities plus activity and subject columns.
The resulting subset table is data table b_x_s.

* 3) Uses descriptive activity names (6 of them) to name the activities in the data set
Use select function to obtain a subset for activity from the activity column (V562) in the b_x_s.
Use gsub function to replaces activity ids in the subset with activity labels.
Use mutate function to replace contents of the existing activity column with the transformed activity table.

* 4) Appropriately labels the data set with descriptive variable names.
Without knowing the domain of the measurement, I would like to keep the the original variable names as much as possible,
unless the abbreviations are to short and characters are not friendly to R such as "()" and "-". By reading the features_info, I also realize
the column names in the dataset are not consistently labeled ( %Mag-mean should really be -mean-Mag), the typos (fBodyBody
should really be fBody). I will use "_" to replace "-" and use it as a separator for tidy dataset transformations.

- Replace "tBody" with "Time_Body"
- Replace "tGravity" with "Time_Gravity"
- Replace "fBody" with "Frequency_Body"
- Replace "fGravity" with "Frequency_Gravity"
- replace "Mag-mean" with "_mean_Mag"
- replace "Mag-std" with "_std_Mag"
- replace  "()" with ""
- replace "-" with "_"


* 5) From the data set in step 4, creates a second, independent tidy data set
with the average of each variable for each activity and each subject.

- Using aggregate function to group and calculate the average for each
- measurement variable...and put it in a list .. loop through all 66 variables.
- Join 66 data frames in the list by using join_all in the library(plyr)
- make a tidy long data set by using melt of library(reshape) and rename value column to averageValue
- write out the dataset as an intermediate result.
- write.table(df_tidy_long, file = "df_tidy_long.csv",row.names=FALSE, na="", sep=",")
- Now we get a long tidy data set, but the measurementVariable is still encoded some variables...
To make the data set more searchable (like a database table), we can normalize df_tidy_long by using separate function
from library(tidyr) to separate the mesaurementVariables column into Unit (Time or Frequency), measurementType (BodyAcc..), result_type (mean or std), and measures (x,y,z,mag).

As the mean and std come from the same measurement, and they should not be separated
as a convention of scientific result representation.They should be in one row...
we can use spread() function to put them into separate columns and
rename the columns to meanAverage and stdAverage.

write out the file:
write.table(df_tidy_norm, file = "df_tidy_norm.csv",row.names=FALSE, na="", sep=",")
You may reading file using either of following R statements:
df<-read.csv("df_tidy_norm.csv)


