run_analysis <- function() {
  library(dplyr)
  library(reshape2)
  
  #Q4 (Part 1): Appropriately labels the data set with descriptive variable names. 
  #Get and clean the column headers for the phone metrics. 561 rows to be converted to columns.
  colHeaders <- read.table("data/getdata-projectfiles-UCI HAR Dataset/UCI HAR Dataset/features.txt", header = FALSE)
  colNames <- colHeaders[, 2]  

  #Remove invalid characters from column names
  colNames <- sapply(colNames, function(x) gsub("[-(),]", "", x))
  
  #Load the codes/descriptions for the 6 activities (Walking etc.)
  activity_labels <- read.table("data/getdata-projectfiles-UCI HAR Dataset/UCI HAR Dataset/activity_labels.txt", 
                                header = FALSE, 
                                col.names = c("activity", "activity_label"))
  
  #Load test data, apply descriptive column names and activity descriptions
  test_data <- loadData("test", activity_labels, colNames)
  
  #Load train data, apply descriptive column names and activity descriptions
  train_data <- loadData("train", activity_labels, colNames)

  
  #Q1.  Merges the training and the test sets to create one data set.
  #combine test and train
  all_data <- rbind(test_data, train_data)
  
  #Q2. Extracts only the measurements on the mean and standard deviation for each measurement. 
  #Use dplyr to limit the result to columns to mean and standard deviation
  all_data <- tbl_df(all_data)
  all_data <- select(all_data, subject, activity, activity_label, contains("mean"), contains("std"))
  
  #Q4: Final step: Print the data to the console
  message("Printing the data table for Q4: All test and train phone data with labels, descriptive columns, and subject")
  print(all_data)
  
  ##Step 5: From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.
  #group by subject and activity, average for each variable .
  # mean of tBodyAccmeanX should be 0.2743, tBodyAccmeany should be -0.01774
  # Wait: by activity!
  
  #activity_label and activity are redundant, but group by both to ensure activity isn't averaged later
  # %>% is like a pipe, reads left to right, input of left passed to right.  Avoids saving/nesting dplyr calls.
  message("Printing the data table for Q5: All test and train phone data with labels, descriptive columns, and subject")
  phone_summary <- all_data %>% group_by(subject, activity, activity_label) %>% summarise_each(funs(mean)) %>% arrange(subject, activity, activity_label)
  write.table(phone_summary, file = "data/step5out.txt", row.names = FALSE)
  print(phone_summary)
  
  
}

loadData <- function(dataSetName, activity_labels, colNames) {
  #Load the source data, activity
  activity <- read.table(paste("data/getdata-projectfiles-UCI HAR Dataset/UCI HAR Dataset/", dataSetName, "/y_", dataSetName, ".txt", sep = ""), header = FALSE, col.names = "activity")
  
  #Q4 (Part 2): Load source data (phone metrics). Appropriately labels the data set with descriptive variable names. 
  phone_data <- read.table(paste("data/getdata-projectfiles-UCI HAR Dataset/UCI HAR Dataset/", dataSetName, "/X_", dataSetName, ".txt", sep = ""), header = FALSE, col.names = colNames)
  
  #Q5 (Part 1): From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.
  #Join the subject data to the phone data to use in the per subject summary
  subject <- read.table(paste("data/getdata-projectfiles-UCI HAR Dataset/UCI HAR Dataset/", dataSetName, "/subject_", dataSetName, ".txt", sep = ""), header = FALSE, col.names = "subject")
  data <- cbind(subject, activity, phone_data)
  
  #Q3: Uses descriptive activity names to name the activities in the data set
  #Joins the activity code with its associated description
  #Merge needs to come after the cbind, because applying it before the cbind was changing the order of the matched fields
  #(walking was all moving to the top of the table instead of staying interspersed), which caused subject 1, for example,
  #to only be matched with walking.  Placing it after preserves the matching of each subject to each measured activity
  data <- merge(data, activity_labels, by="activity")
  
  
  return(data)
}
