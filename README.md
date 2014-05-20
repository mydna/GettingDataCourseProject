# Getting and Cleaning Data Course Project
## This readme file details the analysis for the Getting and Cleaning Data course project in the R series.


* This analysis requires that the data is downloaded and unzipped to the working directory where the run_analysis.R file is run.

* Data used in this analysis can be found at: https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

* The R script processes the downloaded data to create two tidy data sets. This involves a five step process as detailed here:

  * First, the training and test data sets are merged using rbind function.
  
  * Next, for each measurement recorded, the standard deviation and means are extracted using a grep command. These variables are used to extract those columns for the tidy data set. The names are modified to change all upper case letters to lower case and also have the parentheses removed. "." are used to replace underscores for readability while following proper naming rules. 
  
  * Next, the activities are given appropriate descriptive names such as "walking", "sitting," etc. These names are modified to remove underscores. 
  
  * Next, the data set are assigned the correlating activity names. This concludes creating the first tidy data set.
  
  * In order to create the second tidy data set, the average for each subject, activity and measurement is calculated and created as a table. 
  
  
  