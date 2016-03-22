# Coursera Data Science Specialization - Getting & Cleaning Data Final Project

This repository contains all the necessary files (script + data) that are needed to extract, load, transform and save
the data, resulting in a tidy dataset.

This repo contains the script `run_analysis.R`, that does the following:

1. Loads the activities and features info.
2. Loads the training data set and keeps only the columns that contain measurements with means and standard deviations.
3. Same as above, but for the test dataset.
4. Combines the 2 transformed datasets above, in order to create a bigger one.
5. Aggregates the combined dataset on the attributes (subject, activity) and computes the mean of the rest numeric variables for each group.
6. Saves the newly created dataset, in the file `tidy.txt`.