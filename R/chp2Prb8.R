# Problem 8 from Chapter 2



# a) Read "college" dataset into R ----
url <- 'http://www-bcf.usc.edu/~gareth/ISL/College.csv'
college <- read.csv(url)

# b) ---- 
# College names are already row names. Will not do code to transform that
fix(college)
rownames(college) <- college[, 1]
fix(college)
college <- college[, -1]
fix(college)

# c) ----
# i.
summary(college)

# ii. scatterplot matrix of first 10 columns
pairs(college[, 1:10])

# iii. Create boxplot of outstate vs private
plot(college$Private, college$Outstate)
title('C) iii. Box Plot of Outstate vs Private',
      xlab = 'College Is Private',
      ylab = 'Number of Out of State Students')

# iv. Create qualitative variable Elite
elite <- rep('no', nrow(college))
elite[college$Top10perc > 50] = 'yes'
elite <- as.factor(elite)
college <- data.frame(college, elite)

summary(college$elite)
plot(college$elite, college$Outstate)
title('C) iv. Box Plot of Outstate vs Elite',
      xlab = 'College Is Elite',
      ylab = 'Number of Out of State Students')


# v. produce histograms with differing numbers of bins
vars <- names(college)
factVars <- vars[vapply(college, class, character(1)) == 'factor']

par(mfrow = c(2, 2))

hist(college$Apps, breaks = 30)

hist(college$Room.Board, breaks = 20)
hist(college$F.Undergrad, breaks = 10)
hist(college$P.Undergrad, bins = 3)
