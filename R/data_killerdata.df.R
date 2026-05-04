#' Read yeast strain killer data
#'
#' Loads strain killer activity data from **strain_killerdata.csv**, containing
#' strain identifiers, killer activity with respect to 12 test strains, and KHR
#' and KHS status
#'
#' @param path Optional path override.
#'
#' @return A tibble with columns:
#' \describe{
#'   \item{std_name}{Strain identifier (character)}
#'   \item{Collection}{Collection from which strain is sourced (factor)}
#'   \item{Killer}{Strain is a killer (logical)}
#'   \item{Only_Y_2046}{Strain is not a killer, kills hypersusceptible strain Y-2046 only (logical)}
#'   \item{Y_2046}{Strain kills Y-2046 (logical)}
#'   \item{Y_1088}{Strain kills Y-1088 (logical)}
#'   \item{DSM70459}{Strain kills DSM70459 (logical)}
#'   \item{CYC1058}{Strain kills CYC1058 (logical)}
#'   \item{Y-27106}{Strain kills Y-27106 (logical)}
#'   \item{NCYC1006}{Strain kills NCYC1006 (logical)}
#'   \item{NCYC777}{Strain kills NCYC777 (logical)}
#'   \item{NBRC1802}{Strain kills NBRC1802 (logical)}
#'   \item{NBRC815}{Strain kills NBRC815 (logical)}
#'   \item{Y_5509}{Strain kills Y-5509 (logical)}
#'   \item{MS300c}{Strain kills MS300c (logical)}
#'   \item{BY4741}{Strain kills BY4741 (logical)}
#'   \item{KHR}{KHR1 gene status (factor)}
#'   \item{KHS}{KHS1 gene status (factor)}
#'   \item{Func_KHR}{Functional KHR protein (logical)}
#'   \item{Func_KHS}{Functional KHS protein (logical)}
#' }
#'
#' @export
read_killerdata.df <- function(
    path = system.file("extdata", "strain_killerdata.csv", package = "yeastvirome")
) {
  if (!file.exists(path) || path == "") {
    stop("Missing file: strain_killerdata.csv")
  }

  df <- readr::read_csv(
    file = path,
    col_types = readr::cols(
      std_name            = readr::col_character(),
      Collection          = readr::col_factor(),
      Y_2046              = readr::col_logical(),
      Y_1088              = readr::col_logical(),
      DSM70459            = readr::col_logical(),
      CYC1058             = readr::col_logical(),
      Y_27106             = readr::col_logical(),
      NCYC1006            = readr::col_logical(),
      NCYC777             = readr::col_logical(),
      NBRC1802            = readr::col_logical(),
      NBRC815             = readr::col_logical(),
      Y_5509              = readr::col_logical(),
      MS300c              = readr::col_logical(),
      BY4741              = readr::col_logical(),
      Killer              = readr::col_logical(),
      Killer_Y_2046       = readr::col_logical(),
      Only_Y_2046         = readr::col_logical(),
      KHR                 = readr::col_factor(),
      KHS                 = readr::col_factor(),
      Func_KHR            = readr::col_logical(),
      Func_KHS            = readr::col_logical()
    ),
    na = c("", "NA", "NaN", "no data", "-"),
    show_col_types = FALSE,
    progress = FALSE
  ) %>%
    dplyr::select(std_name, Collection, Killer, Only_Y_2046, everything(), -Killer_Y_2046)

  required_cols <- c("std_name", "Killer")
  missing_cols <- setdiff(required_cols, names(df))
  if (length(missing_cols)) {
    stop("Missing required columns: ", paste(missing_cols, collapse = ", "))
  }

  return(df)
}

#' Yeast strain killer activity data (preloaded)
#'
#' Contains killer activity data for yeast strains.
#'
#' @seealso \code{\link{read_killerdata.df}}
#'
#' @format A tibble with columns:
#' \describe{
#'   \item{std_name}{Strain identifier (character)}
#'   \item{Collection}{Collection from which strain is sourced (factor)}
#'   \item{Killer}{Strain is a killer (logical)}
#'   \item{Only_Y_2046}{Strain is not a killer, kills Y-2046 only (logical)}
#'   \item{Y_2046}{Strain kills Y-2046 (logical)}
#'   \item{Y_1088}{Strain kills Y-1088 (logical)}
#'   \item{DSM70459}{Strain kills DSM70459 (logical)}
#'   \item{CYC1058}{Strain kills CYC1058 (logical)}
#'   \item{Y-27106}{Strain kills Y-27106 (logical)}
#'   \item{NCYC1006}{Strain kills NCYC1006 (logical)}
#'   \item{NCYC777}{Strain kills NCYC777 (logical)}
#'   \item{NBRC1802}{Strain kills NBRC1802 (logical)}
#'   \item{NBRC815}{Strain kills NBRC815 (logical)}
#'   \item{Y_5509}{Strain kills Y-5509 (logical)}
#'   \item{MS300c}{Strain kills MS300c (logical)}
#'   \item{BY4741}{Strain kills BY4741 (logical)}
#'   \item{KHR}{KHR1 gene status (factor)}
#'   \item{KHS}{KHS1 gene status (factor)}
#'   \item{Func_KHR}{Functional KHR protein (logical)}
#'   \item{Func_KHS}{Functional KHS protein (logical)}
#' }
#'
#' @export
killerdata.df <- NULL
