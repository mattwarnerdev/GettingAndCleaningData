# Getting and Cleaning Data Course Project

This project is an exercise in Tidy Data, taking raw, unformatted data from phone measurements of activities and movements performed by individuals.

  * CodeBook.md describes the data, variables, and tranformations.
  * run_analysis.R provides the source code to make those tranformations.
  * The raw data for the exercise is available [here]
[here]:https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip 

###Tidy Data:
The data tables output by the run_analysis function are tidy because they follow the rules we covered in the class:
  * Raw Data: Here is a link to the [raw data].
    * After downloading and unzipping the raw data, no modifications are required except those performed by the run_analysis and loadData functions, both provided in the run_analysis.R file.
  * Tidy Data:
    * The first result compiled by the script is tidy because of the following reasons:
      * Each column contains only one variable type and one observation per cell
      * Each row references only one subject/individual and activity.  Multiple rows represent the phone's metrics over time for that subject and activity.
      * The table as a whole includes all the data from the subjects for each activity.  The table might be called PhoneActivityData, and it includes no other data.
      * The columns are labeled with descriptive column names, invalid characters removed
    * The second result is tidy because of the following reasons:
      * Like the first table, it contains only one observation per cell
      * Each row represents a summary for the given activity and subject/individual.
  * The Code Book:
    * See CodeBook.md
  * The exact recipe to go from raw data to tidy data is provided:
    * The R script names run_analysis.R



