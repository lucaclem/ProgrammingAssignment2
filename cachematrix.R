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
  m <- NULL
  set <- function(y) {
    x <<- y
    m <<- NULL
  }
  get <- function() x
  setmean <- function(mean) m <<- mean
  getmean <- function() m
  list(set = set, get = get,
       setmean = setmean,
       getmean = getmean)
}




####################################################
## cacheSolve
####################################################

## Return the inverse of a matrix. If the inverse has already been computed
## return the cached values. Otherwise compute the inverse, cache the values
## for future use, and return them

cacheSolve <- function(x, ...) {
        ## Return a matrix that is the inverse of 'x'
}
