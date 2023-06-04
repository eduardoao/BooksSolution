#!/bin/bash
wait_time=20s
password=Password123!

# wait for SQL Server to come up
echo importing data will start in $wait_time...
sleep $wait_time
echo executing script...

# run the init script to create the DB and the tables in /table
/opt/mssql-tools/bin/sqlcmd -S 0.0.0.0 -U sa -P $password -i ./scripts/00_sqlserver_create_database.sql 
/opt/mssql-tools/bin/sqlcmd -S 0.0.0.0 -U sa -P $password -i ./scripts/01_sqlserver_create.sql 
/opt/mssql-tools/bin/sqlcmd -S 0.0.0.0 -U sa -P $password -i ./scripts/02_sqlserver_populate_author.sql
/opt/mssql-tools/bin/sqlcmd -S 0.0.0.0 -U sa -P $password -i ./scripts/03_sqlserver_populate_publisher.sql
/opt/mssql-tools/bin/sqlcmd -S 0.0.0.0 -U sa -P $password -i ./scripts/04_sqlserver_populate_lookups.sql
/opt/mssql-tools/bin/sqlcmd -S 0.0.0.0 -U sa -P $password -i ./scripts/05_sqlserver_populate_book.sql
/opt/mssql-tools/bin/sqlcmd -S 0.0.0.0 -U sa -P $password -i ./scripts/06_sqlserver_populate_bookauthor.sql
/opt/mssql-tools/bin/sqlcmd -S 0.0.0.0 -U sa -P $password -i ./scripts/07_sqlserver_populate_country.sql
/opt/mssql-tools/bin/sqlcmd -S 0.0.0.0 -U sa -P $password -i ./scripts/08_sqlserver_populate_address.sql
/opt/mssql-tools/bin/sqlcmd -S 0.0.0.0 -U sa -P $password -i ./scripts/09_sqlserver_populate_customer.sql
/opt/mssql-tools/bin/sqlcmd -S 0.0.0.0 -U sa -P $password -i ./scripts/10_sqlserver_populate_others.sql
/opt/mssql-tools/bin/sqlcmd -S 0.0.0.0 -U sa -P $password -i ./scripts/11_sqlserver_populate_order.sql
/opt/mssql-tools/bin/sqlcmd -S 0.0.0.0 -U sa -P $password -i ./scripts/12_sqlserver_populate_orderline.sql
/opt/mssql-tools/bin/sqlcmd -S 0.0.0.0 -U sa -P $password -i ./scripts/13_sqlserver_populate_orderhistory.sql