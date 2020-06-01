
  library(readxl)
  library(tidyverse)

# 1.0 Data ------------------------------------------------------------------

# Read in the data from Emma Jennings
  data <- read_excel("data/Database_ADRs SR_DD_2020.xlsx", sheet = 1,
                     na = "-")

  labels <- names(data)

  names(data) <- c(
    "author", "year", "total_n_65", "adr_n_65", "no_adr_n_65", "pct_adr_65",
    "all", "old_vs_new", "all_ages_vs_65_only", "adr_def", "causality",
    "overlap_methods", "adr_id_method", "quality", "incident", "setting"
  )

  map(data, table)

  data$old_vs_new <- factor(
    data$old_vs_new, labels = c("Previous review", "Updated review")
  )

  data$all_ages_vs_65_only <- factor(
    data$all_ages_vs_65_only, labels = c("All ages", "65+ only")
  )

  data$adr_def <- factor(
    data$adr_def,
    labels = c("WHO", "Not documented", "Local policy", "Edwards and Aronson",
               "Bates", "Author defined")
  )

  data$causality <- factor(
    data$causality,
    labels = c("WHO-UMC", "Not documented", "Naranjo", "Kramer", "Hallas")
  )

  data$overlap_methods <- factor(
    data$overlap_methods,
    labels = c(
      "WHO & WHO-UMC", "WHO & Naranjo", "Edwards Aronson & Naranjo",
      "Not documented & Naranjo"
    )
  )

  data$adr_id_method <- factor(
    data$adr_id_method,
    labels = c("Pharmacist", "Physican", "Not documented", "Multi-disciplinary")
  )

  data$quality <- factor(data$quality, labels = c("Low", "High"))

  data$incident <- factor(
    data$incident, labels = c("Not clearly incident", "Clearly incident")
  )

  data$setting <- factor(
    data$setting,
    labels = c(
      "Cardiology", "Dermatology", "Geriatric", "GIM", "ICU" , "Mixed",
      "Not described"
    )
  )

  data$id <- 1:nrow(data)

  data$study <- paste0(data$author, " (", data$year, ")")

  data_liao <- data
  data <- filter(data, author != "Liao")

# Severity ####

  severity <- read_excel("data/Database_ADRs SR_DD_2020.xlsx", sheet = 2,
                         na = "-")

  labels_sev <- names(severity)

  names(severity) <- c(
    "study", "population", "severity_tool", "total_n_65", "adr_n_65", "severe_n", "pct_severe",
    "all", "all_ages_vs_65_only", "by_tool"
  )

  severity$all_ages_vs_65_only <- factor(
    severity$all_ages_vs_65_only, labels = c("All ages", "65+ only")
  )

  severity$id <- 1:nrow(severity)

  severity$severity_tool <- factor(severity$severity_tool)

  severity <- filter(severity, study != "Liao (2019)")



# Preventability ####

  prevent <- read_excel("data/Database_ADRs SR_DD_2020.xlsx", sheet = 3,
                         na = "-")

  labels_prev <- names(prevent)

  names(prevent) <- c(
    "study", "population", "prev_tool", "n_adrs_total", "n_prev_adrs",
    "n_not_prev_adrs", "pct_prev_adrs", "all", "all_ages_vs_65_only"
  )

  prevent$all_ages_vs_65_only <- factor(
    prevent$all_ages_vs_65_only, labels = c("All ages", "65+ only")
  )

  prevent$id <- 1:nrow(prevent)

  prevent$prev_tool <- factor(prevent$prev_tool)




# Save data

  save(data, data_liao, severity, prevent, file = "data/data.RData")