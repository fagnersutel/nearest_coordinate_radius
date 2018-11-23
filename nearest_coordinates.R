library(RANN)
set.seed(123)

## simulate some data
lon = runif(100, -99.1, -99)
lat = runif(100, 33.9, 34)

## data is a 100 x 2 matrix (can also be data.frame)
mydata <- cbind(lon, lat)
mydata
radius <- 0.02   ## your radius
res <- nn2(mydata, k=nrow(mydata), searchtype="radius", radius = radius)
res
## prints total number of nearest neighbors (for all points) found using "radius"
print(length(which(res$nn.idx>0)))
##[1] 1224
res1 <- nn2(mydata, k=100, radius = radius) 
## prints total number of nearest neighbors (for all points) found using your call
print(length(which(res1$nn.idx>0)))
##[1] 10000

radius <- 0.03   ## increase radius
res <- nn2(mydata, k=nrow(mydata), searchtype="radius", radius = radius)
## prints total number of nearest neighbors (for all points) found using "radius"
print(length(which(res$nn.idx>0)))
##[1] 2366
res1 <- nn2(mydata, k=100, radius = radius)
## prints total number of nearest neighbors (for all points) found using your call
print(length(which(res1$nn.idx>0)))
##[1] 10000
count <- rowSums(res$nn.idx > 0) - 1
count






library("RANN")
#Data contains longitude and latitudes of points
long<-c(-0.30541369, -0.06148541, -0.10533759, -0.06067756, -0.30908847)
lat<-c(51.51735, 51.49540, 51.53120, 51.54869, 51.51602)
   
data<-cbind(long,lat)
   
#Setting radius
#Here is my question -- what is the unit of radius?
radius<-.05
 
#Identifying neighbors
res <- nn2(data, k=nrow(data), searchtype="radius", radius = radius)
   
#Counts of neighbors
count <- cbind(data,rowSums(res$nn.idx > 0) - 1)
count   
#View output
colnames(count)[3]<-"nn_count"
head(count)



set.seed(1)
radius<-10
lat<-runif(10,-90,90)
long<-runif(10,-180,180)
id<-1:10
dat<-cbind(id,lat,long)
dat



library(geosphere)
dat[,3:2]
cbind(dat, X=rowSums(distm (dat[,3:2], fun = distHaversine) / 1000 <= 5000)) # number of points within distance 10000 km
mydata_dois = mydata[1:15,]

cbind(mydata_dois, X=rowSums(distm (mydata, fun = distHaversine) / 1000 <= 0.5)) # number of points within distance 10000 km
