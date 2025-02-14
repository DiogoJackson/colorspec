% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/vis-peafowl.R
\name{vis.peafowl}
\alias{vis.peafowl}
\title{Peafowl Visual Model}
\usage{
vis.peafowl(rspecdata, background, illum = c("D65", "bluesky", "forestshade"))
}
\arguments{
\item{rspecdata}{A data frame, possibly of class `rspec`, containing a 'wl' column with wavelength range
information and spectral data in the remaining columns.}

\item{background}{A column name indicating which spectral data should be used as the background in the RNL model.}

\item{illum}{The illuminant to be used in the model. Options include `"D65"`, `"bluesky"`, and `"forestshade"`.}
}
\description{
This function calculates the quantum catch (Qi), chromatic contrast, and
achromatic contrast in Just Noticeable Difference (JND) units for peafowl vision.
The visual model parameters are based on Silva et al. (2022) and utilize functions from the 'pavo' package.

The function applies the following parameter settings:
- `pavo::vismodel(rspecdata, qcatch = "Qi", visual = "pfowl", achromatic = "ch.dc",
   illum = "D65", trans = transmit, vonkries = FALSE, scale = 1, relative = FALSE)`
- `pavo::coldist(noise = "neural", achro = TRUE, n = c(1,1.9,2.2,2.1), weber.ref = "longest",
   weber = 0.1, weber.achro = 0.165)`
}
\examples{
#example ## not run
data(leptodactyla)
leptodactyla <- fixspec(leptodactyla)
vis.peafowl <- vis.peafowl(leptodactyla, background = "X00_background", illum = "D65")

}
