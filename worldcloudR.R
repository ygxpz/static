# The worldcloud with R 
# For txt or notepad++ all files to create different wordcloud


library(jiebaRD)
library(jiebaR)
library(wordcloud2)

engine  = worker()
segment("C:\\Users\\YU\\Desktop\\wordcloud\\test.txt", engine)
data = scan("C:\\Users\\YU\\Desktop\\wordcloud\\test.segment.2020-05-18_13_41_55.txt",
            sep='\n',what='',encoding="UTF-8")
data2 <- freq(data)
data2 <- qseg[data]
data.words <- data2

#去掉停词
#过滤掉1个字的词
data.words <- subset(data.words, nchar(as.character(data.words))>1) 
#过滤停词
stop=read.table(file=file.choose(),colClasses="character") 
stopwords=c(NULL) 
for(i in 1:dim(stop)[1]){ 
  stopwords=c(stopwords,stop[i,1]) 
}
for(j in 1:length(stopwords)){ 
  data.words <- subset(data.words,data.words!=stopwords[j]) 
}


data.freq <- table(unlist(data.words)) 
data.freq <- rev(sort(data.freq)) 
data.freq <- data.frame(word=names(data.freq), freq=data.freq)
#按词频过滤词，过滤掉只出现过一次的词，这里可以根据需要调整过滤的词频数
data.freq=subset(data.freq, data.freq$freq.Freq>=2) 
head(data.freq)

wordcloud2(data.freq[,2:3],color = "random-light", backgroundColor = "grey",shape = 'star')