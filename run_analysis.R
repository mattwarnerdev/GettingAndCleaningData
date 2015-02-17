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
  test_data <- loadData("test", activity_labels, colNames)
  
  #Train data
  train_data <- loadData("train", activity_labels, colNames)

  
  #combine test and train
  all_data <- rbind(test_data, train_data)
    
  all_data <- tbl_df(all_data)

  all_data <- select(all_data, subject, activity, activity_label, contains("mean"), contains("std"))
  
  return(all_data)
  
}

loadData <- function(dataSetName, activity_labels, colNames) {
  activity <- read.table(paste("data/getdata-projectfiles-UCI HAR Dataset/UCI HAR Dataset/", dataSetName, "/y_", dataSetName, ".txt", sep = ""), 
                              header = FALSE,
                              col.names = "activity")
  activity <- merge(activity, activity_labels, by="activity")
  
  
  table <- read.table(paste("data/getdata-projectfiles-UCI HAR Dataset/UCI HAR Dataset/", dataSetName, "/X_", dataSetName, ".txt", sep = ""), 
                           header = FALSE, 
                           col.names = colNames)
  
  subject <- read.table(paste("data/getdata-projectfiles-UCI HAR Dataset/UCI HAR Dataset/", dataSetName, "/subject_", dataSetName, ".txt", sep = ""), 
                             header = FALSE,
                             col.names = "subject")
  
  data <- cbind(subject, activity, table)
  
  return(data)
}
