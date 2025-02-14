pkgname <- "colorspec"
source(file.path(R.home("share"), "R", "examples-header.R"))
options(warn = 1)
options(pager = "console")
base::assign(".ExTimings", "colorspec-Ex.timings", pos = 'CheckExEnv')
base::cat("name\tuser\tsystem\telapsed\n", file=base::get(".ExTimings", pos = 'CheckExEnv'))
base::assign(".format_ptime",
function(x) {
  if(!is.na(x[4L])) x[1L] <- x[1L] + x[4L]
  if(!is.na(x[5L])) x[2L] <- x[2L] + x[5L]
  options(OutDec = '.')
  format(x[1L:3L], digits = 7L)
},
pos = 'CheckExEnv')

### * </HEADER>
library('colorspec')

base::assign(".oldSearch", base::search(), pos = 'CheckExEnv')
base::assign(".old_wd", base::getwd(), pos = 'CheckExEnv')
cleanEx()
nameEx("fixspec")
### * fixspec

flush(stderr()); flush(stdout())

base::assign(".ptime", proc.time(), pos = "CheckExEnv")
### Name: fixspec
### Title: Spectral Data Processing
### Aliases: fixspec

### ** Examples

data(leptodactyla)
refletancias <- fixspec(leptodactyla)




base::assign(".dptime", (proc.time() - get(".ptime", pos = "CheckExEnv")), pos = "CheckExEnv")
base::cat("fixspec", base::get(".format_ptime", pos = 'CheckExEnv')(get(".dptime", pos = "CheckExEnv")), "\n", file=base::get(".ExTimings", pos = 'CheckExEnv'), append=TRUE, sep="\t")
cleanEx()
nameEx("plotspec")
### * plotspec

flush(stderr()); flush(stdout())

base::assign(".ptime", proc.time(), pos = "CheckExEnv")
### Name: plotspec
### Title: plot average spectra
### Aliases: plotspec

### ** Examples

#example 1 ## not run
data(leptodactyla)
refletancias <- fixspec(leptodactyla)
plotspec(leptodactyla, ylim = c(0, 80))




base::assign(".dptime", (proc.time() - get(".ptime", pos = "CheckExEnv")), pos = "CheckExEnv")
base::cat("plotspec", base::get(".format_ptime", pos = 'CheckExEnv')(get(".dptime", pos = "CheckExEnv")), "\n", file=base::get(".ExTimings", pos = 'CheckExEnv'), append=TRUE, sep="\t")
cleanEx()
nameEx("vis.bluetit")
### * vis.bluetit

flush(stderr()); flush(stdout())

base::assign(".ptime", proc.time(), pos = "CheckExEnv")
### Name: vis.bluetit
### Title: Bluetit Visual Modeling
### Aliases: vis.bluetit

### ** Examples

#example ## not run
data(leptodactyla)
leptodactyla <- fixspec(leptodactyla)
vis.bt <- vis.bluetit(leptodactyla, background = "X00_background", illum = "D65")




base::assign(".dptime", (proc.time() - get(".ptime", pos = "CheckExEnv")), pos = "CheckExEnv")
base::cat("vis.bluetit", base::get(".format_ptime", pos = 'CheckExEnv')(get(".dptime", pos = "CheckExEnv")), "\n", file=base::get(".ExTimings", pos = 'CheckExEnv'), append=TRUE, sep="\t")
cleanEx()
nameEx("vis.fiddler")
### * vis.fiddler

flush(stderr()); flush(stdout())

base::assign(".ptime", proc.time(), pos = "CheckExEnv")
### Name: vis.fiddler
### Title: Fiddler Crab Visual Modeling
### Aliases: vis.fiddler

### ** Examples

# Example usage:
data(leptodactyla)
vis.fiddler(leptodactyla, background = "X00_background", illum = "D65")

Example Usage:
data(leptodactyla)
vis.fiddler(leptodactyla, background = "X00_background", illum = "D65")




base::assign(".dptime", (proc.time() - get(".ptime", pos = "CheckExEnv")), pos = "CheckExEnv")
base::cat("vis.fiddler", base::get(".format_ptime", pos = 'CheckExEnv')(get(".dptime", pos = "CheckExEnv")), "\n", file=base::get(".ExTimings", pos = 'CheckExEnv'), append=TRUE, sep="\t")
cleanEx()
nameEx("vis.human.di")
### * vis.human.di

flush(stderr()); flush(stdout())

base::assign(".ptime", proc.time(), pos = "CheckExEnv")
### Name: vis.human.di
### Title: Calculate chromatic and achromatic contrasts for dichromatic
###   human vision
### Aliases: vis.human.di

### ** Examples

library(pavo)
# Generate example data
rspecdata <- data.frame(Wavelength = seq(300, 700, by = 10), Spectra = runif(41))
background <- "background_spectrum"
illum <- "D65"
# Calculate chromatic and achromatic contrasts
vis.human.di(rspecdata, background, illum)



base::assign(".dptime", (proc.time() - get(".ptime", pos = "CheckExEnv")), pos = "CheckExEnv")
base::cat("vis.human.di", base::get(".format_ptime", pos = 'CheckExEnv')(get(".dptime", pos = "CheckExEnv")), "\n", file=base::get(".ExTimings", pos = 'CheckExEnv'), append=TRUE, sep="\t")
cleanEx()
nameEx("vis.human.tri")
### * vis.human.tri

flush(stderr()); flush(stdout())

base::assign(".ptime", proc.time(), pos = "CheckExEnv")
### Name: vis.human.tri
### Title: Calculate chromatic and achromatic contrasts for trichromatic
###   human vision
### Aliases: vis.human.tri

### ** Examples

library(pavo)
# Generate example data
rspecdata <- data.frame(Wavelength = seq(300, 700, by = 10), Spectra = runif(41))
background <- "background_spectrum"
illum <- "D65"
# Calculate chromatic and achromatic contrasts
vis.human.tri(rspecdata, background, illum)




base::assign(".dptime", (proc.time() - get(".ptime", pos = "CheckExEnv")), pos = "CheckExEnv")
base::cat("vis.human.tri", base::get(".format_ptime", pos = 'CheckExEnv')(get(".dptime", pos = "CheckExEnv")), "\n", file=base::get(".ExTimings", pos = 'CheckExEnv'), append=TRUE, sep="\t")
cleanEx()
nameEx("vis.peafowl")
### * vis.peafowl

flush(stderr()); flush(stdout())

base::assign(".ptime", proc.time(), pos = "CheckExEnv")
### Name: vis.peafowl
### Title: Peafowl Visual Model
### Aliases: vis.peafowl

### ** Examples

#example ## not run
data(leptodactyla)
leptodactyla <- fixspec(leptodactyla)
vis.peafowl <- vis.peafowl(leptodactyla, background = "X00_background", illum = "D65")




base::assign(".dptime", (proc.time() - get(".ptime", pos = "CheckExEnv")), pos = "CheckExEnv")
base::cat("vis.peafowl", base::get(".format_ptime", pos = 'CheckExEnv')(get(".dptime", pos = "CheckExEnv")), "\n", file=base::get(".ExTimings", pos = 'CheckExEnv'), append=TRUE, sep="\t")
cleanEx()
nameEx("vis.podarcis")
### * vis.podarcis

flush(stderr()); flush(stdout())

base::assign(".ptime", proc.time(), pos = "CheckExEnv")
### Name: vis.podarcis
### Title: Podarcis vismodel
### Aliases: vis.podarcis

### ** Examples

# Example ## not run
data(leptodactyla)
leptodactyla <- fixspec(leptodactyla)
vis.podarcis <- vis.podarcis(leptodactyla, background = "X00_background", illum = "D65")




base::assign(".dptime", (proc.time() - get(".ptime", pos = "CheckExEnv")), pos = "CheckExEnv")
base::cat("vis.podarcis", base::get(".format_ptime", pos = 'CheckExEnv')(get(".dptime", pos = "CheckExEnv")), "\n", file=base::get(".ExTimings", pos = 'CheckExEnv'), append=TRUE, sep="\t")
### * <FOOTER>
###
cleanEx()
options(digits = 7L)
base::cat("Time elapsed: ", proc.time() - base::get("ptime", pos = 'CheckExEnv'),"\n")
grDevices::dev.off()
###
### Local variables: ***
### mode: outline-minor ***
### outline-regexp: "\\(> \\)?### [*]+" ***
### End: ***
quit('no')
