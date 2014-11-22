

Code Book for df_tidy_norm data set 

Dataset:
======== 

5940 obs. of  7 variables, it is contains average means and average standard deviations for each measurement 	variable (listed below) for each activity of each subject. The dataset was transformed from the a long tidy dataset by separating the mesaurementVariables column into Unit (Time or Frequency), measurementType (BodyAcc..),result_type (mean or std), and measures (x,y,z,mag). And spread average mean and average std as individual columns as they are come from the same measurement.
 
Columns:
--------
 
 * subject
 
	- Ids of people paticipated in the measurement, toatal 30 of them	            
	- : int  1 2 3 4 5 6 7 8 9 10 ..30  

 * activity
 
	- activities the subject performed, total 6 of them
        - : chr  WALKING, WALKING_UPSTAIRS,WALKING_DOWNSTAIRS,SITTING, STANDING ,LAYING

 * unit
        - : chr time,frequency, total 2 of them 
	- Raw signals: unit is time 
        - Fast Fourier Transform signals: unit is Frequency	
 
 * measures 
       - '-XYZ' is used to denote 3-axial signals in the X, Y and Z directions.
       - 'Mag' denotes magnitude of above three-dimensional signals.
       - : chr  "Mag" "X" "Y" "Z" ... total 4 of them

 * meanAverage
       - the averaged mean for each variable for each activity of each subject, total 5940 obs.
       - : num  -0.961 -0.924 -0.955 -0.874 -0.951 ...

 * stdAverage
      - the averaged standard deviation for each variable for each activity of each subject, total 5940 obs.
      - : num  -0.882 -0.951 -0.908 -0.919 -0.917 ..

 * measurementType 
      - BodyAcc,GravityAcc... denote measurement type such as Body accelation and gravity accelation, the details ca		 be found in the orginal dataset document features_info.txt.
      - : chr  "BodyAcc",...total 66 of them, they are encoded in the variable list below before dataset tidy transformation.

+ Long tidy dataset measuremementVariables: 

 + time_BodyAcc_mean_X
 + time_BodyAcc_mean_Y
 + time_BodyAcc_mean_Z
 + time_BodyAcc_std_X
 + time_BodyAcc_std_Y
 + time_BodyAcc_std_Z
 + time_GravityAcc_mean_X
 + time_GravityAcc_mean_Y
 + time_GravityAcc_mean_Z
 + time_GravityAcc_std_X
 + time_GravityAcc_std_Y
 + time_GravityAcc_std_Z
 + time_BodyAccJerk_mean_X
 + time_BodyAccJerk_mean_Y
 + time_BodyAccJerk_mean_Z
 + time_BodyAccJerk_std_X
 + time_BodyAccJerk_std_Y
 + time_BodyAccJerk_std_Z
 + time_BodyGyro_mean_X
 + time_BodyGyro_mean_Y
 + time_BodyGyro_mean_Z
 + time_BodyGyro_std_X
 + time_BodyGyro_std_Y
 + time_BodyGyro_std_Z
 + time_BodyGyroJerk_mean_X
 + time_BodyGyroJerk_mean_Y
 + time_BodyGyroJerk_mean_Z
 + time_BodyGyroJerk_std_X
 + time_BodyGyroJerk_std_Y
 + time_BodyGyroJerk_std_Z
 + time_BodyAcc_mean_Mag
 + time_BodyAcc_std_Mag
 + time_GravityAcc_mean_Mag
 + time_GravityAcc_std_Mag
 + time_BodyAccJerk_mean_Mag
 + time_BodyAccJerk_std_Mag
 + time_BodyGyro_mean_Mag 
 + time_BodyGyro_std_Mag
 + time_BodyGyroJerk_mean_Mag
 + time_BodyGyroJerk_std_Mag
 + frequency_BodyAcc_mean_X
 + frequency_BodyAcc_mean_Y
 + frequency_BodyAcc_mean_Z
 + frequency_BodyAcc_std_X
 + frequency_BodyAcc_std_Y
 + frequency_BodyAcc_std_Z
 + frequency_BodyAccJerk_mean_X
 + frequency_BodyAccJerk_mean_Y
 + frequency_BodyAccJerk_mean_Z
 + frequency_BodyAccJerk_std_X
 + frequency_BodyAccJerk_std_Y
 + frequency_BodyAccJerk_std_Z
 + frequency_BodyGyro_mean_X
 + frequency_BodyGyro_mean_Y
 + frequency_BodyGyro_mean_Z
 + frequency_BodyGyro_std_X
 + frequency_BodyGyro_std_Y
 + frequency_BodyGyro_std_Z
 + frequency_BodyAcc_mean_Mag
 + frequency_BodyAcc_std_Mag
 + frequency_BodyAccJerk_mean_Mag
 + frequency_BodyAccJerk_std_Mag
 + frequency_BodyGyro_mean_Mag
 + frequency_BodyGyro_std_Mag
 + frequency_BodyGyroJerk_mean_Mag
 + frequency_BodyGyroJerk_std_Mag

The above measurement varibales are transformed via following steps: 

- Replace "tBody" with "Time_Body"
- Replace "tGravity" with "Time_Gravity"
- Replace "fBody" with "Frequncy_Body"
- Replace "fGravity" with "Frequncy_Gravity"
- replace "Mag-mean" with "_mean_Mag"
- replace "Mag-std" with "_std_Mag"
- replace  "()" with ""
- replace "-" with "_"


from orginal measurement variables (column 3 of list below):

- tBodyAcc-mean()-X
- tBodyAcc-mean()-Y
- tBodyAcc-mean()-Z
- tBodyAcc-std()-X
- tBodyAcc-std()-Y
- tBodyAcc-std()-Z
- tGravityAcc-mean()-X
- tGravityAcc-mean()-Y
- tGravityAcc-mean()-Z
- tGravityAcc-std()-X
- tGravityAcc-std()-Y
- tGravityAcc-std()-Z
- tBodyAccJerk-mean()-X
- tBodyAccJerk-mean()-Y
- tBodyAccJerk-mean()-Z
- tBodyAccJerk-std()-X
- tBodyAccJerk-std()-Y
- tBodyAccJerk-std()-Z
- tBodyGyro-mean()-X
- tBodyGyro-mean()-Y
- tBodyGyro-mean()-Z
- tBodyGyro-std()-X
- tBodyGyro-std()-Y
- tBodyGyro-std()-Z
- tBodyGyroJerk-mean()-X
- tBodyGyroJerk-mean()-Y
- tBodyGyroJerk-mean()-Z
- tBodyGyroJerk-std()-X
- tBodyGyroJerk-std()-Y
- tBodyGyroJerk-std()-Z
- tBodyAccMag-mean()
- tBodyAccMag-std()
- tGravityAccMag-mean()
- tGravityAccMag-std()
- tBodyAccJerkMag-mean()
- tBodyAccJerkMag-std()
- tBodyGyroMag-mean()
- tBodyGyroMag-std()
- tBodyGyroJerkMag-mean()
- tBodyGyroJerkMag-std()
- fBodyAcc-mean()-X
- fBodyAcc-mean()-Y
- fBodyAcc-mean()-Z
- fBodyAcc-std()-X
- fBodyAcc-std()-Y
- fBodyAcc-std()-Z
- fBodyAccJerk-mean()-X
- fBodyAccJerk-mean()-Y
- fBodyAccJerk-mean()-Z
- fBodyAccJerk-std()-X
- fBodyAccJerk-std()-Y
- fBodyAccJerk-std()-Z
- fBodyGyro-mean()-X
- fBodyGyro-mean()-Y
- fBodyGyro-mean()-Z
- fBodyGyro-std()-X
- fBodyGyro-std()-Y
- fBodyGyro-std()-Z
- fBodyAccMag-mean()
- fBodyAccMag-std()
- fBodyBodyAccJerkMag-mean()
- fBodyBodyAccJerkMag-std()
- fBodyBodyGyroMag-mean()
- fBodyBodyGyroMag-std()
- fBodyBodyGyroJerkMag-mean()
- fBodyBodyGyroJerkMag-std()
