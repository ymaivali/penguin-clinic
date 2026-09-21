# Generates data/clinic_visits.csv
#
# THIS IS SYNTHETIC DATA. No real people, no real clinic, no real effects.
# It exists so the git tutorial has something to analyse. Do not interpret
# any number produced from it as an empirical finding.

set.seed(2026)

n <- 120

dat <- data.frame(
  id        = sprintf("P%03d", seq_len(n)),
  age       = round(rnorm(n, mean = 54, sd = 12)),
  sex       = sample(c("F", "M"), n, replace = TRUE),
  arm       = rep(c("control", "treatment"), each = n / 2),
  weeks     = sample(4:12, n, replace = TRUE)
)

# Outcome is simulated with a deliberate, known arm effect of -4 units,
# so students can check that their model recovers roughly that number.
dat$score <- round(
  60 +
    -0.15 * (dat$age - 54) +
    ifelse(dat$arm == "treatment", -4, 0) +
    rnorm(n, sd = 6),
  1
)

dir.create("data", showWarnings = FALSE)
write.csv(dat, "data/clinic_visits.csv", row.names = FALSE)

cat("Wrote data/clinic_visits.csv:", nrow(dat), "rows\n")
