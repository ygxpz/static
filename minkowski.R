library(MASS)
#Ã÷ÊÏ¾àÀë

Minkowski <- function (data = x, method = "manhattan", q = 1){
  if (class(x) == "data.frame"){
    p = ncol(x)
    n = nrow(x)
    D = matrix(nrow = n, ncol = n)    
    for (i in 1:n) {
      for (j in 1:n) {
        tmp = 0
        for (k in 1:p){
          tmp1 = abs(x[i,k]-x[j,k])^q
          tmp = tmp + tmp1
        }
      D[i,j] = tmp^(1/q)
      }
    }
  }
  D
}



