## Scripts

# run_analysis.R

The script reads the raw data from the "UCI HAR Dataset" downloaded from http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones and as an output saves the averages of means and standard deviation of particular features by the subject and activity measured during the accelerometer experiment.

The script performs the following steps: 
1. The script reads the data from the "UCI HAR Dataset" folder, which has to be included to the root folder of working directory
2. As a next step the script merges the test and training data sets
3. Descriptive variable names are added
4. Subject and activity labels are added
5. Variables containing the means and standard deviations of features are extracted, as well as the subject and activity labels
6. The data is aggregated by each subject and activity and the averages of individual extracted features are calculated
7. The averages are exported to "analysis.txt"