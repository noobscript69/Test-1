#Editor:-Arnab Suklabaidya
#Date:-21/03/21


#installing all package dependencies
install.packages("Rcpp")
install.packages("RcppEigen")
install.packages("BH")
install.packages("lpSolveAPI")

#Using devtools to install volesti Rcpp Package
Rcpp::compileAttributes()  
library(devtools)  
devtools::build()  
devtools::install()  
library(volesti)


#Rstudio as well to open volesti.Rproj and then click build source Package and then Install and Restart in Build at the menu bar.

#installing volesti package
install.packages("volesti")



#Generating a random H-polytope and Computing its volume

#An H-polytope is a convex polytope defined by a set of linear inequalities or equivalently a ddimensional H-polytope with m facets is defined by a m × d matrix A and a m-dimensional vector
#b, s.t.: Ax ≤ b.

#A An m × d numerical matrix.
#b An m-dimensional vector b.


A = matrix(c(-1,0,0,-1,1,1), ncol=2, nrow=3, byrow=TRUE)
b = c(0,0,1)
P = Hpolytope(A = A, b = b)

volume(P)

#The main function for volume approximation of a convex Polytope (H-polytope)
#volume(P, settings = NULL, rounding = FALSE)

#or we can create a random H-polytope and determine its volume like this

P = gen_cube(100,'H')
volumes <- list()
for (i in 1:10) {
  volumes[[i]] <- volume(P) # default parameters
}
options(digits=10)
summary(as.numeric(volumes))


# CLEAN UP #################################################

# Clear environment
rm(list = ls()) 

# Clear packages
p_unload(all)  # Remove all add-ons
detach("package:datasets", unload = TRUE)  # For base

# Clear console
cat("\014")  # ctrl+L

# Clear mind :)




