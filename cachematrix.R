## Store a matrix and cache it's inverse
## It is composed of 2 components:
## - the makeCacheMatrix function
## - the cacheSolve function



####################################################
## makeCacheMatrix
####################################################

## This function is a list containing functions to:
## * set the values of a matrix
## * get the values of a matrix
## * set the values of the inverse matrix
## * get the values of the inverse matrix

makeCacheMatrix <- function(x = matrix()) {
  i <- NULL
  
  # set the matrix
  set <- function(a, nrow, ncol) {
    x <<- matrix(a, nrow = nrow, ncol = ncol)
    i <<- NULL
  }
  
  # print the matrix
  get <- function() x
  
  # save the inverse matrix to cache
  setinverse <- function(inverse) i <<- inverse
  
  # print the inverse matrix
  getinverse <- function() i
  
  # return the cacheMatrix object
  list(set = set, get = get,
       setinverse = setinverse,
       getinverse = getinverse)
}




####################################################
## cacheSolve
####################################################

## Return the inverse of a matrix. If the inverse has already been computed
## return the cached values. Otherwise compute the inverse, cache the values
## for future use, and return them

cacheSolve <- function(x, ...) {
  #get the cached inverse matrix
  i <- x$getinverse()
  
  # print cached inverse if available
  if(!is.null(i)) {
    message("getting cached data")
    return(i)
  }
  
  # compute the inverse matrix
  data <- x$get()
  i <- solve(data, ...)
  
  # save inverse matrix to cache
  x$setinverse(i)
  
  # print inverse matrix
  i
}
