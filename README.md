# Getting and Cleaning Data Course Project

### run_analysis() Function

The run_analysis function takes Samsung phone movement and accelerometer data gathered from 30 individuals as they performed 6 different activities (walking, sitting), combines it into one dataset for analysis, and summarizes the data per individual and activity in another.

Here is the [source data] used in the analysis.
[source data]:https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip 

The function assumes you have the source data downloaded and unzipped in your working directory in the following path: 
```
data/getdata-projectfiles-UCI HAR Dataset/UCI HAR Dataset/
```

The goal of the analysis was to combine the data into a tidy dataset.



| Name | Description | How it's used in the analysis  |
| ------------- | ----------- | ------------ |
| activity_labels.txt      | A key-value pair that maps a code to an associated activity (1 = Walking etc.).  6 activities in rows.  | tyis  |
| features.txt     | A list of the measure descriptions on movement captured by the Samsung phones, such as tBodyAcc-mean.  561 measures in rows. |  |
| features_info.txt  |  Descriptions and mathematical sources of the measures found in features.txt. |   |
| README.txt  | Descriptions of the survey and data creators, descriptions of the files in the data set.  |   |
| test\  |   |   |
| test\Inertial Signals\  | Raw data used to generate X_test.txt  |   |
| test\subject_test.txt  |  A list of identifiers (1 - 30) that maps to one of the 30 individuals who performed the activities.  2947 rows. |   |
| test\X_test.txt  | The test set, including 2947 unlabelled observations of the 561 measures listed in features.txt.  2947 rows.  |   |
| test\y_test.txt  |  The activity code for each line in found X_test.txt.  2947 rows.  |   |
| train\Inertial Signals\  | Raw data used to generate X_train.txt  |   |
| train\subject_train.txt  | A list of identifiers (1 - 30) that maps to one of the 30 individuals who performed the activities.  7352 rows.  |   |
| train\X_train.txt  | The test set, including 2947 unlabelled observations of the 561 measures listed in features.txt.  7352 rows.  |   |
| train\y_train.txt  |  The activity code for each line in found X_test.txt.  7352 rows.  |   |


