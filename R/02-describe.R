# OWNER: student B
# Descriptive summaries, one row per arm.

describe_visits <- function(d) {
  agg <- function(f) tapply(d$score, d$arm, f)

  data.frame(
    arm        = levels(d$arm),
    n          = as.integer(table(d$arm)),
    mean_score = round(agg(mean), 2),
    sd_score   = round(agg(sd), 2),
    mean_age   = round(tapply(d$age, d$arm, mean), 1),
    row.names  = NULL
  )
}

# Same summary, split by sex as well as arm. Used in the Descriptives
# section of report.qmd.
describe_by_sex <- function(d) {
  out <- aggregate(score ~ arm + sex, data = d, FUN = function(x) {
    c(n = length(x), mean = mean(x), sd = sd(x))
  })

  data.frame(
    arm        = out$arm,
    sex        = out$sex,
    n          = as.integer(out$score[, "n"]),
    mean_score = round(out$score[, "mean"], 2),
    sd_score   = round(out$score[, "sd"], 2)
  )
}
