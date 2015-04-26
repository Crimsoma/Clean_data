# Clean_data

Design goals
1. Merge data into one set
2. Clean data by improving labeling and removing irrelevant variables
3. Create new tidy set with means of each variable by subject by activity

1. Merge data
The variable renaming was actually done before the merging, due to ease of coding. See 2.
Standard methods for merging two sets with similar variables, Subject and Activity were prepended to the frame.

2. Labeling
Variable name cleanup was done during the merge step, see 1.
Activity was recast as a factor to aid in giving meaningful description to the Activity column.
Data was then arranged by subject

3. Tidy set
Each variable that included reference to mean or standard deviation was included and averaged by Subject and Activity
As such, the data looks something like:
Subject Activity mean1   mean2
int1    walking  double  double
int1    standing double  double
etc
for all 6 activites for every subject.
3 sig figs was chosen as a round point arbitrarily and can be undone simply by removing the round inside the summarise_each call in the R script.
