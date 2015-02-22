# Codebook for Getting and Cleaning - Course Project

## Dictionary of tidydata.txt

By columns:

1: subject

Anonymized identifyer of the test object

Integer, Range: 1..30

2: activity

Classification of the activity for each sample

Factor, Range: 6 levels "LAYING", "SITTING", "STANDING", "WALKING", "WALKING_DOWNSTAIRS", "WALKING_UPSTAIRS"

3-88: Measurement variables

Mean value per subject and activity for measurement entities with names including mean, std or Mean 

Numeric, Range:[-1, 1]

    [ 3] tBodyAcc_mean_X                     
    [ 4] tBodyAcc_mean_Y                     
    [ 5] tBodyAcc_mean_Z                      
    [ 6] tGravityAcc_mean_X                  
    [ 7] tGravityAcc_mean_Y                   
    [ 8] tGravityAcc_mean_Z                  
    [ 9] tBodyAccJerk_mean_X                  
    [10] tBodyAccJerk_mean_Y                 
    [11] tBodyAccJerk_mean_Z                  
    [12] tBodyGyro_mean_X                    
    [13] tBodyGyro_mean_Y                     
    [14] tBodyGyro_mean_Z                    
    [15] tBodyGyroJerk_mean_X                 
    [16] tBodyGyroJerk_mean_Y                
    [17] tBodyGyroJerk_mean_Z                 
    [18] tBodyAccMag_mean                    
    [19] tGravityAccMag_mean                  
    [20] tBodyAccJerkMag_mean                
    [21] tBodyGyroMag_mean                    
    [22] tBodyGyroJerkMag_mean               
    [23] fBodyAcc_mean_X                      
    [24] fBodyAcc_mean_Y                     
    [25] fBodyAcc_mean_Z                      
    [26] fBodyAcc_meanFreq_X                 
    [27] fBodyAcc_meanFreq_Y                  
    [28] fBodyAcc_meanFreq_Z                 
    [29] fBodyAccJerk_mean_X                  
    [30] fBodyAccJerk_mean_Y                 
    [31] fBodyAccJerk_mean_Z                  
    [32] fBodyAccJerk_meanFreq_X             
    [33] fBodyAccJerk_meanFreq_Y              
    [34] fBodyAccJerk_meanFreq_Z             
    [35] fBodyGyro_mean_X                     
    [36] fBodyGyro_mean_Y                    
    [37] fBodyGyro_mean_Z                     
    [38] fBodyGyro_meanFreq_X                
    [39] fBodyGyro_meanFreq_Y                 
    [40] fBodyGyro_meanFreq_Z                
    [41] fBodyAccMag_mean                     
    [42] fBodyAccMag_meanFreq                
    [43] fBodyAccJerkMag_mean                 
    [44] fBodyAccJerkMag_meanFreq            
    [45] fBodyGyroMag_mean                    
    [46] fBodyGyroMag_meanFreq               
    [47] fBodyGyroJerkMag_mean                
    [48] fBodyGyroJerkMag_meanFreq           
    [49] tBodyAcc_std_X                       
    [50] tBodyAcc_std_Y                      
    [51] tBodyAcc_std_Z                       
    [52] tGravityAcc_std_X                   
    [53] tGravityAcc_std_Y                    
    [54] tGravityAcc_std_Z                   
    [55] tBodyAccJerk_std_X                   
    [56] tBodyAccJerk_std_Y                  
    [57] tBodyAccJerk_std_Z                   
    [58] tBodyGyro_std_X                     
    [59] tBodyGyro_std_Y                      
    [60] tBodyGyro_std_Z                     
    [61] tBodyGyroJerk_std_X                  
    [62] tBodyGyroJerk_std_Y                 
    [63] tBodyGyroJerk_std_Z                  
    [64] tBodyAccMag_std                     
    [65] tGravityAccMag_std                   
    [66] tBodyAccJerkMag_std                 
    [67] tBodyGyroMag_std                     
    [68] tBodyGyroJerkMag_std                
    [69] fBodyAcc_std_X                       
    [70] fBodyAcc_std_Y                      
    [71] fBodyAcc_std_Z                       
    [72] fBodyAccJerk_std_X                  
    [73] fBodyAccJerk_std_Y                   
    [74] fBodyAccJerk_std_Z                  
    [75] fBodyGyro_std_X                      
    [76] fBodyGyro_std_Y                     
    [77] fBodyGyro_std_Z                      
    [78] fBodyAccMag_std                     
    [79] fBodyAccJerkMag_std                  
    [80] fBodyGyroMag_std                    
    [81] fBodyGyroJerkMag_std                 
    [82] angle_tBodyAccMean_gravity          
    [83] angle_tBodyAccJerkMean_gravityMean   
    [84] angle_tBodyGyroMean_gravityMean     
    [85] angle_tBodyGyroJerkMean_gravityMean  
    [86] angle_X_gravityMean                 
    [87] angle_Y_gravityMean                  
    [88] angle_Z_gravityMean 

## The source data

The source data represent data collected from the accelerometers from the Samsung Galaxy S smartphone for 30 subjects. These subject has been splitted into two different sets of data labelled test and train. Using webcams, the activity for each sample has been categorized according to 6 different categories, "LAYING", "SITTING", "STANDING", "WALKING", "WALKING_DOWNSTAIRS", "WALKING_UPSTAIRS".

The data for the project was obtained from: 

https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip 

A full description is available at the site where the data was obtained:

http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones 

## Data transformation

1. The zip data was downloaded from the url above and then unzipped in the working directory.
2. The train and the test data was merged together into one table, including subject, activity and measurement data. 
3. The column names for the measurement data was taken from the features table and unproper characters were removed from the names. Only measurement columns with names containing "mean", "Mean" and "std" were kept.
4. The dplyr package was used to calculate the mean per remaining measurement per subject and activity.
5. In the next step, the merge function was used to replace the activity integer values with the labels.After the merge, the columns were rearranged and re-named.
6. Finally, the tidy data was saved in the working directory as "tidydata.txt". The "tidydata.txt" contains a table, measurements_means with 88 columns and 180 rows (one per subject and activity).
