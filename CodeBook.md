# CodeBook
## Analysis Pipeline
The run_analysis.R script runs the following steps:
  1. The 6 different tables are read in (training sets and test sets for X, Y, Subject). 
  2. The training and test data set for each (X, Y, Subject) are merged together using rbind.
  3. The features.txt file is read in and used to extract the names of the measurements recorded for the subjects/activities. The average and standard deviation measurements are extracted from the full features set. The grep function is used for this extraction. 
  4. The extracted measurement labels are modified to remove parentheses using gsub. toLower function is also used to change any upper case letters to lower case. The underscores are replaced with periods for following proper naming conventions while retaining readability.
  5. Next, the activity labels are extracted from the activity_labels.txt. These labels detail the activity such as "walking", "sitting", etc. These labels are also modified using the gsub function to remove underscores.
  6. Using the cbind function, the X, Y and subject data sets are merged together to create the first tidy data set. This data set is written to the working directory as "merged_tidy_data.txt".
  7. Finally, the averages for the measurements by each subject and activity is calculated and is created as the second tidy data set. This second data set is written tot he working directory as "tidy_dataset_2_with_averages.txt".
  
  
## First Tidy Data Set
### merged_tidy_data.txt

Following are the column names in the first tidy data set:

subject
activity
tbodyacc.mean.x
tbodyacc.mean.y
tbodyacc.mean.z
tbodyacc.std.x
tbodyacc.std.y
tbodyacc.std.z
tgravityacc.mean.x
tgravityacc.mean.y
tgravityacc.mean.z
tgravityacc.std.x
tgravityacc.std.y
tgravityacc.std.z
tbodyaccjerk.mean.x
tbodyaccjerk.mean.y
tbodyaccjerk.mean.z
tbodyaccjerk.std.x
tbodyaccjerk.std.y
tbodyaccjerk.std.z
tbodygyro.mean.x
tbodygyro.mean.y
tbodygyro.mean.z
tbodygyro.std.x
tbodygyro.std.y
tbodygyro.std.z
tbodygyrojerk.mean.x
tbodygyrojerk.mean.y
tbodygyrojerk.mean.z
tbodygyrojerk.std.x
tbodygyrojerk.std.y
tbodygyrojerk.std.z
tbodyaccmag.mean
tbodyaccmag.std
tgravityaccmag.mean
tgravityaccmag.std
tbodyaccjerkmag.mean
tbodyaccjerkmag.std
tbodygyromag.mean
tbodygyromag.std
tbodygyrojerkmag.mean
tbodygyrojerkmag.std
fbodyacc.mean.x
fbodyacc.mean.y
fbodyacc.mean.z
fbodyacc.std.x
fbodyacc.std.y
fbodyacc.std.z
fbodyaccjerk.mean.x
fbodyaccjerk.mean.y
fbodyaccjerk.mean.z
fbodyaccjerk.std.x
fbodyaccjerk.std.y
fbodyaccjerk.std.z
fbodygyro.mean.x
fbodygyro.mean.y
fbodygyro.mean.z
fbodygyro.std.x
fbodygyro.std.y
fbodygyro.std.z
fbodyaccmag.mean
fbodyaccmag.std
fbodybodyaccjerkmag.mean
fbodybodyaccjerkmag.std
fbodybodygyromag.mean
fbodybodygyromag.std
fbodybodygyrojerkmag.mean
fbodybodygyrojerkmag.std


## First Tidy Data Set
### tidy_dataset_2_with_averages.txt

Following are the column names in the second data set:
subject
activity
tbodyacc.mean.x
tbodyacc.mean.y
tbodyacc.mean.z
tbodyacc.std.x
tbodyacc.std.y
tbodyacc.std.z
tgravityacc.mean.x
tgravityacc.mean.y
tgravityacc.mean.z
tgravityacc.std.x
tgravityacc.std.y
tgravityacc.std.z
tbodyaccjerk.mean.x
tbodyaccjerk.mean.y
tbodyaccjerk.mean.z
tbodyaccjerk.std.x
tbodyaccjerk.std.y
tbodyaccjerk.std.z
tbodygyro.mean.x
tbodygyro.mean.y
tbodygyro.mean.z
tbodygyro.std.x
tbodygyro.std.y
tbodygyro.std.z
tbodygyrojerk.mean.x
tbodygyrojerk.mean.y
tbodygyrojerk.mean.z
tbodygyrojerk.std.x
tbodygyrojerk.std.y
tbodygyrojerk.std.z
tbodyaccmag.mean
tbodyaccmag.std
tgravityaccmag.mean
tgravityaccmag.std
tbodyaccjerkmag.mean
tbodyaccjerkmag.std
tbodygyromag.mean
tbodygyromag.std
tbodygyrojerkmag.mean
tbodygyrojerkmag.std
fbodyacc.mean.x
fbodyacc.mean.y
fbodyacc.mean.z
fbodyacc.std.x
fbodyacc.std.y
fbodyacc.std.z
fbodyaccjerk.mean.x
fbodyaccjerk.mean.y
fbodyaccjerk.mean.z
fbodyaccjerk.std.x
fbodyaccjerk.std.y
fbodyaccjerk.std.z
fbodygyro.mean.x
fbodygyro.mean.y
fbodygyro.mean.z
fbodygyro.std.x
fbodygyro.std.y
fbodygyro.std.z
fbodyaccmag.mean
fbodyaccmag.std
fbodybodyaccjerkmag.mean
fbodybodyaccjerkmag.std
fbodybodygyromag.mean
fbodybodygyromag.std
fbodybodygyrojerkmag.mean
fbodybodygyrojerkmag.std

The second data set is an average summary of the first data set. In other words, the second tidy data set contains the averages for each of the measurements by Subject and Activity.


## Subject Values

There are 30 distinct subjects (1-30).

## Activity Values

There are 6 distinct activities as follows:
  1. Walking
  2. Walking Upstairs
  3. Walking Downstiars
  4. Sitting
  5. Standing
  6. Laying