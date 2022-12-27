
#DataFilename <- file.choose()
DataFilename <- "somwhere\\light_barrier\\data.csv"
data <- read.table(DataFilename, dec = ".", sep = ",", numerals = c("warn.loss"), header=TRUE, fileEncoding="UTF-8-BOM")
DataFilename <- "somwhere\\light_barrier\\autocorr.csv"
autocorr <- read.table(DataFilename, dec = ".", sep = ",", numerals = c("warn.loss"), header=TRUE, fileEncoding="UTF-8-BOM")
DataFilename <- "somwhere\\light_barrier\\barker.csv"
barker <- read.table(DataFilename, dec = ".", sep = ",", numerals = c("warn.loss"), header=TRUE, fileEncoding="UTF-8-BOM")
DataFilename <- "somwhere\\light_barrier\\result.csv"
result <- read.table(DataFilename, dec = ".", sep = ",", numerals = c("warn.loss"), header=TRUE, fileEncoding="UTF-8-BOM")

data$ms = data$us / 1000
barker$ms = barker$us / 1000

par(mfrow=c(1,2))

plot(data$ms, data$light, ylim = c(0,1), type="l",
     xlab = "time [ms]", ylab = "light intensity",
     main = "raw data")
lines(barker$ms+(result$pos/1000), barker$pulse, col = "red")
abline(h=0, col="gray", lty=2)
abline(h=result$mean, col="blue", lty=2)

plot(autocorr$shift, autocorr$autocorr, ylim = c(0,30),
     xlab = "shift", ylab = "correlation value",
     main = "autocorrelation")
abline(h=0, col="gray", lty=2)
abline(v=result$left, col="blue", lty=2)
abline(v=result$right, col="blue", lty=2)
abline(h=result$max, col="red", lty=2)
abline(v=result$pos, col="red", lty=2)
abline(h=result$max-0.75, col="blue", lty=2)

result