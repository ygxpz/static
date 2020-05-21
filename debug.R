rows  = 3
A  = matrix(1:9,3,3)
pages <- data.frame(a=c(1, 2 ,3), b=c(1, 2, 3), c=c(1, 2, 3))
for(i in 1:rows){
  browser()
  p1 <- pages[i, 1]
  p2 <- pages[i, 2]
  A[p2, p1] <- 1
}

