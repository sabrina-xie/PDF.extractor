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
  setwd(folderpath) #setwd to folder
  narratives <- lapply(list,case_narrative) #apply case_narrative() to each file in folder
  narratives <- dplyr::bind_rows(narratives) #make dataframe
  narratives$Sample <- list #add sample name

  return(narratives)
}
