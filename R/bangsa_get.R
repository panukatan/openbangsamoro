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
#' @rdname bangsa_ls
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


################################################################################
#
#'
#' @rdname bangsa_ls
#' @export
#'
#
################################################################################

bangsa_ls_geodata <- function(recursive = FALSE) {
  ## Get id
  id = bangsa_ls()$id[bangsa_ls()$name == "1-Geodata"]

  ## Google Drive deauthorisation
  googledrive::drive_deauth()

  ## Get id
  x <- bangsa_ls(id = id, recursive = recursive)

  ## Return x
  x
}


################################################################################
#
#'
#' @rdname bangsa_ls
#' @export
#'
#
################################################################################

bangsa_ls_tabular <- function(id = bangsa_ls()$id[bangsa_ls()$name == "2-Tabular Data"]) {
  ## Google Drive deauthorisation
  googledrive::drive_deauth()

  ## Get id
  x <- bangsa_ls(id = id)

  ## Return x
  return(x)
}


################################################################################
#
#'
#' @rdname bangsa_ls
#' @export
#'
#
################################################################################

bangsa_ls_docs <- function(id = bangsa_ls()$id[bangsa_ls()$name == "3-Development Plans, Studies, and Reports"]) {
  ## Google Drive deauthorisation
  googledrive::drive_deauth()

  ## Get id
  x <- bangsa_ls(id = id)

  ## Return x
  return(x)
}


################################################################################
#
#'
#' Get the OpenBangsamoro Database inventory
#'
#' @param dataset A string value from either `"geospatial"`, `"tabular"`, or
#'   `"docs"` specifying the inventory to retrieve.
#'
#' @return A tibble of the specified inventory of various datasets available in
#'   the OpenBangsamoro Database.
#'
#' @author Ernest Guevarra
#'
#' @examples
#' ## Retrieve the geospatial datasets inventory
#' bangsa_get_inventory(dataset = "geospatial")
#'
#' @export
#'
#
################################################################################

bangsa_get_inventory <- function(dataset = c("geospatial", "tabular",
                                             "docs", "metadata")) {
  ## googlesheets deauthorise
  googlesheets4::gs4_deauth()

  ## Define dataset argument
  dataset <- match.arg(dataset)

  sheet <- switch(
    EXPR = dataset, geospatial = 1, tabular = 2, docs = 3, metadata = 4
  )

  ## Read the specified inventory
  x <- googlesheets4::read_sheet(
    ss = "1599Dm3Csc1p328Y4HPgiVDSh3KAJi18rzVd5VXojm9Q", sheet = sheet,
    skip = ifelse(sheet == 4, 1, 0)
  )

  ## Return x
  x
}


################################################################################
#
#'
#' Get the OpenBangsamoro Database metadata
#'
#' @return A tibble containing metadata information regarding the
#'   OpenBangsamoro Database.
#'
#' @author Ernest Guevarra
#'
#' @examples
#' bangsa_get_metadata()
#'
#' @export
#'
#
################################################################################

bangsa_get_metadata <- function() {
  ## googlesheets deauthorise
  googlesheets4::gs4_deauth()

  ## Read the specified inventory
  x <- googlesheets4::read_sheet(
    ss = "1599Dm3Csc1p328Y4HPgiVDSh3KAJi18rzVd5VXojm9Q",
    sheet = "Metadata", skip = 1
  )

  ## Return x
  return(x)
}


