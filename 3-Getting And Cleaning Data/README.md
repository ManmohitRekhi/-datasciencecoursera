Getting and Cleaning Data Course Project
========================================
This file describes how run_analysis.R script works.
* First, download and unzip the data from https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip.
* Make sure the data and the run_analysis.R script are both in the same working directory.
* Next, use source("run_analysis.R") command in RStudio. 
* After that, you will find two output files are generated in the current working directory:
  - merged_data.txt (7.9 Mb): containing a data frame with 10299*68 dimension.
  - data_with_means.txt (220 Kb): it contains a data frame with 180*68 dimension.
* Finally, use data <- read.table("data_with_means.txt") command in RStudio to read the file. Since we are required to get the average of each variable for each activity and each subject, and there are 6 activities in total and 30 subjects in total, we have 180 rows with all combinations for each of the 66 features.