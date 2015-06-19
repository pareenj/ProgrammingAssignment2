## Put comments here that give an overall description of what your
## functions do
## makeCacheMatrix creates a special "matrix" object that can cache its inverse.
## cacheSolve computes the inverse of the special "matrix" returned by makeCacheMatrix above. If the inverse has already been calculated (and the matrix has not changed), then the cachesolve should retrieve the inverse from the cache.

## Write a short comment describing this function
## makeCacheMatrix creates a special "vector", which is really a list containing a function to
##  1. set the value of the matrix
##  2. get the value of the matrix
##  3. set the value of the inverse
##  4. get the value of the inverse

makeCacheMatrix <- function(x = matrix()) {
  m <- NULL
  set <- function(y) {
    x <<- y
    m <<- NULL
  }
  gets <- function() x
  setinv <- function(inv) m <<- inv
  getinv <- function() m
  list (set = set, gets = gets, setinv = setinv, getinv = getinv)
}


## Write a short comment describing this function
## cacheSolve computes the inverse of the special "matrix" returned by makeCacheMatrix above. If the inverse has already been calculated (and the matrix has not changed), then the cachesolve should retrieve the inverse from the cache.

cacheSolve <- function(x, ...) {
  m <- x$getinv()
  if(!is.null(m)) m
  dat <- x$gets
  m <- solve(dat)
  x$getinv(m)
  m
        ## Return a matrix that is the inverse of 'x'
}
