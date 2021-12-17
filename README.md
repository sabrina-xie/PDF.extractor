
<!-- README.md is generated from README.Rmd. Please edit that file -->

# PDF.extractor

<!-- badges: start -->
<!-- badges: end -->

The goal of PDF.extractor is to automate the reading of PDF lab reports
by extracting relevant text into a more readable and searchable
dataframe or .csv file.

## Installation

You can install the development version of PDF.extractor from
[GitHub](https://github.com/) with:

``` r
# install.packages("devtools")
devtools::install_github("sabrina-xie/PDF.extractor")
```

## Required packages

-   pdftools:
    <https://cran.r-project.org/web/packages/pdftools/index.html>
-   stringr: <https://stringr.tidyverse.org>
-   dplyr: <https://dplyr.tidyverse.org>

## Examples

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

    #> -------------------------------------------------------------------------------
    #>  Sample receipt            Metals                    General chemistry         
    #> -------------------------- ------------------------- --------------------------
    #>  Twelve water samples were No significant anomalies  Method 353.2, One or more 
    #>  received for analysis at  were noted with this      samples were received     
    #>  ALS Environmental on      analysis.                 past the recommended      
    #>  06/03/2021. Any                                     holding time. The         
    #>  discrepancies upon                                  customer was notified     
    #>  initial sample,                                     when the, discrepancy was 
    #>  inspection are annotated                            found and instructed the  
    #>  on the sample receipt and                           laboratory to proceed     
    #>  preservation form                                   with processing. The      
    #>  included within this                                analysis was performed as 
    #>  report. The samples were                            soon as, possible after   
    #>  stored at, minimum in                               receipt by the            
    #>  accordance with the                                 laboratory. The data is   
    #>  analytical method                                   flagged to indicate the   
    #>  requirements.                                       holding time exceedance.  
    #> -------------------------------------------------------------------------------

To extract multiple case narrative, define the filepath of a folder
containing only the relevant PDFs, which can then be used as an input to
multiple\_case\_narratives(). The function will extract each paragraph
as a column and each sample as a row in a dataframe.

``` r
library(PDF.extractor)

# define filepath
folderpath <- "/Users/sabrinaxie/OneDrive - New York State Office of Information Technology Services/OneDrive_1_12-16-2021"

# run case_narrative()
df <- multiple_case_narratives(folderpath)
```

    #> -----------------------------------------------------------------------------
    #>  Sample receipt     Metals             General chemistry  Sample             
    #> ------------------- ------------------ ------------------ -------------------
    #>  Six water samples  No significant     Method 351.2: One  R2104684           
    #>  were received for  anomalies were     or more samples    Summary.pdf        
    #>  analysis at ALS    noted with this    were received with                    
    #>  Environmental on   analysis.          insufficient hold                     
    #>  05/13/2021. Any                       time remaining to                     
    #>  discrepancies upon                    complete the                          
    #>  initial sample,                       analysis within                       
    #>  inspection are                        the, recommended                      
    #>  annotated on the                      limit. The                            
    #>  sample receipt and                    analysis was                          
    #>  preservation form                     performed as soon                     
    #>  included within                       as possible after                     
    #>  this report. The                      receipt by the                        
    #>  samples were                          laboratory. The                       
    #>  stored at, minimum                    data is flagged                       
    #>  in accordance with                    to, indicate the                      
    #>  the analytical                        holding time                          
    #>  method                                exceedance.,                          
    #>  requirements.                         Method SM 2120                        
    #>                                        B-2001(2011), One                     
    #>                                        or more samples                       
    #>                                        were received past                    
    #>                                        the recommended                       
    #>                                        holding time. The                     
    #>                                        customer was,                         
    #>                                        notified when the                     
    #>                                        discrepancy was                       
    #>                                        found and                             
    #>                                        instructed the                        
    #>                                        laboratory to                         
    #>                                        proceed with                          
    #>                                        processing. The                       
    #>                                        analysis was                          
    #>                                        performed, as soon                    
    #>                                        as possible after                     
    #>                                        receipt by the                        
    #>                                        laboratory. The                       
    #>                                        data is flagged to                    
    #>                                        indicate the                          
    #>                                        holding time                          
    #>                                        exceedance.                           
    #>                                                                              
    #>  Twelve water       No significant     Method 353.2, One  R2105522 Summary   
    #>  samples were       anomalies were     or more samples    NYS DEC LCI.pdf    
    #>  received for       noted with this    were received past                    
    #>  analysis at ALS    analysis.          the recommended                       
    #>  Environmental on                      holding time. The                     
    #>  06/03/2021. Any                       customer was                          
    #>  discrepancies upon                    notified when the,                    
    #>  initial sample,                       discrepancy was                       
    #>  inspection are                        found and                             
    #>  annotated on the                      instructed the                        
    #>  sample receipt and                    laboratory to                         
    #>  preservation form                     proceed with                          
    #>  included within                       processing. The                       
    #>  this report. The                      analysis was                          
    #>  samples were                          performed as soon                     
    #>  stored at, minimum                    as, possible after                    
    #>  in accordance with                    receipt by the                        
    #>  the analytical                        laboratory. The                       
    #>  method                                data is flagged to                    
    #>  requirements.                         indicate the                          
    #>                                        holding time                          
    #>                                        exceedance.                           
    #>                                                                              
    #>  Twenty eight water No significant     Method 353.2, One  R2105834 Summary   
    #>  samples were       anomalies were     or more samples    NYS DEC LCI.pdf    
    #>  received for       noted with this    were received past                    
    #>  analysis at ALS    analysis.          the recommended                       
    #>  Environmental on                      holding time. The                     
    #>  06/10/2021. Any                       customer was                          
    #>  discrepancies upon                    notified when the,                    
    #>  initial, sample                       discrepancy was                       
    #>  inspection are                        found and                             
    #>  annotated on the                      instructed the                        
    #>  sample receipt and                    laboratory to                         
    #>  preservation form                     proceed with                          
    #>  included within                       processing. The                       
    #>  this report. The                      analysis was                          
    #>  samples were,                         performed as soon                     
    #>  stored at minimum                     as, possible after                    
    #>  in accordance with                    receipt by the                        
    #>  the analytical                        laboratory. The                       
    #>  method                                data is flagged to                    
    #>  requirements.                         indicate the                          
    #>                                        holding time                          
    #>                                        exceedance.,                          
    #>                                        Method SM 2120                        
    #>                                        B-2001(2011), One                     
    #>                                        or more samples                       
    #>                                        were received past                    
    #>                                        the recommended                       
    #>                                        holding time. The                     
    #>                                        customer was,                         
    #>                                        notified when the                     
    #>                                        discrepancy was                       
    #>                                        found and                             
    #>                                        instructed the                        
    #>                                        laboratory to                         
    #>                                        proceed with                          
    #>                                        processing. The                       
    #>                                        analysis was                          
    #>                                        performed, as soon                    
    #>                                        as possible after                     
    #>                                        receipt by the                        
    #>                                        laboratory. The                       
    #>                                        data is flagged to                    
    #>                                        indicate the                          
    #>                                        holding time                          
    #>                                        exceedance.                           
    #>                                                                              
    #>  Eighteen water     No significant     No significant     R2105911 Summary   
    #>  samples were       anomalies were     anomalies were     NYS DEC LCI.pdf    
    #>  received for       noted with this    noted with this                       
    #>  analysis at ALS    analysis.          analysis.                             
    #>  Environmental on                                                            
    #>  06/15/2021. Any                                                             
    #>  discrepancies upon                                                          
    #>  initial sample,                                                             
    #>  inspection are                                                              
    #>  annotated on the                                                            
    #>  sample receipt and                                                          
    #>  preservation form                                                           
    #>  included within                                                             
    #>  this report. The                                                            
    #>  samples were                                                                
    #>  stored at, minimum                                                          
    #>  in accordance with                                                          
    #>  the analytical                                                              
    #>  method                                                                      
    #>  requirements.                                                               
    #>                                                                              
    #>  Fourteen water     Method 200.8,      Method 353.2, One  R2105965 Summary   
    #>  samples were       06/22/2021,        or more samples    NYS DEC LCI.pdf    
    #>  received for       R2105965-007: The  were received past                    
    #>  analysis at ALS    upper control      the recommended                       
    #>  Environmental on   limit was exceeded holding time. The                     
    #>  06/16/2021 -       for the internal   customer was                          
    #>  06/17/2021. Any    standard recovery  notified when the,                    
    #>  discrepancies      associated, with   discrepancy was                       
    #>  upon, initial      Arsenic. The field found and                             
    #>  sample inspection  sample did not     instructed the                        
    #>  are annotated on   contain the        laboratory to                         
    #>  the sample receipt analyte(s) in      proceed with                          
    #>  and preservation   question and the   processing. The                       
    #>  form included      Matrix Spike (MS)  analysis was                          
    #>  within this        and Matrix Spike   performed as soon                     
    #>  report. The        Duplicate, (MSD)   as, possible after                    
    #>  samples, were      for the sample are receipt by the                        
    #>  stored at minimum  within limits.     laboratory. The                       
    #>  in accordance with Since the Serial   data is flagged to                    
    #>  the analytical     Dilution confirms  indicate the                          
    #>  method             a non-detect in    holding time                          
    #>  requirements.      sample data        exceedance., ,                        
    #>                     quality was not    Method 353.2: One                     
    #>                     significantly,     or more samples                       
    #>                     affected therefore were received with                    
    #>                     was reported.      insufficient hold                     
    #>                                        time remaining to                     
    #>                                        complete the                          
    #>                                        analysis within                       
    #>                                        the, recommended                      
    #>                                        limit. The                            
    #>                                        analysis was                          
    #>                                        performed as soon                     
    #>                                        as possible after                     
    #>                                        receipt by the                        
    #>                                        laboratory. The                       
    #>                                        data is flagged                       
    #>                                        to, indicate the                      
    #>                                        holding time                          
    #>                                        exceedance., ,                        
    #>                                        Method SM 2120                        
    #>                                        B-2001(2011): One                     
    #>                                        or more samples                       
    #>                                        were received with                    
    #>                                        insufficient hold                     
    #>                                        time remaining to                     
    #>                                        complete the,                         
    #>                                        analysis within                       
    #>                                        the recommended                       
    #>                                        limit. The                            
    #>                                        analysis was                          
    #>                                        performed as soon                     
    #>                                        as possible after                     
    #>                                        receipt by the                        
    #>                                        laboratory. The,                      
    #>                                        data is flagged to                    
    #>                                        indicate the                          
    #>                                        holding time                          
    #>                                        exceedance.,                          
    #>                                        Method SM 5910 B:                     
    #>                                        One or more                           
    #>                                        samples were                          
    #>                                        received with                         
    #>                                        insufficient hold                     
    #>                                        time remaining to                     
    #>                                        complete the                          
    #>                                        analysis within                       
    #>                                        the, recommended                      
    #>                                        limit. The                            
    #>                                        analysis was                          
    #>                                        performed as soon                     
    #>                                        as possible after                     
    #>                                        receipt by the                        
    #>                                        laboratory. The                       
    #>                                        data is flagged                       
    #>                                        to, indicate the                      
    #>                                        holding time                          
    #>                                        exceedance.                           
    #> -----------------------------------------------------------------------------
