# Forest Analysis Script
# Author: Dr. Smith
# Date: ???

# Load packages
library(ggplot2)

# Read the data (MAKE SURE THIS PATH WORKS ON YOUR MACHINE!)
setwd("C:/Users/JohnDoe/Documents/forest_project")
trees <- read.csv("forest_inventory_data.csv")
env <- read.csv("environmental_measurements_backup_old.csv")

# Quick check
print(dim(trees))

# Calculate some stuff
avgDBH <- mean(trees$dbh_cm)
avgHeight <- mean(trees$height_m)

# More calculations
trees$ba <- (trees$dbh_cm/2)^2 * 3.14159

# Check species
table(trees$tree_species)

# Merge datasets (IMPORTANT: Don't lose any data!)
trees <- merge(trees, env, by="plot_id")

# Calculate volume (using simplified formula)
# V = BA * H * form_factor (assuming 0.5)
trees$volume <- trees$ba * trees$height_m * 0.5

# Some summary stats
summary(trees$volume)

# Calculate per-plot summaries (THIS PART IS CRITICAL!)
PlotSummary <- aggregate(cbind(dbh_cm, height_m, volume) ~ plot_id, data=trees, FUN=mean)
PlotSummary$TreeCount <- aggregate(dbh_cm ~ plot_id, data=trees, FUN=length)$dbh_cm

print(PlotSummary)

# Save results
write.csv(trees, "forest_data_processed.csv", row.names=FALSE)
write.csv(PlotSummary, "plot_summary_stats.csv")

# VISUALIZATION (TO BE IMPROVED)
plot(trees$dbh_cm, trees$height_m)

print("Analysis complete!")
