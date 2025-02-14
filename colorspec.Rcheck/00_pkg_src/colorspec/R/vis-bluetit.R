#' @title Bluetit Visual Modeling
#'
#' @description This function calculates quantum catch (Qi), chromatic contrast, and achromatic contrast
#' in Just Noticeable Difference (JND) units for Bluetit vision. The visual model parameters are based on
#' Silva et al. (2022) and utilize the 'pavo' package for spectral data analysis.
#'
#' The function applies predefined parameters in `pavo::vismodel()` and `pavo::coldist()` to simulate Bluetit
#' vision:
#' - **vismodel() parameters**: `qcatch = "Qi"`, `visual = "bluetit"`, `achromatic = "bt.dc"`, `illum = "D65"`,
#'   `trans = "bluetit"`, `scale = 1`, `relative = FALSE`
#' - **coldist() parameters**: `qcatch = NULL`, `noise = "neural"`, `n = c(1, 1.9, 2.7, 2.7)`,
#'   `weber.ref = "longest"`, `weber = 0.1`, `weber.achro = 0.34`
#'
#' @param rspecdata A dataset, possibly of class `rspec`, containing a 'wl' column with wavelength range information
#' and spectral data in the remaining columns.
#' @param background A column name from `rspecdata` specifying the background reflectance to be used in the RNL model.
#' @param illum The illuminant used in the model. Available options are `"D65"` (standard daylight), `"bluesky"` (clear blue sky),
#' and `"forestshade"` (shaded forest conditions).
#'
#' @examples
#' #example ## not run
#' data(leptodactyla)
#' leptodactyla <- fixspec(leptodactyla)
#' vis.bt <- vis.bluetit(leptodactyla, background = "X00_background", illum = "D65")
#'
#' @export
vis.bluetit <- function(rspecdata, background, illum = c("D65", "bluesky", "forestshade")){

  #vismodel
  #weber = 0.1 (Leiotrix lutea) doi:10.1093/beheco/arx133
  #weber.achro = 0.34 (Sturnus vulgaris) doi:10.1093/beheco/arx133

  QI   <- pavo::vismodel(rspecdata, qcatch = "Qi",visual = "bluetit", achromatic = "bt.dc",illum = illum,trans = "bluetit", scale = 1, relative = FALSE)
  JND  <- pavo::coldist(QI, qcatch = NULL, noise = "neural", subset = background, achro=TRUE, n = c(1,1.9,2.7,2.7), weber.ref='longest', weber = 0.1, weber.achro = 0.34)

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
    dplyr::mutate(vismodel = "Bluetit") %>%
    dplyr::mutate(iluminante = illum) %>%
    dplyr::mutate(substrato = background)

  return(result)

}
