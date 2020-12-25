# Create a connection Object to MySQL database.
# We will connect to the sampel database named "sakila" that comes with MySql installation.
mysqlconnection = dbConnect(MySQL(), user = 'root', password = '', dbname = 'sakila',
                            host = 'localhost')

# List the tables available in this database.
dbListTables(mysqlconnection)