## This is my submission for Programming Assignment 2
## Below are two functions that use lexical scoping to retrieve and change 
## a matrix and its inverse


## Builds matrix list of functions to...
## -set matrix
## -get matrix
## -set inverse
## -get inverse
makeCacheMatrix <- function(x = matrix()){
    inv <- NULL  #inverse initialized to NULL
    set <- function(y, ...){  #lets user supply the matrix
        x <<- y  #set variable in parent environment
        inv <<- NULL  #set variable in parent environment
    }
    get <- function() x  #returns matrix
    setInverse <- function(inverse) inv <<- inverse  #set variable in parent environment
    getInverse <- function() inv  #returns inverse
    list(set = set, get = get, setInverse = setInverse, getInverse = getInverse) #return list of functions
  
}

##function checks if inverse exists in cache
##retrieves value if not NULL, otherwise calculates inverse
cacheSolve <- function(x, ...){
    if(!is.null(inv)){
        #inverse already calculated
        print("Getting cached matrix")
        return(inv) #return inverse
    }
    #inverse not calculated
    inv <- solve(x$get())
    x$setInverse(inv) #set inverse for future reference
    inv #return inverse
}