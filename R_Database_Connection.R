Sys.which("make")
install.packages("DBI")
install.packages("RMariaDB")
library(DBI)
library(RMariaDB)

con <- dbConnect(
  RMariaDB::MariaDB(),
  dbname = "mydb",
  host = "localhost",
  user = "root",
  password = "lenovo&9090",
  port = 3306
)

dbListTables(con)
data <- dbReadTable(con, "Hamza")
View(data)
