source("FileLoader.R")
performThirdPlot <- function() {
  myDataTable <- prepareDataForPlotting("1/2/2007","2/2/2007")
  png(filename="plot3.png", width=480, height=480, units="px" )
  myColLegends = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3")
  myLegendColors =c("black", "red", "blue")
  plot(myDataTable$DateTime, myDataTable$Sub_metering_1, 
       type="l", xlab="", ylab="Energy sub metering")
  lines(myDataTable$DateTime, myDataTable$Sub_metering_2, 
        type="l", col="red")
  lines(myDataTable$DateTime, myDataTable$Sub_metering_3, 
        type="l", col="blue")
  legend("topright", lty=1, lwd=1, col=myLegendColors, legend= myColLegends)
  dev.off()
}
performThirdPlot()