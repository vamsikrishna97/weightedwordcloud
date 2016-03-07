
library(tm)
 texts<-Corpus(DirSource("/home/vamsi/Downloads/WIP9/10doc"))
 texts<-tm_map(texts,removeNumbers)
 for(j in seq(texts))   
 {   
   texts[[j]] <- gsub("-", " ", texts[[j]])   
 }   
 texts<-tm_map(texts,removePunctuation)
 texts<-tm_map(texts,tolower)
 library(SnowballC) 
 texts<-tm_map(texts,stemDocument)  
 texts<-tm_map(texts,removeWords,stopwords("english"))  
 
 texts<-tm_map(texts,stripWhitespace) 
 texts <- tm_map(texts, PlainTextDocument)
 
 term <- DocumentTermMatrix(texts, control=list(weighting = function(x) weightTfIdf(x,normalize = T)) ) 
 inspect(texts ) 
 inspect(term) 
   
 write.csv(inspect(term),file="tfidf.csv")
 
 library(wordcloud)
 library(RColorBrewer)
 #inspect the document term matrix
 w<-inspect(term)
 t(w)#transpose of w
 cs<-(t(w)%*%w)
 cs
 c<-row.names(cs)
 c
 cs[lower.tri(cs,diag = TRUE)]<-0
 cs
 
 l<-length(cs[1,])
 l
 
 i=1
 w1<-0
 w2<-0
 f<-0
 
 while(max(cs)!=0&&i<=100)
 {
   m<-which(max(cs)==cs)
   m<-m[1]
   cat(m)
   w1[i]<-(c[m%%l])#matching column
   w2[i]<-(c[(m%/%l)+1])#matching row
   f[i]<-cs[m]
   cs[m]<-0
   i<-i+1
 }
 
 w<-paste(w1,w2)
 w[1:100]
 f[1:100]
 
 wordcloud(w[1:100], f[1:100], random.order=FALSE, rot.per=0.25,random.color=F,min.freq=1.4,color=brewer.pal(8,"Pastel2"))
 wordcloud(w[1:100], f[1:100], random.order=FALSE, rot.per=0.25,random.color=F,min.freq=1.4,color=brewer.pal(8,"Dark2"))
 

