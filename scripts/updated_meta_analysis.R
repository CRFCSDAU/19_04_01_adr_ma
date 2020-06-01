

  load("data.RData")

# 1.0 Random effects meta analysis model for the entire sample -----------------

# Get effect sizes and variances for each sample
  data <- escalc(measure = "PR", xi = adr_n_65, ni = total_n_65, data = data)

# qplot(pct_adr_65, yi, data = data) # ok#

# Get binomial 95% CI for each sample
  tmp <- t(sapply(split(data, data$id),
                  function(x) binom.test(x$adr_n_65, x$total_n_65)$conf.int))
  data$ci.lb <- tmp[, 1]
  data$ci.ub <- tmp[, 2]

# RE model for logit xformed proportion
  res_glmm <- rma.glmm(
    measure = "PLO", xi = adr_n_65, ni = total_n_65, data = data
    )

# res <- rma(measure = "PLO", xi = adr_n_65, ni = total_n_65, data = data)

# pdf("plots/update/overall_forest.pdf")
# forest(res, slab = data$study, transf = transf.ilogit,
#        refline = predict(res, transf = transf.ilogit)$pred)
# dev.off()

# Fixed effects - Don't need
# res_fe <- rma.glmm(measure = "PLO", xi = adr_n_65, ni = total_n_65,
#               method = "FE", data = data)
# FE and RE way off. RE doesn't seem to weight the single study.

# IVhet
# res_ivhet <- rma(measure = "PLO", xi = adr_n_65, ni = total_n_65,
#                  data = data, weights = 1/vi)

# AMhet
# res_amhet <- rma(measure = "PLO", xi = adr_n_65, ni = total_n_65,
#                  data = data, method = "DL", weights = 1)

# Mean of all study adr proportions (irrespective of sample size)
# mean(data$pct_adr_65) / 100

# Total adrs across all samples, divided by total sample size.
# sum(data$adr_n_65) / sum(data$total_n_65)

# Get est and CI
# predict(res, transf = transf.ilogit)
# predict(res_glmm, transf = transf.ilogit)
# predict(res_fe, transf = transf.ilogit)
# predict(res_ivhet, transf = transf.ilogit)
# predict(res_amhet, transf = transf.ilogit)


# paste0(
#   round(transf.ilogit(res$beta), 2),
#   " (",
#   round(transf.ilogit(res$ci.lb), 2),
#   " to ",
#   round(transf.ilogit(res$ci.ub), 2),
#   ")"
# )

# Fancy plot

### decrease margins so the full space is used
  par(mar = c(4, 4, 1, 2))

### fit random-effects model (use slab argument to define study labels)
### see above

### set up forest plot (with 2x2 table counts added; rows argument is used
### to specify exactly in which rows the outcomes will be plotted)
  pdf("plots/update/overall_forest.pdf")

  forest(
    res_glmm,
    addcred = TRUE,
    xlim = c(-1, 1.2),
    # at = log(c(0.05, 0.25, 1, 4)),
    transf = transf.ilogit,
    # atransf = transf.ilogit,
    ilab = cbind(data$total_n_65, data$adr_n_65),
    ilab.xpos = c(-0.3, -0.1),
    cex = 0.75,
    ylim = c(-3, 29),
    order = order(data$year),
    # rows = c(3:4, 9:15, 20:23),
    xlab = "Proportion",
    mlab = "",
   # psize = 2,
    header = "Author and Year",
    slab = data$study,
    refline = predict(res_glmm, transf = transf.ilogit)$pred
    )

  text(c(-0.3, -0.1), 28, c("Total n", "ADR n"), cex = 0.75)

  text(-1, -1, pos = 4, cex = 0.75, "RE Model for All Studies")

  txt <- paste0(
    "QE(LRT) = ", round(res_glmm$QE.LRT, digits = 2),
    ", df = ", (res_glmm$k - res_glmm$p),
    ifelse(
      res_glmm$QEp.LRT < 0.001, ", p < 0.001", round(res_glmm$QEp.LRT, digits = 2)
    )
  )
  text(-1, -2, pos = 4, cex = 0.75, txt)

  txt <- paste0(
    "I^2 = ", round(res_glmm$I2, digits = 1),
    "%; tau^2 = ", round(res_glmm$tau2, digits = 2)
  )
  text(-1, -3, pos = 4, cex = 0.75, txt)

  dev.off()


# 3.0 Old vs new ####

# RE model for logit xformed proportion
  res_oldnew <- rma.glmm(measure = "PLO", xi = adr_n_65, ni = total_n_65,
                    mods = ~ 1 + old_vs_new, data = data)

  predict(res_oldnew, transf = transf.ilogit)

  forest(
    res_oldnew,
    addcred = TRUE,
    xlim = c(-1, 1.2),
    # at = log(c(0.05, 0.25, 1, 4)),
    transf = transf.ilogit,
    # atransf = transf.ilogit,
    ilab = cbind(data$total_n_65, data$adr_n_65),
    ilab.xpos = c(-0.3, -0.1),
    cex = 0.75,
    ylim = c(-3, 33),
    order = order(data$old_vs_new),
    rows = c(1:25, 28),
    xlab = "Proportion",
    mlab = "",
    # psize = 2,
    header = "Author and Year",
    slab = data$study
  )










### set font expansion factor (as in forest() above) and use bold italic
### font and save original settings in object 'op'
op <- par(cex=0.75, font=4)

### add text for the subgroups
text(-16, c(24,16,5), pos=4, c("Systematic Allocation",
                               "Random Allocation",
                               "Alternate Allocation"))

### switch to bold font
par(font=2)



### set par back to the original settings
par(op)

### fit random-effects model in the three subgroups
res.s <- rma(ai=tpos, bi=tneg, ci=cpos, di=cneg, data=dat.bcg, measure="RR",
             subset=(alloc=="systematic"), method="REML")
res.r <- rma(ai=tpos, bi=tneg, ci=cpos, di=cneg, data=dat.bcg, measure="RR",
             subset=(alloc=="random"), method="REML")
res.a <- rma(ai=tpos, bi=tneg, ci=cpos, di=cneg, data=dat.bcg, measure="RR",
             subset=(alloc=="alternate"), method="REML")

### add summary polygons for the three subgroups
addpoly(res.s, row=18.5, cex=0.75, atransf=exp, mlab="")
addpoly(res.r, row= 7.5, cex=0.75, atransf=exp, mlab="")
addpoly(res.a, row= 1.5, cex=0.75, atransf=exp, mlab="")

### add text with Q-value, dfs, p-value, and I^2 statistic for subgroups
text(-16, 18.5, pos=4, cex=0.75, bquote(paste("RE Model for Subgroup (Q = ",
                                              .(formatC(res.s$QE, digits=2, format="f")), ", df = ", .(res.s$k - res.s$p),
                                              ", p = ", .(formatC(res.s$QEp, digits=2, format="f")), "; ", I^2, " = ",
                                              .(formatC(res.s$I2, digits=1, format="f")), "%)")))
text(-16, 7.5, pos=4, cex=0.75, bquote(paste("RE Model for Subgroup (Q = ",
                                             .(formatC(res.r$QE, digits=2, format="f")), ", df = ", .(res.r$k - res.r$p),
                                             ", p = ", .(formatC(res.r$QEp, digits=2, format="f")), "; ", I^2, " = ",
                                             .(formatC(res.r$I2, digits=1, format="f")), "%)")))
text(-16, 1.5, pos=4, cex=0.75, bquote(paste("RE Model for Subgroup (Q = ",
                                             .(formatC(res.a$QE, digits=2, format="f")), ", df = ", .(res.a$k - res.a$p),
                                             ", p = ", .(formatC(res.a$QEp, digits=2, format="f")), "; ", I^2, " = ",
                                             .(formatC(res.a$I2, digits=1, format="f")), "%)")))

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


