test_that("case narrative could be extracted", {

  path <- system.file("R2105522 Summary NYS DEC LCI.pdf",package="PDF.extractor")
  out <- case_narrative(path)

  expected <- data.frame(
    stringsAsFactors = FALSE,
    check.names = FALSE,
    `Sample receipt` = c("Twelve water samples were received for analysis at ALS Environmental on 06/03/2021. Any discrepancies upon initial sample, inspection are annotated on the sample receipt and preservation form included within this report. The samples were stored at, minimum in accordance with the analytical method requirements.",
                         NA),
    Metals = c("No significant anomalies were noted with this analysis.",
               NA),
    `General chemistry` = c("Method 353.2, One or more samples were received past the recommended holding time. The customer was notified when the, discrepancy was found and instructed the laboratory to proceed with processing. The analysis was performed as soon as, possible after receipt by the laboratory. The data is flagged to indicate the holding time exceedance.",
                            NA)
  )

  expect_equal(out,expected)
})
