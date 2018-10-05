## This function creates a special "matrix" object that can cache its inverse

## This function creates a list which contains the matrix and cached inverse

makeCacheMatrix<- function(x = matrix())
{ q<- NULL
set<- function(y){
  x<<- y
  q<<- NULL}
get<- function()x
setinverse<- function(inv) q<<- inv
getinverse<- function() q
list(set=set, get=get, setinverse=setinverse, getinverse=getinverse)
}


## cacheSolve: This function computes the inverse of the special "matrix" returned by makeCacheMatrix above. 
## If the inverse has already been calculated (and the matrix has not changed),
## then the cachesolve retrieves the inverse from the cache

cacheSolve<- function(x,...){
  q <- x$getinverse()
  if(!is.null(q)) {
    message("getting cached data")
    return(q)
  }
  matrixz <- x$get()
  q <- solve(matrixz)
  x$getinverse()
  q
}
