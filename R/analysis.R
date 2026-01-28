# Forest Analysis Script
# Author: Dr. Smith
# Date: 28.01.2026


# Load packages ----
library(ggplot2)
library(here)

# Read the data ----
data_trees <- read.csv(here::here("Data/forest_inventory_data.csv"))
data_env <- read.csv(here::here("Data/environmental_measurements_backup_old.csv"))

# Quick check
print(dim(trees))

# Calculate DBH and height
avg_DBH_tree <- mean(data_trees$dbh_cm)
avg_height_tree <- mean(data_trees$height_m)

# More calculations
data_trees$ba <- (data_trees$dbh_cm/2)^2 * 3.14159

# Check species
table(data_trees$tree_species)

# Merge datasets
data_trees_env_merged <- merge(data_trees, data_env, by="plot_id")

# Calculate volume (using simplified formula)
# V = BA * H * form_factor (assuming 0.5)
data_trees_env_merged$volume <- data_trees_env_merged$ba * data_trees_env_merged$height_m * 0.5

# Some summary stats
summary(data_trees_env_merged$volume)

# Calculate per-plot summaries (THIS PART IS CRITICAL!)
PlotSummary <- aggregate(cbind(dbh_cm, height_m, volume) ~ plot_id, data=data_trees_env_merged, FUN=mean)
PlotSummary$Tree_Count <- aggregate(dbh_cm ~ plot_id, data=data_trees_env_merged, FUN=length)$dbh_cm

print(PlotSummary)

# Save results
write.csv(data_trees_env_merged, (here::here("Output/forest_data_processed.csv")), row.names=F)
write.csv(PlotSummary, (here::here("Output/plot_summary_stats.csv")))

# VISUALIZATION (TO BE IMPROVED)
plot(trees$dbh_cm, trees$height_m)

print("Analysis complete!")
