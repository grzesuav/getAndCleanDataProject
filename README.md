 README
 
 To load data by using run_analysis.R script please do the following :
 1. Load run_analysis.R script
 2. Assuming setwd() is set to UCI HAR Dataset directory, run loadData() function which performs:
 * load and merge test data with subjects and activities
 * load and merge train data with subjects and activities
 * merges train and test data into one data frame
 * add variables description from features.txt
 * replace activities values by its description from activity_labels.txt
 * melt and dcast data : make average calculation of each variable for every combination of subject and activity
 * save results to file "tidy.txt"
