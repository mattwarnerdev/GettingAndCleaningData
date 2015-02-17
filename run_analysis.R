run_analysis <- function() {
  library(dplyr)
  
  colHeaders <- read.table("data/getdata-projectfiles-UCI HAR Dataset/UCI HAR Dataset/features.txt", 
                           header = FALSE)
  colNames <- colHeaders[, 2]
  
  #Remove invalid characters from column names
  colNames <- sapply(colNames, function(x) gsub("[-(),]", "", x))
  
  activity_labels <- read.table("data/getdata-projectfiles-UCI HAR Dataset/UCI HAR Dataset/activity_labels.txt", 
                                header = FALSE, 
                                col.names = c("activity", "activity_label"))
  
  #Test data
  test_activity <- read.table("data/getdata-projectfiles-UCI HAR Dataset/UCI HAR Dataset/test/y_test.txt", 
                         header = FALSE,
                         col.names = "activity")
  test_activity <- merge(test_activity, activity_labels, by="activity")

  
  test_table <- read.table("data/getdata-projectfiles-UCI HAR Dataset/UCI HAR Dataset/test/X_test.txt", 
                           header = FALSE, 
                           col.names = colNames)

  test_subject <- read.table("data/getdata-projectfiles-UCI HAR Dataset/UCI HAR Dataset/test/subject_test.txt", 
                       header = FALSE,
                       col.names = "subject")
  
  test_data <- cbind(test_subject, activity, test_table)
  
  
  
  #Train data
  train_activity <- read.table("data/getdata-projectfiles-UCI HAR Dataset/UCI HAR Dataset/train/y_train.txt", 
                         header = FALSE,
                         col.names = "activity")
  train_activity <- merge(train_activity, activity_labels, by="activity")
  
  
  train_table <- read.table("data/getdata-projectfiles-UCI HAR Dataset/UCI HAR Dataset/train/X_train.txt", 
                           header = FALSE, 
                           col.names = colNames)
  
  train_subject <- read.table("data/getdata-projectfiles-UCI HAR Dataset/UCI HAR Dataset/train/subject_train.txt", 
                             header = FALSE,
                             col.names = "subject")
  
  train_data <- cbind(train_subject, train_activity, train_table)
  
  
  #combine test and train
  all_data <- rbind(test_data, train_data)
    
  all_data <- tbl_df(all_data)

  all_data <- select(all_data, subject, activity, activity_label, contains("mean"), contains("std"))
  
  all_data
  
}
