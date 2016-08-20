 mv=read.table("movie.txt",header=FALSE,sep="|",quote="\"")
 colnames(mv)=c("ID","title","RelD","vr","imdb","unknown","action","adventure","animation","child
mv$ID=NULL
mv$RelD=NULL
 mv$vr=NULL
mv$imdb=NULL
mv=unique(mv)

#now hiirarchy clustering
distance=dist(mv[2:20],method="euclidean")
clustermv=hclust(distance,method="ward.D") 
plot(clustermv)
 clustergroups=cutree(clustermv,k=10)
 tapply(mv$action,clustergroups,mean)
subset(mv,title=="Men in Black (1997)")
 clustergroups[257]