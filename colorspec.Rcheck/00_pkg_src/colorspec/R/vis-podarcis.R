#' Podarcis vismodel
#'
#' Calculate quantum catch (Qi), chromatic and achromatic contrast, given in
#' JND units. The vismodel parameters of this function are based on Silva et al. (2022).
#' Parameters: pavo::vismodel(rspecdata, qcatch = "Qi", visual = "podarcis", achromatic = "pd.dc", illum = "D65", trans = transmit, vonkries = FALSE, scale = 1, relative = FALSE)
#' pavo::coldist(noise = "neural", achro = TRUE, n = c(1, 1.9, 2.7, 2.7), weber.ref = 'longest', weber = 0.1, weber.achro = TRUE)
#'
#' @param rspecdata A data frame, possibly of class rspec, which contains a column with a wavelength range, named 'wl', and spectra data in the remaining columns.
#' @param background Choose one column spectrum data to be the background in the RNL model.
#' @param illum You can choose the following illuminants: "D65", "bluesky", and "forestshade".
#'
#' @examples
#' # Example ## not run
#' data(leptodactyla)
#' leptodactyla <- fixspec(leptodactyla)
#' vis.podarcis <- vis.podarcis(leptodactyla, background = "X00_background", illum = "D65")
#'
#' @export
vis.podarcis <- function(rspecdata, background, illum = c("D65", "bluesky", "forestshade")){

  #vismodel
  #Import sensibility of Podarcis
  sensi <- pavo::as.rspec(podarcis_visualpeaks,lim=c(300,700))

  QI   <- pavo::vismodel(rspecdata, qcatch ="Qi",visual = sensi, achromatic = "all", illum = illum, trans = "ideal", vonkries = FALSE, scale = 1, relative = FALSE)
  JND  <- pavo::coldist(QI, qcatch = NULL, noise = "neural", subset = background, achro = TRUE, n = c(1, 2, 5, 9), weber.ref = 'longest', weber = 0.1, weber.achro = TRUE)

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
    dplyr::mutate(vismodel = "Podarcis") %>%
    dplyr::mutate(iluminante = illum) %>%
    dplyr::mutate(substrato = background)

  return(result)

}
