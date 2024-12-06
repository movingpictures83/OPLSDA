library(lipidr)
library(ggplot2)


dyn.load(paste("RPluMA", .Platform$dynlib.ext, sep=""))
source("RPluMA.R")
source("RIO.R")

input <- function(inputfile) {
  parameters <<- read.table(inputfile, as.is=T);
  rownames(parameters) <<- parameters[,1];
    pfix = prefix()
  if (length(pfix) != 0) {
     pfix <<- paste(pfix, "/", sep="")
  }

}


run <- function() {}

output <- function(outputfile) {
	groupcol <- parameters["groupcol", 2]
	groups <- readSequential(paste(pfix, parameters["groups", 2], sep="/"))
	pdf(outputfile)
   d_normalized <- readRDS(paste(pfix, parameters["data", 2], sep="/"))
mvaresults = mva(d_normalized, method = "OPLS-DA", group_col = groupcol, groups=groups)
plot_mva(mvaresults, color_by="group")

}

