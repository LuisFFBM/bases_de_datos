# Version 1.0
# Por lo general no se requiere modificar el fichero

export PGDATABASE:=flight
export PGUSER :=alumnodb
export PGPASSWORD :=alumnodb
export PGCLIENTENCODING:=UTF8
export PGHOST:=localhost

DBNAME =$(PGDATABASE)
PSQL = psql 
CREATEDB = createdb
DROPDB = dropdb --if-exists
PG_DUMP = pg_dump
PG_RESTORE = pg_restore

all: dropdb createdb restore shell
mycomando:
	@echo aqui va una descripcion
	@cat myfichero.sql | psql mibasededatos
createdb:
	@echo Creando BBDD
	@$(CREATEDB)
dropdb:
	@echo Eliminando BBDD
	@$(DROPDB) $(DBNAME)
	rm -f *.log
dump:
	@echo creando dumpfile
	@$(PG_DUMP) > $(DBNAME).sql
restore:
	@echo restore data base
	@cat $(DBNAME).sql | $(PSQL)  
psql: shell
shell:
	@echo create psql shell
	@$(PSQL)  

allqueries: query1 query2 query3 query4 query5 query6
	@cat query?.log > all_queries.log

query1:
	@echo query-1: "please insert here a short description\n" | tee ./solutions/query1.html
	@sed -i '1i\\\H' query1.sql
	#@cat query1.sql | $(PSQL) >>./solutions/query1.html
	#@sed -i '1d' query1.sql
query2:
	@echo query-2: "please insert here a short description\n" | tee ./solutions/query2.html
	@sed -i '1i\\\H' query2.sql
	@cat query2.sql | $(PSQL)  >> ./solutions/query2.html
	@sed -i '1d' query2.sql
query3:
	@echo query-3: "please insert here a short description" | tee ./solutions/query3.html
	@sed -i '1i\\\H' query3.sql
	@cat query3.sql | $(PSQL) >> ./solutions/query3.html
	@sed -i '1d' query3.sql
query4:
	@echo query4: "please insert here a short description" | tee ./solutions/query4.html
	@cat query4.sql | $(PSQL) >> ./solutions/query4.html
query5:
	@echo query5: "please insert here a short description" | tee ./solutions/query5.html
	@cat query5.sql | $(PSQL) >> ./solutions/query5.html
query6:
	@echo query6: "please insert here a short description" |  tee ./solutions/query6.html
	@cat query6.sql | $(PSQL) >> ./solutions/query6.html

