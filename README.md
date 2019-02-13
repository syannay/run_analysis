# **Getting and Cleaning Data - Assignment**

## **Summary**

This project focuses on obtaining data, using R to clean the data, and finally creating a text file of the tidy data. 

## **Overview**

### **Data Summary**

The x variable entries in the train and test data sets are measurements of human activity (such as walking_upstairs, walking_downstains, sitting, etc.). These measurements were recorded using a waist-mounted smartphone from 30 subjects. The y variable entries in the train and test data sets are the activities the subjects performed.  

## **R Script**

To obtain the desired output, it requires downloading the following R Project and running the following R script:
* `Coursera - R Training.Rproj`
* `run_analysis.R`

## **Human Activity Recognition Data**

The following reports are required to run the script:
* `X_test.txt`
* `Y_test.txt`
* `subject_test.txt`
* `X_train.txt`
* `Y_train.txt`
* `subject_train.txt`

Note: reports should be saved in the "raw" directory within the "getting_and_cleaning_data" directory.

## **Expected Outputs**

### **Files**

The following .txt file is created from running the code:
* `tidydata_full.txt`

## **Requirements**

### **Software**

Software required to generate necessary outputs for DSD deliverable:
* R v 3.5+
* R Packages
  - dplyr
  - tidyr

---

## **Detailed Process**

### **Preparing for the Script Run**
1. Download the `Coursera - R Training.zip` file and unzip it to any directory on your system. 
2. Download the data from the "Getting and Cleaning Data" project summary
3. Unzip the data, placing the extracted file directory into the "raw" directory within the "getting_and_cleaning_data" directory.
4. Open the `Coursera - R Training.Rproj` project and the `run_analysis.R` file
5. Ensure required packages above are installed prior to running the script.
6. Run the script.

### **Code Explanation**
Once the data gets read into the environment, the script does the following:
1. Merges train and test data with respect to the variable (x or y) by using **rbind** command.
2. Subsets the data by extracting only the entries that contain "mean" or "std" by using the **grepl** command.
3. Renames the columns of the data tables using appropriate labels.
4. Creates tidy data set and writes it to a .txt file in the "finished" directory. 