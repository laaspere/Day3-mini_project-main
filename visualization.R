# Visualization script for forest data
# Creates plots for the analysis

library(ggplot2)
library(dplyr)

# Set path
setwd("C:/Users/JohnDoe/Documents/forest_project")

# Read processed data
trees <- read.csv("forest_data_processed.csv")
plots <- read.csv("plot_data_processed.csv")

# FIGURE 1: DBH vs Height relationship
png("figure1_dbh_height.png", width=800, height=600)
plot(trees$dbh_cm, trees$height_m, main="Tree Dimensions", xlab="DBH (cm)", ylab="Height (m)", col="darkgreen", pch=19)
abline(lm(trees$height_m ~ trees$dbh_cm), col="red", lwd=2)
dev.off()

# FIGURE 2: Species distribution
png("species_barplot.png", width=800, height=600)
barplot(table(trees$tree_species), main="Species Distribution", las=2, col=rainbow(5))
dev.off()

# FIGURE 3: Volume by species
ggplot(trees, aes(x=tree_species, y=volume, fill=tree_species)) + geom_boxplot() + theme_minimal() + labs(title="Tree Volume by Species", x="Species", y="Volume (m³)")
ggsave("volume_by_species.png", width=10, height=6)

# FIGURE 4: Environmental relationships
ggplot(plots, aes(x=temperature_c, y=diversity, color=aspect)) + geom_point(size=3) + geom_smooth(method="lm", se=FALSE) + theme_bw() + labs(title="Diversity vs Temperature")
ggsave("diversity_temperature.png", width=8, height=6)

# FIGURE 5: Age structure
ggplot(trees, aes(x=age_years)) + geom_histogram(bins=15, fill="forestgreen", color="black") + facet_wrap(~tree_species) + theme_minimal()
ggsave("age_structure.png")

# Create summary figure
summary_fig <- ggplot(trees, aes(x=dbh_cm, y=height_m, color=tree_species, size=age_years)) + geom_point(alpha=0.7) + scale_size_continuous(range=c(2,8)) + theme_classic() + labs(title="Forest Structure Overview", x="Diameter (cm)", y="Height (m)", color="Species", size="Age (years)")

ggsave("summary_figure.png", plot=summary_fig, width=12, height=8, dpi=300)

cat("All visualizations created successfully!\n")
cat("Check your working directory for output files\n")
