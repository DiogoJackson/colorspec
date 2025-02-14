#' @title Fiddler Crab Visual Modeling
#'
#' @description This function calculates chromatic and achromatic contrast for fiddler crab vision
#' using the Receptor Noise Limited (RNL) model. The visual model parameters are based on Silva et al. (2022)
#' and utilize the 'pavo' package for spectral data processing. This method allows for the quantification
#' of color contrast in Just Noticeable Difference (JND) units, providing insights into the visual perception
#' of fiddler crabs under different lighting conditions.
#'
#' @param rspecdata A dataset, possibly of class `rspec`, containing a 'wl' column with wavelength range information
#' and spectral data in the remaining columns.
#' @param background A column name from `rspecdata` specifying the background reflectance to be used in the RNL model.
#' @param illum The illuminant used in the model. Available options are `"D65"` (standard daylight), `"bluesky"` (clear blue sky),
#' and `"forestshade"` (shaded forest conditions).
#'
#' @examples
#' # Example usage:
#' data(leptodactyla)
#' vis.fiddler(leptodactyla, background = "X00_background", illum = "D65")

#'
#' @examples
#' Example Usage:
#' data(leptodactyla)
#' vis.fiddler(leptodactyla, background = "X00_background", illum = "D65")
#'
#' @export
vis.fiddler <- function(rspecdata, background, illum = c("D65", "bluesky", "forestshade")){

  #vismodel
  #Visual peaks of Leptuca thayeri (https://doi.org/10.1007/s00359-002-0325-7)
  sens <- pavo::sensmodel(c(430, 520), range = c(300, 700))
  sens <- pavo::as.rspec(sens, lim =c(300, 700))

  #weber = 0.12 apis mellifera (doi:10.1093/beheco/arx133)
  #weber.achro = 0.16 Apis mellifera (doi:10.1093/beheco/arx133)
  QI   <- pavo::vismodel(rspecdata, qcatch = "Qi",visual = sens, achromatic = "l",illum = illum,trans = "ideal", scale = 1, relative = FALSE)
  JND  <- pavo::coldist(QI, qcatch = NULL, noise = "neural", subset = background, achro=TRUE, n = c(1, 1), weber.ref='longest', weber = 0.12, weber.achro = 0.16)

  JND2 <- JND %>%
    dplyr::mutate(patch2 = ifelse(patch2 == background, patch1, patch2)) %>%
    dplyr::rename(ID = patch2)%>%
    dplyr::select(-patch1)

  QI2 <- QI %>%
    tibble::rownames_to_column(var = "ID") %>%
    dplyr::filter(ID != background)

  result <- dplyr::left_join(QI2, JND2, by = "ID") %>%
    dplyr::rename(chromatic_contrast = dS,
                  achromatic_contrast = dL,
                  luminance = lum,
                  s = lmax430,
                  m = lmax520) %>%
    dplyr::mutate(vismodel = "Fiddler crab") %>%
    dplyr::mutate(iluminante = illum) %>%
    dplyr::mutate(substrato = background)

  return(result)

}
