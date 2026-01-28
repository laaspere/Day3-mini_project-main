# DATA PROCESSING SCRIPT
# Processing forest data

library(dplyr)

# Set working directory
setwd("C:/Users/JohnDoe/Documents/forest_project")

# load data
data=read.csv("forest_inventory_data.csv")

# remove NAs
data=na.omit(data)

# add some columns
data$dbh_class=ifelse(data$dbh_cm<30,"small",ifelse(data$dbh_cm<45,"medium","large"))
data$maturity=ifelse(data$age_years<50,"young",ifelse(data$age_years<80,"mature","old"))

# calculate density (trees per plot)
PlotData=aggregate(tree_species~plot_id,data=data,FUN=length)
names(PlotData)[2]="tree_count"

# add environmental data
env_data=read.csv("environmental_measurements_backup_old.csv")
PlotData=merge(PlotData,env_data,by="plot_id")

# species diversity (Simpson's index - simplified)
calc_diversity=function(x) {
n=length(x)
freqs=table(x)/n
D=1-sum(freqs^2)
return(D)
}

# Calculate diversity per plot
diversity_results=aggregate(tree_species~plot_id,data=data,FUN=calc_diversity)
names(diversity_results)[2]="diversity"

# Merge again
PlotData=merge(PlotData,diversity_results,by="plot_id")

# Categorize plots
PlotData$productivity=ifelse(PlotData$tree_count>2.5,"high","low")

# OVERWRITE THE ORIGINAL FILE (this is the most current version)
write.csv(PlotData,"plot_data_processed.csv",row.names=T)

# Print results
print("Data processing complete")
print(head(PlotData))
