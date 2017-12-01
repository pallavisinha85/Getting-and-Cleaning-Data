---
output: html_document
---
# Introduction
This markdown file describes the working of run_analysis.R script that produces 
a tidy data set from UCI Human Activity Recognition Using Smartphones Data Set (Data Source: [https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip](https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip)). 

# Environment setup (before executing run_analysis.R)
## Setting the current working directory
It is assumed that the current working directory contains **UCI HAR Dataset** 
folder that is created after extracting the source data from [https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip](https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip). Set appropriate working directory by running setwd() command in R before executing run_analysis.R script as shown in the example below.
```{r}
setwd("E:/Data/DS/Getting and Cleaning the data")
```

## Install and load required packages
It is required to install **data.table** package for this script to execute. Install the package by running the following command in R:
```{r}
install.packages("data.table")
```
Load the installed package by running the following command in R:
```{r}
library(data.table)
```

# Script execution
The script run_analysis.R should be placed in the current working directory. Run the following command in R to execute the script.
```{r}
source('E:/Data/DS/Getting and Cleaning the data/run_analysis.R')
```



