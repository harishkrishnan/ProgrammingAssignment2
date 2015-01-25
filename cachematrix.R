## These functions demonstrate the usefulness of scoping in R


## This function creates a cache matrix
# 1) set the value of the matrix
# 2) get the value
# 3) set the inverse
# 4) get the inverse

makeCacheMatrix <- function(x = matrix()) {
  m<-NULL
  set<-function(y){
    x<<-y
    m<<-NULL
  }
  get<-function() x
  setinverse<-function(solve) m<<- solve
  getinverse<-function() m
  list(set=set, get=get,
       setinverse=setinverse,
       getinverse=getinverse)
}


## This demonstrates the scoping 
# 1) if the inverse is already avaiable, get it from cache
# 2) if it is not avaiable, then calculate the cache

cacheSolve <- function(x=matrix(), ...) {
  m<-x$getinverse()
  if(!is.null(m)){
    message("getting cached data")
    return(m)
  }
  matrix<-x$get ()
  m<-solve(matrix, ...)
  x$setinverse(m)
  m
}
