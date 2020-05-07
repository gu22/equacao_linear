# Import lpSolve package
library(lpSolve)

# Set transportation costs matrix
costs <- matrix(c(3.2, 3.4, 3.3,
                  3.2, 3.4, 3.3,
                  3.2, 3.4, 3.3), nrow = 3, byrow = TRUE)

# Set customers and suppliers' names
colnames(costs) <- c("Customer 1", "Customer 2", "Customer 3")
rownames(costs) <- c("Supplier 1", "Supplier 2", "Supplier 3")

# Set unequality/equality signs for suppliers
row.signs <- rep("<=", 3)

# Set right hand side coefficients for suppliers
row.rhs <- c(180, 150, 240)

# Set unequality/equality signs for customers
col.signs <- rep("=", 3)

# Set right hand side coefficients for customers
col.rhs <- c(200,170,200)

# Final value (z)
lp.transport(costs, "max", row.signs, row.rhs, col.signs, col.rhs)

# Variables final values
lp.transport(costs, "max", row.signs, row.rhs, col.signs, col.rhs)$solution
