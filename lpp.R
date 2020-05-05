lp(direction = 'max', objective.in,const.mat,const.dir,const.rhs)

#objective.in = c(3.2,3.4,3.3)

#const.mat = matrix((20,12,4,4), nrow=2,byrow=

obj.fun <- c(3.2,3.4,3.3)
matrix_fu <- matrix(c(3.2,3.4,3.3,3.2,3.4,3.3,3.2,3.4,3.3), ncol=3, byrow = TRUE)

matrix_fu <- matrix(c(3.2,3.4,3.3), ncol=3, byrow = TRUE)


obj.fun <- c(200,170,200)
obj.fun <- c(3.2,3.4,3.3,3.2,3.4,3.3,3.2,3.4,3.3)
matrix_fu <- matrix(c(0,0,0,0,0,0,0,0,0), ncol=3, byrow = TRUE)
constr.dir <- c("<=",'<=','<=',"=",'=','=')
rhs <- c(180,150,240,200,170,200)

solver.fu <- lp(direction = 'max', obj.fun,matrix_fu,constr.dir,rhs,compute.sens = TRUE)


x <- make.lp(2, 2)
mm <- make.lp(3,3)
set.objfn(mm, c(200, 170, 200))
add.constraint(mm, c(0,0,0), "<=", 180)
add.constraint(mm, c(0,0,0), "<=", 150)
add.constraint(mm, c(0,0,0), "<=", 240)

o=c(200,170,200)
m <- c(1:9)
mm <- matrix(m,ncol = 3   , byrow = T)    
d <- c('<=',"<=",'<=')
r <- c(180,150,240)

lpSolve::lp('max',o,mm,d,r,compute.sens = T)
sol = lpSolve::lp('max',o,mm,d,r,compute.sens = T)
sol$solution