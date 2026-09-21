# penguin-clinic

Example project for the git / GitHub tutorial. **All data are simulated.**

## Who owns what

Each person owns one file, so we almost never edit the same lines:

| File | Owner |
|------|-------|
| `R/01-clean.R` | student A |
| `R/02-describe.R` | student B |
| `R/03-model.R` | student C |
| `report.qmd` — *Interpretation* section | everyone (expect conflicts here) |

## How to run it

Open `penguin-clinic.Rproj` in RStudio, then:

```r
quarto::quarto_render("report.qmd")
```

or from a terminal: `quarto render report.qmd`

To regenerate the simulated data: `Rscript data-raw/00-simulate-data.R`

## Rules of the road

1. **Pull before you start working. Push when you stop.**
2. Small commits with messages that say *why*, not *what*.
3. Work on a branch, open a Pull Request, let a teammate merge it.
4. `main` must always render. If it doesn't, fix it before anything else.
5. Never commit data you would not email to a stranger.
