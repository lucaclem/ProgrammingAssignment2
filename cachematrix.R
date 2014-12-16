# Store to cache/print an object containing a matrix and its inverse


# Usage:
#
# 1. Create an object allowing to store a matrix and
#    its inverse into cache
#    > foo <- makeCacheMatrix(matrix(data, nrow, ncol))
# 
# 2. OPTIONAL. Print the matrix
#    > foo$get()
# 
# 3. Compute, save to cache, and print the inverse matrix
#    > cacheSolve(foo)
#
# 4. If you need to print the inverse matrix again, just re-run
#    > cacheSolve(foo)
#    This time, inverse matrix will be printed from cache, without
#    solving it again.
#
# Inverse matrix will be deleted from cache if the values of the matrix
# will be modified.


####################################################
# makeCacheMatrix
####################################################

# The makeCacheMatrix function can:
#   - store values of a matrix to cache
#   - get the values of a matrix from cache
#   - store the values of the inverse matrix to cache
#   - get the values of the inverse matrix from cache


makeCacheMatrix <- function(x = matrix()) {
        i <- NULL
        
        # set the matrix
        set <- function(y) {
                x <<- y
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
# cacheSolve
####################################################

# The cacheSolve function can, alternatively:
#   - get the inverse matrix from cache (if available)
#   - compute the inverse matrix, store it to cache,
#     return its values


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
