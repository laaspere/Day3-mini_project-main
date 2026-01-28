calc_basal_area <- function(dbh) {
  (dbh/2)^2 * 3.14159
}

calc_volume <- function(dbh, height, form_factor=0.5) {
  ba <- calc_basal_area(dbh)
  volume <- ba * height * form_factor
  return(volume)
}

classify_size <- function(dbh) {
  if(dbh < 30) {
    return("small")
  } else if(dbh < 45) {
    return("medium")
  } else {
    return("large")
  }
}

get_summary_stats <- function(data, column) {
  list(
    mean=mean(data[[column]], na.rm=TRUE),
    median=median(data[[column]], na.rm=TRUE),
    sd=sd(data[[column]], na.rm=TRUE),
    min=min(data[[column]], na.rm=TRUE),
    max=max(data[[column]], na.rm=TRUE)
  )
}

calc_simpson_diversity <- function(species_vector) {
  n <- length(species_vector)
  freqs <- table(species_vector) / n
  D <- 1 - sum(freqs^2)
  return(D)
}

load_and_merge_data <- function(file1, file2, by_column) {
  df1 <- read.csv(file1)
  df2 <- read.csv(file2)
  merged <- merge(df1, df2, by=by_column)
  return(merged)
}
