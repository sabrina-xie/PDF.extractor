#' Case narrative
#'
#' @param filepath character string of file path
#'
#' @return data frame
#' @export
#'
#' @examples

case_narrative <- function(filepath) {

  pdf.file <- filepath #create filename
  pdf.text <- pdftools::pdf_text(pdf.file) #convert to text

  pdf.text.str<-unlist(pdf.text) #unlist text

  res <- data.frame(stringr::str_detect(pdf.text.str,"CASE NARRATIVE")) #find page
  page <- as.numeric(row.names(subset(res,res[,1]==TRUE))) #save page number

  pdf.text.page <- strsplit(pdf.text[[page]], "\n") #split string by new lines
  pdf.text.page <- head(pdf.text.page)

  df <- data.frame(matrix(unlist(pdf.text.page))) #create dataframe with each line of text as a row

  sample.receipt.row <- which(stringr::str_detect(df[,1],"Sample Receipt\\:")) #find paragraph on sample receipt
  metals.row <- which(stringr::str_detect(df[,1],"Metals\\:")) #find paragraph on metals
  gen.chem.row <- which(stringr::str_detect(df[,1],"General Chemistry\\:")) #find paragraph on general chemistry
  end.row <- max(which(stringr::str_detect(df[,1],"\\."))) #find last row

  df.receipt <- data.frame(df[(sample.receipt.row+1):(metals.row-1),]) #subset dataframe to sample receipt section
  df.metals <- data.frame(df[(metals.row+1):(gen.chem.row-1),]) #subset dataframe to metals section
  df.gen.chem <- data.frame(df[(gen.chem.row+1):(end.row),]) #subset dataframe to general chemistry section

  df <- data.frame("Sample receipt"=toString(df.receipt$df..sample.receipt.row...1...metals.row...1....), #concatenate all the rows into one string
                   "Metals"=toString(df.metals$df..metals.row...1...gen.chem.row...1....),
                   "General chemistry"=toString(df.gen.chem$df..gen.chem.row...1...end.row....))
  names(df) <- c("Sample receipt","Metals","General chemistry")

  return(df)
}
