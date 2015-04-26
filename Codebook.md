##Codebook on Tidy Set

###Study design
Readme.md also includes design outline.
labeling design is mostly camelCase with variable names, excepting Subject and Activity, and other variables that include
an average computed by two other variables("angleOfTimeBodyGyroJerkMeanAndgravityMean"). See below for examples.
Most labels are made to mirror raw data as closely as possible.

###Variable names

"Subject"
total subjects 30
"Activity" 
6 factors "WALKING","WALKING_UPSTAIRS","WALKING_DOWNSTAIRS","SITTING","STANDING","LAYING"

####Other variable names examples


"timeBodyAccelerationMeanX" 

The variable for the time domain(time) body signal(Body) acceleration(Acceleration) average(mean) in the x plane(X)


"frequencyBodyGyroStdY" 

the variable for the frequency domain body signal gyroscope standard deviation in the y plane

"angleOfXAndgravityMean"

And followed by a camelCase indicates a combination of two variables; in this case it's the average of the angle
of x and the gravityMean
