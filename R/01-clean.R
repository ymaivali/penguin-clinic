# OWNER: student A
# Reads the raw CSV and returns an analysis-ready data frame.

load_visits <- function(path = "data/clinic_visits.csv") {
  d <- read.csv(path, stringsAsFactors = FALSE)

  d$sex <- factor(d$sex, levels = c("F", "M"))
  d$arm <- factor(d$arm, levels = c("control", "treatment"))

  # Guard rails: fail loudly rather than analysing nonsense.
  stopifnot(
    !anyNA(d$score),
    all(d$age > 0 & d$age < 120)
  )

  d
}
