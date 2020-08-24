# tidy-uci-har

## Running the script
By default, the script assumes the files are available in a folder called `UCI HAR Dataset` in the current working directory. If your files are on a different path, you need to modify the `directory` variable right at the top of the file. No other configuration is necessary in order to run the script. By default, the script saves its output to `tidy UCI HAR Dataset.txt` in the current working directory. If you want it to be saved at a different location, change the line right at the end of the file.

## Process
The script proceeds in the following fashion
1. Load training data
2. Load testing data
3. Merge training and testing data together
4. Set reasonable column names
5. Read in the feature names
6. Keep only the features which represent the mean of some measurement and change the column names to accurately represent the features
7. Read activity labels and replace the numerical representation with a human readable one
8. Average all measurements by user and activity
9. Save the output to a file

## Codebook
- Subject is a number between 1 and 30 which represents the ID of the person who measurements are noted in the row
- Activity is a categorical variable taking on six values which represents the activity the subject was doing when the measurements were taken
- The rest of the column are normalized sensor values between -1 and +1 averaged across all the subject-activity measurements
