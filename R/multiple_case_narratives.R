#' Multiple case narratives
#'
#' @param folderpath character string of folder path containing only summary files
#'
#' @return data frame
#' @export
#'
#' @examples

multiple_case_narratives <- function(folderpath) {
  list <- list.files(folderpath) #list files in folder
  setwd(folderpath)
  narratives <- lapply(list,case_narrative)
  narratives <- bind_rows(narratives)
  narratives$Sample <- list

  return(narratives)
}
