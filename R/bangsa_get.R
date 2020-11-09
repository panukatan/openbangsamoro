################################################################################
#
#'
#' List files and folders within the OpenBangsamoro Google Drive database
#'
#' A convenience wrapper to [googledrive] functions set to specifically access
#' the OpenBangsamoro Google Drive database and list files and folders within.
#'
#' @param id Character vector of the OpenBangsamoro **Google Drive** id. This is
#'   currently set to *1W8JV4hth_gs1V6efb92HMz0eU2LRYbOO*
#'
#' @return A tibble of names and ids of files and folders within the the
#'   OpenBangsamoro Google Drive
#'
#' @author Ernest Guevarra
#'
#' @examples
#' bangsa_ls()
#'
#' @export
#'
#
################################################################################

bangsa_ls <- function(id = "1W8JV4hth_gs1V6efb92HMz0eU2LRYbOO") {
  ## Google Drive deauthorisation
  googledrive::drive_deauth()

  ## List files and folders inside OpenBangsa
  x <- googledrive::drive_ls(googledrive::drive_get(id = id))

  ## Return x
  return(x)
}







