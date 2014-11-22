

 		Code Book for df_tidy_norm data set  
		-----------------------------------

 Dataset:
 -------- 

	5940 obs. of  7 variables, it is contains average means and average standard deviations for each measurement variable
	(listed below) for each activity of each subject. The dataset was transformed from the a long tidy dataset by separating 
	the mesaurementVariables column into Unit (Time or Frequency), measurementType (BodyAcc..),result_type (mean or std), and 	measures (x,y,z,mag). And spread average mean and average std as individual columns as they are come from the same 	measurement.
 
Columns:
--------
 
 ###subject
 
	Ids of people paticipated in the measurement, toatal 30 of them	            
	: int  1 2 3 4 5 6 7 8 9 10 ..30  

 ###activity
 
	activities the subject performed, total 6 of them
        : chr  WALKING, WALKING_UPSTAIRS,WALKING_DOWNSTAIRS,SITTING, STANDING ,LAYING

 ###unit
        : chr time,frequency, total 2 of them 
	Raw signals: unit is time 
        Fast Fourier Transform signals: unit is Frequency	
 
 ###measures 
       '-XYZ' is used to denote 3-axial signals in the X, Y and Z directions.
       'Mag' denotes magnitude of above three-dimensional signals.
       : chr  "Mag" "X" "Y" "Z" ... total 4 of them

 ###meanAverage
       the averaged mean for each variable for each activity of each subject, total 5940 obs.
       : num  -0.961 -0.924 -0.955 -0.874 -0.951 ...

 ###stdAverage
       the averaged standard deviation for each variable for each activity of each subject, total 5940 obs.
       : num  -0.882 -0.951 -0.908 -0.919 -0.917 ..

 ###measurementType 
       BodyAcc,GravityAcc... denote measurement type such as Body accelation and gravity accelation, the details can be found
       in the orginal dataset document features_info.txt.
       : chr  "BodyAcc",...total 66 of them, they are encoded in the variable list below before dataset tidy transformation.

Long tidy dataset measuremementVariables: 

 $ time_BodyAcc_mean_X
 $ time_BodyAcc_mean_Y
 $ time_BodyAcc_mean_Z
 $ time_BodyAcc_std_X
 $ time_BodyAcc_std_Y
 $ time_BodyAcc_std_Z
 $ time_GravityAcc_mean_X
 $ time_GravityAcc_mean_Y
 $ time_GravityAcc_mean_Z
 $ time_GravityAcc_std_X
 $ time_GravityAcc_std_Y
 $ time_GravityAcc_std_Z
 $ time_BodyAccJerk_mean_X
 $ time_BodyAccJerk_mean_Y
 $ time_BodyAccJerk_mean_Z
 $ time_BodyAccJerk_std_X
 $ time_BodyAccJerk_std_Y
 $ time_BodyAccJerk_std_Z
 $ time_BodyGyro_mean_X
 $ time_BodyGyro_mean_Y
 $ time_BodyGyro_mean_Z
 $ time_BodyGyro_std_X
 $ time_BodyGyro_std_Y
 $ time_BodyGyro_std_Z
 $ time_BodyGyroJerk_mean_X
 $ time_BodyGyroJerk_mean_Y
 $ time_BodyGyroJerk_mean_Z
 $ time_BodyGyroJerk_std_X
 $ time_BodyGyroJerk_std_Y
 $ time_BodyGyroJerk_std_Z
 $ time_BodyAcc_mean_Mag
 $ time_BodyAcc_std_Mag
 $ time_GravityAcc_mean_Mag
 $ time_GravityAcc_std_Mag
 $ time_BodyAccJerk_mean_Mag
 $ time_BodyAccJerk_std_Mag
 $ time_BodyGyro_mean_Mag 
 $ time_BodyGyro_std_Mag
 $ time_BodyGyroJerk_mean_Mag
 $ time_BodyGyroJerk_std_Mag
 $ frequency_BodyAcc_mean_X
 $ frequency_BodyAcc_mean_Y
 $ frequency_BodyAcc_mean_Z
 $ frequency_BodyAcc_std_X
 $ frequency_BodyAcc_std_Y
 $ frequency_BodyAcc_std_Z
 $ frequency_BodyAccJerk_mean_X
 $ frequency_BodyAccJerk_mean_Y
 $ frequency_BodyAccJerk_mean_Z
 $ frequency_BodyAccJerk_std_X
 $ frequency_BodyAccJerk_std_Y
 $ frequency_BodyAccJerk_std_Z
 $ frequency_BodyGyro_mean_X
 $ frequency_BodyGyro_mean_Y
 $ frequency_BodyGyro_mean_Z
 $ frequency_BodyGyro_std_X
 $ frequency_BodyGyro_std_Y
 $ frequency_BodyGyro_std_Z
 $ frequency_BodyAcc_mean_Mag
 $ frequency_BodyAcc_std_Mag
 $ frequency_BodyAccJerk_mean_Mag
 $ frequency_BodyAccJerk_std_Mag
 $ frequency_BodyGyro_mean_Mag
 $ frequency_BodyGyro_std_Mag
 $ frequency_BodyGyroJerk_mean_Mag
 $ frequency_BodyGyroJerk_std_Mag

The above measurement varibales are transformed via following steps: 

Replace "tBody" with "Time_Body"
Replace "tGravity" with "Time_Gravity"
Replace "fBody" with "Frequncy_Body"
Replace "fGravity" with "Frequncy_Gravity"
replace "Mag-mean" with "_mean_Mag"
replace "Mag-std" with "_std_Mag"
replace  "()" with ""
replace "-" with "_"


from orginal measurement variables (column 3 of list below):

1    1           tBodyAcc-mean()-X
2    2           tBodyAcc-mean()-Y
3    3           tBodyAcc-mean()-Z
4    4            tBodyAcc-std()-X
5    5            tBodyAcc-std()-Y
6    6            tBodyAcc-std()-Z
7   41        tGravityAcc-mean()-X
8   42        tGravityAcc-mean()-Y
9   43        tGravityAcc-mean()-Z
10  44         tGravityAcc-std()-X
11  45         tGravityAcc-std()-Y
12  46         tGravityAcc-std()-Z
13  81       tBodyAccJerk-mean()-X
14  82       tBodyAccJerk-mean()-Y
15  83       tBodyAccJerk-mean()-Z
16  84        tBodyAccJerk-std()-X
17  85        tBodyAccJerk-std()-Y
18  86        tBodyAccJerk-std()-Z
19 121          tBodyGyro-mean()-X
20 122          tBodyGyro-mean()-Y
21 123          tBodyGyro-mean()-Z
22 124           tBodyGyro-std()-X
23 125           tBodyGyro-std()-Y
24 126           tBodyGyro-std()-Z
25 161      tBodyGyroJerk-mean()-X
26 162      tBodyGyroJerk-mean()-Y
27 163      tBodyGyroJerk-mean()-Z
28 164       tBodyGyroJerk-std()-X
29 165       tBodyGyroJerk-std()-Y
30 166       tBodyGyroJerk-std()-Z
31 201          tBodyAccMag-mean()
32 202           tBodyAccMag-std()
33 214       tGravityAccMag-mean()
34 215        tGravityAccMag-std()
35 227      tBodyAccJerkMag-mean()
36 228       tBodyAccJerkMag-std()
37 240         tBodyGyroMag-mean()
38 241          tBodyGyroMag-std()
39 253     tBodyGyroJerkMag-mean()
40 254      tBodyGyroJerkMag-std()
41 266           fBodyAcc-mean()-X
42 267           fBodyAcc-mean()-Y
43 268           fBodyAcc-mean()-Z
44 269            fBodyAcc-std()-X
45 270            fBodyAcc-std()-Y
46 271            fBodyAcc-std()-Z
47 345       fBodyAccJerk-mean()-X
48 346       fBodyAccJerk-mean()-Y
49 347       fBodyAccJerk-mean()-Z
50 348        fBodyAccJerk-std()-X
51 349        fBodyAccJerk-std()-Y
52 350        fBodyAccJerk-std()-Z
53 424          fBodyGyro-mean()-X
54 425          fBodyGyro-mean()-Y
55 426          fBodyGyro-mean()-Z
56 427           fBodyGyro-std()-X
57 428           fBodyGyro-std()-Y
58 429           fBodyGyro-std()-Z
59 503          fBodyAccMag-mean()
60 504           fBodyAccMag-std()
61 516  fBodyBodyAccJerkMag-mean()
62 517   fBodyBodyAccJerkMag-std()
63 529     fBodyBodyGyroMag-mean()
64 530      fBodyBodyGyroMag-std()
65 542 fBodyBodyGyroJerkMag-mean()
66 543  fBodyBodyGyroJerkMag-std()
