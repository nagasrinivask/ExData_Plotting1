source("FileLoader.R")
performSecondPlot <- function() {
  myDataTable <- prepareDataForPlotting("1/2/2007","2/2/2007")
  png(filename="plot2.png", width=480, height=480, units="px" )
  
  plot(myDataTable$DateTime, myDataTable$Global_active_power, 
     type="l", xlab="", ylab="Global Active Power (kilowatts)")
 # axis.Date(side = 1,format="%b %y")
  dev.off()
}
performSecondPlot()
