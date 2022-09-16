coin_data <- read.csv("~/Downloads/bitmex_bltc.csv")
View(coin_data)
x<- coin_data[, c(1)]
y<- coin_data[,c(4)]
relation<-lm(y~x)
print(relation)
print(summary(relation))
# Find price of a coin with id 74(15 min after last period).
a <- data.frame(x = 74)
result <-  predict(relation,a)
print(result)
# Give the chart file a name.
png(file = "bitmex_bltc_linreg.png")

# Plot the chart.
plot(y,x,col = "blue",main = "price & time Regression",
     abline(lm(x~y)),cex = 1.3,pch = 16,xlab = "Time Period",ylab = "Price")

# Save the file.
dev.off()
