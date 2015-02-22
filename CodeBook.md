Attribute Information:

The columns in the dataset are labelled. For each record in the dataset it is provided: 
- An identifier of the subject who carried out the experiment. (from a group of 30 volunteers)
- Activity name executed (activity label -WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING-)
- A 80-estimated variables vector with means and standard deviations on the features in the exercise

Reading files:

The dataset is saved in a txt file using:
write.table(ds_mean_std,"ds_mean_std.txt",col.names=TRUE)
Yo can read it using:
read.table("ds_mean_std.txt", header=TRUE)