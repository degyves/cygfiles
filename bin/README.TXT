-- Para correr un query: 

sql "select * from cat_campo"

-- Listar todas las tablas de una base de datos

sqlListTables

select name from sys.Tables order by name

-- Listar todas las columnas de una tabla

sqlViewColumns <tabla>

select name from sys.columns where object_id=OBJECT_ID('dbo.cat_pozo')

-- Ver la clave de un campo:

sqlCveCampo <nombre>

rq "select cve_campo from cat_campo where campo='Taratunich'"

