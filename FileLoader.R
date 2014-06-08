downloadContentFile<-function(pUrl, pFileName) {
  if(!file.exists(pFileName)) {
    download.file(pUrl, destfile=pFileName, method="curl")
  
  } 
  pFileName
}
prepareDataForPlotting<- function(pStartDate, pEndDate) {
  myCachedContent <- "MyElectricPowerData.csv"
  
  if(file.exists(myCachedContent)) {
    myEffectiveContentData <- read.csv(myCachedContent)
    myEffectiveContentData$DateTime<- strptime(
          myEffectiveContentData$DateTime, "%Y-%m-%d %H:%M:%S")
  } else {
    myDownloadedFile<-downloadContentFile("https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip", "household_power_consumption.zip")
    myUnzippedContent <- unz(myDownloadedFile, "household_power_consumption.txt")
    myContentData <- read.table(myUnzippedContent, header=TRUE, sep=";",
                                na.strings="?",
                                colClasses=c("character",
                                             "character",
                                             "numeric",
                                             "numeric",
                                             "numeric",
                                             "numeric",
                                             "numeric",
                                             "numeric",
                                             "numeric"))
    myEffectiveContentData <- myContentData[(myContentData$Date == pStartDate)
                                            | (myContentData$Date == pEndDate),]
    myEffectiveContentData$DateTime <- strptime(paste(
      myEffectiveContentData$Date ,
      myEffectiveContentData$Time), "%d/%m/%Y %H:%M:%S")
    write.csv(myEffectiveContentData, myCachedContent)
  }
  myEffectiveContentData
}