## `makeCacheMatrix` stores a matrix and gives an interface to 4 different
## functions to deal with matrix inversion calculation. The actual calculation
## and value caching is done in `cacheSolve` function.


## Name: makeChacheMatrix
## Input: x (matrix)
## Summary:
##   This function takes an matrix input and returns a list of 4 functions.
##   The input matrix is cahced in `x` variable and can be read again by
##   $get function. The `x` can be rewritten by $set function by giving a new
##   matrix input. This function itself does not have capability to calculate
##   the 'inverse' of the stored matirx, and should be done in another
##   function. However if that one has been ran already then you can read
##   the 'inverse' `inv` of `x` by $getinv function. It is possible to set
##   `inv` by $setinv though, it is not designed to use directly that one but
##   the only `cacheSolve` is expected to use $setinv here.

makeCacheMatrix <- function(x = matrix()) {
    inv <- NULL
    set <- function(xinput) {
        x <<- xinput
        inv <<- NULL
    }
    get <- function() x
    getinv <- function() inv
    setinv <- function(iinput) inv <<- iinput
    list(set = set, get = get,
         setinv = setinv,
         getinv = getinv)
}


## Name: makeChacheMatrix
## Input: x (matrix)
## Summary:
##   This function takes the output from `makeCacheMatrix` do the actual
##   calculation of matrix inversion, and caches the output vlaue by
##   `makeCacheMatrix$setinv(inv)`.

cacheSolve <- function(x, ...) {
    inv <- x$getinv()
    if(!is.null(inv)) {
        message("getting cached data")
        return(inv)
    }
    data <- x$get()
    inv <- solve(data, ...)
    x$setinv(inv)
    m
}
