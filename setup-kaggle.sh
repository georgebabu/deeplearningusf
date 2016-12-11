#!/bin/bash
#
# --------------------------------------------------------
# A Script to copy over sample files from the training set
# Written by George Babu November 5, 2016
# --------------------------------------------------------

StartDir=~/data
DataSet=dogs-vs-cats-redux-kernels-edition
DataSetDir=dogscats-redux2
Category1=dogs
Category2=cats
SampleSet=43

# Create the right directory
cd $StartDir
mkdir $DataSetDir
cd $DataSetDir

# Create the directories
mkdir train
mkdir sample
mkdir test
mkdir valid
mkdir {train,sample,valid}/$Category1
mkdir {train,sample,valid}/$Category2

# Download the dataset
kg config -u georgebabu -p Limonbuba1indvar2! -c $DataSet 
kg download

# Unzip the files to the right folders
mv test.zip test
mv train.zip train

unzip test/test.zip
unzip train/train.zip

rm test/test.zip
rm train/train.zip

# Create the subfolders and move the files there
mv train/dog.* train/$Category1
mv train/cat.* train/$Category2

cp train/dog.${SampleSet}* sample/$Category1
cp train/cat.${SampleSet}* sample/$Category2

# How do I randomly select a validation & sample set?
# How do you validate that the directories don't exist?
# How do I suppress messages and use my own?
