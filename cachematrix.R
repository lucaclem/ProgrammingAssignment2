# Store to cache/print an object containing a matrix and its inverse


# Usage:
#
# 1. Create a cacheble matrix/inverse with
#    > foo <- makeCacheMatrix()
# 
# 2. Store the values of the matrix
#    > foo$set(data, nrow=n, ncol=n)
# 
# 3. OPTIONAL. Print the matrix
#    > foo$get()
# 
# 4. Print the inverse matrix
#    > cacheSolve(foo)
#   Inverse matrix will be printed from cache if available.
#   Otherwise, it will be computed, stored to cache for
#   future use, then printed



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
