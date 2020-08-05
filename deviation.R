# 平均差
ds <- function(x, na.rm = FALSE){ # x为data.frame或list形式    
         n = max(row(matrix(x)))        # 获得X样本数量
         xmean = mean(unlist(x))   
         y = unlist(x)                           # 转为向量形式
         sum = 0
         for(i in 1:n){
           d = abs(y[[i]]-xmean)
           sum = sum + d
         }
        return (sum/n)
      }

aggregate(test[,2],list(test[,1]),ds)     # test为通过文件读取数据，第一列为分组依据


# 偏离度
dd <- function(x, na.rm = FALSE){
          n = max(row(matrix(x)))
          xmean = mean(unlist(x))
          y = unlist(x)
          sum = 0
          for(i in 1:n){
              d = (y[[i]]-xmean)^2
              sum = sum + d
           }
  
         return ((sum/n)/xmean)
    }

aggregate(test[,2],list(test[,1]),dd)

