## This program contains two functions the 1st one chaches the inverse of a matrix and the second one inverses a matrix if not available in cache. Note that only square matrix can be used.

makeCacheMatrix <- function(x = numeric()) {
  
  mycache <- NULL  ## initially cache is set to NULL
  
  # store a matrix
  setMatrix <- function(newValue) {
    mymatrix <<- newValue
    mycache <<- NULL
  }
  
  # returns matrix
  getMatrix <- function() {
    mymatrix
  }
  
  # cache the argument 
  cacheInverse <- function(solve) {
    mycache <<- solve
  }
  
  # get the cached value
  getInverse <- function() {
    mycache
  }
  
  # return the list of functions
  list(setMatrix = setMatrix, getMatrix = getMatrix, cacheInverse = cacheInverse, getInverse = getInverse)
}


#function calculates the inverse of matrix created with makeCacheMatrix
cacheSolve <- function(y, ...) {
  # get the cached value if available
  inverse <- y$getInverse()
  # if a cached value exists then return it
  if(!is.null(inverse)) {
    message("Results from cache")
    return(inverse)
  }
  # otherwise caclulate the inverse and store it inthe cache
  data <- y$getMatrix()
  inverse <- solve(data)
  y$cacheInverse(inverse)
  
  # return inverse
  inverse
}