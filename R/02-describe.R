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
