# OWNER: student C
# Estimates the arm difference in score, adjusted for age and sex.

model_visits <- function(d) {
  lm(score ~ arm + age + sex, data = d)
}

model_table <- function(fit) {
  co <- summary(fit)$coefficients
  ci <- confint(fit)

  data.frame(
    term      = rownames(co),
    estimate  = round(co[, "Estimate"], 2),
    ci_low    = round(ci[, 1], 2),
    ci_high   = round(ci[, 2], 2),
    p_value   = signif(co[, "Pr(>|t|)"], 3),
    row.names = NULL
  )
}
