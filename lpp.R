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

o <- c(3.2,3.4,3.3,3.2,3.4,3.3,3.2,3.4,3.3)
m <- c(1:9)
m <- c(3.2,3.4,3.3,3.2,3.4,3.3,3.2,3.4,3.3)
mm <- matrix(m,ncol = 3   , byrow = T)    
d <- c('<=',"<=",'<=','=','=','=')
d2 <- c('=','=','=')
r <- c(180,150,240,200, 170, 200)
r2 <- c(200, 170, 200)

lpSolve::lp('max',o,mm,d,d2,r,r2,compute.sens = T)
sol = lpSolve::lp('max',o,mm,d,r,compute.sens = T)
sol$solution


#-----otimizacao ok---------------------------------------------------

o=c(600,1000)
m <- c(1:9)
m <- c(4,2,2,4,2,6)
mm <- matrix(m,ncol = 2   , byrow = T)    
d <- c('<=',"<=",'<=')
r <- c(32,22,30)

lpSolve::lp('max',o,mm,d,r,compute.sens = T)
sol = lpSolve::lp('max',o,mm,d,r,compute.sens = T)
sol$solution


#-------example----------------------------

f.obj <- c(1, 9, 1)
f.con <- matrix (c(1, 2, 3, 3, 2, 2), nrow=2, byrow=TRUE)
f.dir <- c("<=", "<=")
f.rhs <- c(9, 15)

lp ("max", f.obj, f.con, f.dir, f.rhs)
a <- lp ("max", f.obj, f.con, f.dir, f.rhs)

f.con.d <- matrix (c(rep (1:2,each=3), rep (1:3, 2), t(f.con)), ncol=3)

lp ("max", f.obj, , f.dir, f.rhs, dense.const=f.con.d)

b <- lp ("max", f.obj, , f.dir, f.rhs, dense.const=f.con.d)

#--------------------example 2 ---------------------------

obj.fun <- c(8, 6, 3, 2, 4, 9)

m <- 2
n <- 3

constr <- matrix(0, n+m, n*m)

for(i in 1:m){
  for(j in 1:n){
    constr[i, n*(i-1) + j] <- 1
    constr[m+j, n*(i-1) + j] <- 1
  }
}

constr.dir <- c(rep("<=", m), rep(">=", n))

rhs <- c(70, 40, 40, 35, 25)

prod.trans <- lp("min", obj.fun, constr, constr.dir, rhs, compute.sens = TRUE)

prod.trans$obj.val

prod.trans$duals
prod.trans$duals.from
prod.trans$duals.to
prod.trans$sens.coef.from
prod.trans$sens.coef.to


chess.obj <- rep (1, 64)
q8 <- make.q8 ()
chess.dir <- rep (c("=", "<"), c(16, 26))
chess.rhs <- rep (1, 42)
lp ('max', chess.obj, , chess.dir, chess.rhs, dense.const = q8,
    all.bin=TRUE, num.bin.solns=3)
ch <- lp ('max', chess.obj, , chess.dir, chess.rhs, dense.const = q8,
         all.bin=TRUE, num.bin.solns=3)
ch