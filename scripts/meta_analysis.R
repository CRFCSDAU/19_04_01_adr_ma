
  library(readxl)
  library(tidyverse)
  library(metafor)
  library(sjPlot)

# 1.0 Data ------------------------------------------------------------------

# Read in the data from Emma Jennings
  data <- read_excel("data/Database SR (For DD).xlsx", sheet = 2)[1:26, ]

  names(data) <- c(
    "author", "year", "total_n", "adr_n", "pct_adr", "total_n_65", "adr_n_65",
    "pct_adr_65", "only_65", "pct_65", "X", "XX", "XXX", "authorX", "adr_prev"
    )

  data$id <- 1:nrow(data)

  tar <- names(select(data, year:pct_65, -only_65))
  data[tar] <- map(data[tar], as.numeric)

  data$study <- paste0(data$author, " (", data$year, ")")

  data <- filter(data, author != "Tangiisuran* (already subset of 2014)")

  data$author[grepl("Reichel", data$author)] <- "Reichel"

# select(data, id, author, authorX) %>% View()

# What is the difference between adr_prev and pct_adr (in 65s or overall)
# ggplot(data, aes(x = pct_adr_65, y = adr_prev)) + # Same
#   geom_point() +
#   coord_fixed() +
#   geom_abline()
#
# ggplot(data, aes(x = pct_adr, y = adr_prev, color = only_65)) + # Not same
#   geom_point() +
#   coord_fixed() +
#   geom_abline()




# 2.0 Random effects meta analysis model for the entire sample -----------------

# Get effect sizes and variances for each sample
  data <- escalc(measure="PR", xi = adr_n_65, ni = total_n_65, data = data)

# qplot(adr_prev, yi, data = data) # ok#

# Get binomial 95% CI for each sample
  tmp <- t(sapply(split(data, data$id),
                  function(x) binom.test(x$adr_n_65, x$total_n_65)$conf.int))
  data$ci.lb <- tmp[,1]
  data$ci.ub <- tmp[,2]

# RE model for logit xformed proportion
  res <- rma.glmm(measure = "PLO", xi = adr_n_65, ni = total_n_65, data = data)

  pdf("overall_forest.pdf")
  forest(res, slab = data$study, transf = transf.ilogit,
         refline = predict(res, transf = transf.ilogit)$pred)
  dev.off()

  res_fe <- rma.glmm(measure = "PLO", xi = adr_n_65, ni = total_n_65,
                  method = "FE", data = data)

  paste0(
    round(transf.ilogit(res$beta), 2),
    " (",
    round(transf.ilogit(res$ci.lb), 2),
    " to ",
    round(transf.ilogit(res$ci.ub), 2),
    ")"
  )

  # round(transf.ilogit(res$beta), 2)
  # transf.ilogit(-1.4916 + (2*0.2211))
  # transf.ilogit(-1.4916 - (2*0.2211))

# Random effects meta analysis model for the only over65 sample --------------

  data65 <- filter(data, only_65 == "Y")
# Get effect sizes and variances for each sample
  data65 <- escalc(measure="PR", xi = adr_n_65, ni = total_n_65, data = data65)

# qplot(adr_prev, yi, data = data) # ok#

# Get binomial 95% CI for each sample
  tmp <- t(sapply(split(data65, data65$id),
                  function(x) binom.test(x$adr_n_65, x$total_n_65)$conf.int))
  data65$ci.lb <- tmp[,1]
  data65$ci.ub <- tmp[,2]

# RE model for logit xformed proportion
  res <- rma.glmm(measure = "PLO", xi = adr_n_65, ni = total_n_65,
                  data = data65)

  pdf("over65_forest.pdf")
  forest(res, slab = data65$study, transf = transf.ilogit,
         refline = predict(res, transf = transf.ilogit)$pred)
  dev.off()

  res_fe <- rma.glmm(measure = "PLO", xi = adr_n_65, ni = total_n_65,
                     method = "FE", data = data65)

  paste0(
    round(transf.ilogit(res$beta), 2),
    " (",
    round(transf.ilogit(res$ci.lb), 2),
    " to ",
    round(transf.ilogit(res$ci.ub), 2),
    ")"
  )


# Additional -------------------------------------------------------------------

# 1.	Pooled subgroup analysis by study as per ADR definiton employed
# 2.	Pooled subgroup anlaysis by study as per ADR Causality tool employed
# 3.	Comparison of studies where comparable ADR defintion / Causality tools
# were used

# Definitions ------------------------------------------------------------------
  def <- read_excel("data/Subgroup analyses for DD.xlsx", sheet = 1)

  def <- escalc(measure="PR", xi = adr_n, ni = total_n, data = def)
  def$id <- 1:nrow(def)
  def$author <- gsub("\\d", "", def$author)
  def$author <- gsub("[[:blank:]]", "", def$author)
  def$author <- gsub("[[:punct:]]", "", def$author)
  def$group <- relevel(factor(def$group), ref = "WHO")

  def$study <- with(def, paste0(author, "(", year, "; ", ref, ")"))

# Get binomial 95% CI for each sample
  tmp <- t(sapply(split(def, def$id),
                  function(x) binom.test(x$adr_n, x$total_n)$conf.int))
  def$ci.lb <- tmp[,1]
  def$ci.ub <- tmp[,2]

  # RE model for logit xformed proportion
  res <- rma.glmm(measure = "PLO", xi = adr_n, ni = total_n,
                  mods = ~ group, metho = "ML", data = def)

  forest(res, slab = def$study, order = def$group, transf = transf.ilogit,
         refline = predict(res, transf = transf.ilogit)$pred)

# res_fe <- rma.glmm(measure = "PLO", xi = adr_n, ni = total_n,
#                    method = "FE", data = def)

  adrs_bydef <- transf.ilogit(
    c(coef(res)[1],
      coef(res)[1] + coef(res)[2],
      coef(res)[1] + coef(res)[3],
      coef(res)[1] + coef(res)[4],
      coef(res)[1] + coef(res)[5],
      coef(res)[1] + coef(res)[6])
  ) %>% round(2)

  names(adrs_bydef) <- gsub("group", "", names(coef(res)))
  names(adrs_bydef)[1] <- "WHO"

# Causality --------------------------------------------------------------------
  cause <- read_excel("data/Subgroup analyses for DD.xlsx", sheet = 2)

  cause <- escalc(measure="PR", xi = adr_n, ni = total_n, data = cause)
  cause$id <- 1:nrow(cause)
  cause$author <- gsub("\\d", "", cause$author)
  cause$author <- gsub("[[:blank:]]", "", cause$author)
  cause$author <- gsub("[[:punct:]]", "", cause$author)
  cause$group <- relevel(factor(cause$group), ref = "Naranjo")

  cause$study <- with(cause, paste0(author, "(", year, "; ", ref, ")"))

# Get binomial 95% CI for each sample
  tmp <- t(sapply(split(cause, cause$id),
                  function(x) binom.test(x$adr_n, x$total_n)$conf.int))
  cause$ci.lb <- tmp[,1]
  cause$ci.ub <- tmp[,2]

# RE model for logit xformed proportion
  res <- rma.glmm(measure = "PLO", xi = adr_n, ni = total_n,
                  mods = ~ group, method = "ML", data = cause)

  forest(res, slab = cause$study, order = cause$group, transf = transf.ilogit,
         refline = predict(res, transf = transf.ilogit)$pred)

# res_fe <- rma.glmm(measure = "PLO", xi = adr_n, ni = total_n,
#                    method = "FE", data = cause)

  adrs_bycause <- transf.ilogit(
    c(coef(res)[1],
      coef(res)[1] + coef(res)[2],
      coef(res)[1] + coef(res)[3],
      coef(res)[1] + coef(res)[4],
      coef(res)[1] + coef(res)[5])
  ) %>% round(2)

  names(adrs_bycause) <- gsub("group", "", names(coef(res)))
  names(adrs_bycause)[1] <- "Naranjo"

# Match ------------------------------------------------------------------------
  match <- read_excel("data/Subgroup analyses for DD.xlsx", sheet = 3)

  match <- escalc(measure="PR", xi = adr_n, ni = total_n, data = match)
  match$id <- 1:nrow(match)
  match$author <- gsub("\\d", "", match$author)
  match$author <- gsub("[[:blank:]]", "", match$author)
  match$author <- gsub("[[:punct:]]", "", match$author)

  match$study <- with(match, paste0(author, "(", year, "; ", ref, ")"))

  match <- mutate(match, match_type = case_when(
    adr_def == "WHO" & causality == "WHO-UMC" ~ "1",
    adr_def == "WHO" & causality == "Naranjo" ~ "2",
    adr_def == "Edwards & Aronson" & causality == "Naranjo" ~ "3",
  )) %>% arrange(match_type)


  # Get binomial 95% CI for each sample
  tmp <- t(sapply(split(match, match$id),
                  function(x) binom.test(x$adr_n, x$total_n)$conf.int))
  match$ci.lb <- tmp[,1]
  match$ci.ub <- tmp[,2]

  # RE model for logit xformed proportion
  res <- rma.glmm(measure = "PLO", xi = adr_n, ni = total_n, data = match)

  pdf("match_forest.pdf")
  forest(res, slab = match$study, order = match$group, transf = transf.ilogit,
         refline = predict(res, transf = transf.ilogit)$pred)
  dev.off()
  # res_fe <- rma.glmm(measure = "PLO", xi = adr_n, ni = total_n,
  #                    method = "FE", data = match)

  paste0(
    round(transf.ilogit(res$beta), 2),
    " (",
    round(transf.ilogit(res$ci.lb), 2),
    " to ",
    round(transf.ilogit(res$ci.ub), 2),
    ")"
  )

# With moderation

  # RE model for logit xformed proportion
  res <- rma.glmm(measure = "PLO", xi = adr_n, ni = total_n,
                  mods = ~ match_type, method = "ML", data = match)

  # pdf("match_forest.pdf")
  # forest(res, slab = match$study, order = match$group, transf = transf.ilogit,
  #        refline = predict(res, transf = transf.ilogit)$pred)
  # dev.off()
  # res_fe <- rma.glmm(measure = "PLO", xi = adr_n, ni = total_n,
  #                    method = "FE", data = match)


