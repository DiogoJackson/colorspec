#' @title Spectral Data Processing
#'
#' @description This function converts spectral data to an `rspec` object, normalizes reflectance values,
#' corrects negative values, and applies smoothing. It utilizes functions from the 'pavo' package
#' for spectral data preprocessing.
#'
#' For further details, see the `procspec()` and `as.rspec()` functions from the 'pavo' package.
#'
#' @param rspecdata A data frame, possibly of class `rspec`, containing a 'wl' column with wavelength range
#' information and spectral data in the remaining columns.
#'
#' @examples
#' data(leptodactyla)
#' refletancias <- fixspec(leptodactyla)
#'
#'@return fixed spectra
#'
#' @export
fixspec <- function(rspecdata){

  reflet <- pavo::procspec(rspecdata, opt = 'smooth',fixneg = 'addmin',span = 0.25, bins = 5)
  reflet <- pavo::as.rspec(reflet,lim=c(300,700))

  print(reflet)
}
