source("FileLoader.R")
performFourthPlot <- function() {
  myDataTable <- prepareDataForPlotting("1/2/2007","2/2/2007")
  png(filename="plot4.png", width=480, height=480, units="px" )
  par (mfrow = c(2,2), mar = c(4,4,2,1), oma = c(0,0,2,0))
  myColLegends = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3")
  myLegendColors =c("black", "red", "blue")
  with(myDataTable, {
    plot(DateTime, Global_active_power, xlab="", ylab="Global Active Power", type="l")
    plot(DateTime, Voltage, xlab="datetime", ylab="Voltage", type="l")
    
    plot(myDataTable$DateTime, myDataTable$Sub_metering_1, 
         type="l", xlab="", ylab="Energy sub metering")
    lines(myDataTable$DateTime, myDataTable$Sub_metering_2, 
          type="l", col="red")
    lines(myDataTable$DateTime, myDataTable$Sub_metering_3, 
          type="l", col="blue")
    legend("topright", lty=1, lwd=1, col=myLegendColors, legend= myColLegends)
    
    plot(DateTime, Global_reactive_power, xlab="datetime", ylab="Global_reactive_power", type="l")   
    
  }
    ) 
    
  
 
 
  dev.off()
}
performFourthPlot()