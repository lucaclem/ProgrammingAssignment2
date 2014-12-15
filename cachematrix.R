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
  set <- function(a, nrow, ncol) {
    x <<- matrix(a, nrow = nrow, ncol = ncol)
    i <<- NULL
  }
  get <- function() x
  setinverse <- function() i <<- solve(x)
  getinverse <- function() i
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
        ## do some stuff here
}
