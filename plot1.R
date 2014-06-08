source("FileLoader.R")
performFirstPlot <- function() {
  myDataTable <- prepareDataForPlotting("1/2/2007","2/2/2007")
  png(filename="plot1.png", width=480, height=480, units="px" )
  hist(myDataTable$Global_active_power, main="Global Active Power",
       xlab="Global Active Power (kilowatts)",col="red")
  dev.off()
}
performFirstPlot()