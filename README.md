
<!-- README.md is generated from README.Rmd. Please edit that file -->

# PDF.extractor

<!-- badges: start -->
<!-- badges: end -->

The goal of PDF.extractor is to …

## Installation

You can install the development version of PDF.extractor from
[GitHub](https://github.com/) with:

``` r
# install.packages("devtools")
devtools::install_github("sabrina-xie/PDF.extractor")
```

## Example

To extract a single case narrative, define the filepath of the relevant
PDF, which can then be used as an input to case\_narrative(). The
function will extract each paragraph as a column in a dataframe.

``` r
library(PDF.extractor)

# define filepath
filepath <- "~/OneDrive - New York State Office of Information Technology Services/Rscripts/PDF.extractor/inst/R2105522 Summary NYS DEC LCI.pdf"

# run case_narrative()
df <- case_narrative(filepath)
```
