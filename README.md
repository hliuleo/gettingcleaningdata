# Make a Tidy dataset of Human Activity Recognition from Samsung Galaxy S smartphone.

The data is from [UCI Machine Learning Repository]. The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING, UPSTAIRS, WALKING, DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, they captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. The experiments have been video-recorded to label the data manually. The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data. 

The purpose of this job is to:
1. Merges the training and the test sets to create one data set.

2. Extracts only the measurements on the mean and standard deviation for each measurement. 

3. Uses descriptive activity names to name the activities in the data set

4. Appropriately labels the data set with descriptive variable names. 

5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.

Here, we created a R script ``run_analysis.R`` to do this job. The result file is ``Means.txt``. 

In the step 4, the naming rule is as follows:
* remove all the ``-`` symbols 
* ``t`` changes to ``Time``
* ``f`` changes to ``Frequency``
* ``mean`` changes to ``Mean``
* ``std`` changes to ``StdDev``
* ``BodyBody`` changes to ``Body``




[UCI Machine Learning Repository]:http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones
