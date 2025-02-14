#' @title Peafowl Visual Model
#'
#' @description This function calculates the quantum catch (Qi), chromatic contrast, and
#' achromatic contrast in Just Noticeable Difference (JND) units for peafowl vision.
#' The visual model parameters are based on Silva et al. (2022) and utilize functions from the 'pavo' package.
#'
#' The function applies the following parameter settings:
#' - `pavo::vismodel(rspecdata, qcatch = "Qi", visual = "pfowl", achromatic = "ch.dc",
#'    illum = "D65", trans = transmit, vonkries = FALSE, scale = 1, relative = FALSE)`
#' - `pavo::coldist(noise = "neural", achro = TRUE, n = c(1,1.9,2.2,2.1), weber.ref = "longest",
#'    weber = 0.1, weber.achro = 0.165)`
#'
#' @param rspecdata A data frame, possibly of class `rspec`, containing a 'wl' column with wavelength range
#' information and spectral data in the remaining columns.
#' @param background A column name indicating which spectral data should be used as the background in the RNL model.
#' @param illum The illuminant to be used in the model. Options include `"D65"`, `"bluesky"`, and `"forestshade"`.
#'
#' @examples
#' #example ## not run
#' data(leptodactyla)
#' leptodactyla <- fixspec(leptodactyla)
#' vis.peafowl <- vis.peafowl(leptodactyla, background = "X00_background", illum = "D65")
#'
#' @export
vis.peafowl <- function(rspecdata, background, illum = c("D65", "bluesky", "forestshade")){

  #vismodel
  #Import transmittance from Hart
  transmit  <- pavo::as.rspec(transmit,lim=c(300,700))

  #weber = 0.1 (Leiotrix lutea) doi:10.1093/beheco/arx133
  #weber.achro = 0.165 (Gallus gallus, doi:10.1093/beheco/arx133)
  QI   <- pavo::vismodel(rspecdata, qcatch ="Qi",visual = "pfowl", achromatic = "ch.dc", illum = illum, trans = transmit, vonkries = FALSE, scale = 1, relative = FALSE)
  JND  <- pavo::coldist(QI, qcatch = NULL, noise = "neural", subset = background, achro = TRUE, n = c(1,1.9,2.2,2.1), weber.ref = 'longest', weber = 0.1, weber.achro = 0.165)

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
                  luminance = lum) %>%
    dplyr::mutate(vismodel = "Peafowl") %>%
    dplyr::mutate(iluminante = illum) %>%
    dplyr::mutate(substrato = background)

  return(result)

}
