# DA_scripts

This package provides two wrappers FeatureSelect.R and Validate.R over the functions from the package DecisionAnalysis. 

FeatureSelect works in two modes. 
- The default modes partition the data in train and test sets. It conducts feature selection (ReliefF) on the train set. It then trains random forest on the train dataset and predicts on the test dataset. 
- In the other mode which can be activated by `--use_all`, it does feature selection on the entire dataset and does not do any training and testing.

Validate.R takes two files called train_file and validate_file. It obtains the set of features from the validate file, then trains the entire data from train_file using those features and predict on the data from validate_file.

The options from both the wrapper can be seen using -h.
