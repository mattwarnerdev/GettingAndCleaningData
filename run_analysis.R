run_analysis <- function() {
  library(dplyr)
  
  colHeaders <- read.table("data/getdata-projectfiles-UCI HAR Dataset/UCI HAR Dataset/features.txt", 
                           header = FALSE)
  colNames <- colHeaders[, 2]

  
  test_table <- read.table("data/getdata-projectfiles-UCI HAR Dataset/UCI HAR Dataset/test/X_test.txt", 
                           header = FALSE, 
                           col.names = colNames)

  subject <- read.table("data/getdata-projectfiles-UCI HAR Dataset/UCI HAR Dataset/test/subject_test.txt", 
                       header = FALSE,
                       col.names = "subject")
  
  activity <- read.table("data/getdata-projectfiles-UCI HAR Dataset/UCI HAR Dataset/test/y_test.txt", 
                         header = FALSE,
                         col.names = "activity")
  
  activity_labels <- read.table("data/getdata-projectfiles-UCI HAR Dataset/UCI HAR Dataset/activity_labels.txt", 
                                header = FALSE, 
                                col.names = c("activity", "activity_label"))

  activity <- merge(activity, activity_labels, by="activity")

  test_data <- cbind(subject, activity, test_table)
  
  test_data <- tbl_df(test_data)

  test_data <- select(test_data, subject, activity, activity_label, contains("mean"), contains("std"))
  
  test_data
  
}