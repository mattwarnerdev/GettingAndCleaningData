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
| activity_labels.txt      | A key-value pair that maps a code to an associated activity (1 = Walking etc.).  6 activities in rows.  | Maps the numbers in y_test.txt and y_train.txt to activity descriptions.  |
| features.txt     | A list of the measure descriptions on movement captured by the Samsung phones, such as tBodyAcc-mean.  561 measures in rows. | Becomes the columns that label the data in X_test.txt and X_train.txt |
| features_info.txt  |  Descriptions and mathematical sources of the measures found in features.txt. |  Unused. |
| README.txt  | Descriptions of the survey and data creators, descriptions of the files in the data set.  | Unused.  |
| test\  | The test and train folders have identical file and data structure, but different data, separated by subject.  | Data is merged with that in \train |
| test\Inertial Signals\  | Raw data used to generate X_test.txt  |  Unused. |
| test\subject_test.txt  |  A list of identifiers (1 - 30) that shows which one the 30 individuals performed the activities.  2947 rows. | The single column is bound (added) to data from X_test.txt to show which of the 30 test subjects performed the activity.  |
| test\X_test.txt  | The test set, including 2947 unlabelled observations of the 561 measures listed in features.txt.  2947 rows.  |  Once combined with the subject (individual), activity description, and descriptive column names, the data can be read, understood, and analyzed. |
| test\y_test.txt  |  The activity code for each line in found X_test.txt.  2947 rows.  | The single column is bound (added) to data from X_test.txt to identify the activity for that line.  |
| train\ | The test and train folders have identical structure, but different data, separated by subject.  | Data is merged with that in \test  |
| train\Inertial Signals\  | Raw data used to generate X_train.txt  | Same as \test above.  |
| train\subject_train.txt  | A list of identifiers (1 - 30) that maps to one of the 30 individuals who performed the activities.  7352 rows.  | Same as \test above.  |
| train\X_train.txt  | The test set, including 2947 unlabelled observations of the 561 measures listed in features.txt.  7352 rows.  |  Same as \test above. |
| train\y_train.txt  |  The activity code for each line in found X_test.txt.  7352 rows.  | Same as \test above.  |


###Description of run_analysis() Code:

Dependencies: Requires dplyr package to be installed. 

Two functions, run_analysis and loadData work together to load and prepare the data.  loadData enables the same code to be used for both the train and test data, whose structure is identical.

run_analysis loads the column headers from features.txt and removes characters that are invalid for data frame column names like "-(),.", and it loads activity_labels to map the activity codes to their descriptions.

It passes the activity labels and column names to the loadData function with an argument to identify test or train folders, then combines all the data from test and train into one data table.

###Tidy Data:
The resulting data table is tidy because it follows the rules we discussed in class:

//Explain tidy data

//Explain the output for step 5.

//Code book
