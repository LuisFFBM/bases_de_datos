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

all: solutions dropdb createdb restore shell
mycomando:
	@echo aqui va una descripcion
	@cat myfichero.sql | psql mibasededatos
createdb:
	@echo Creando BBDD
	@$(CREATEDB)
dropdb:
	@echo Eliminando BBDD
	@$(DROPDB) $(DBNAME)
	rm -f ./solutions/*.html
	rm -d ./solutions
	rm -f ./*.log
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

query1: solutions
	@echo query-1: "\n" | tee ./solutions/query1.html
	@sed -i '1i\\\H' query1.sql
	#@cat query1.sql | $(PSQL) >>./solutions/query1.html
	#@sed -i '1d' query1.sql
query2:	solutions
	@echo query-2: "Muestra el book_ref de la reserva, su precio y el precio calculado en base a la suma los precios de los tickets en la reserva en orden ascendente. \n" | tee ./solutions/query2.html ./query2.log
	@cat query2.sql | $(PSQL) | tee -a ./query2.log
	@sed -i '1i\\\H' query2.sql
	@cat query2.sql | $(PSQL)  >> ./solutions/query2.html
	@echo query-2: "The query-2 result has been successfully saved inside folder solutions in html format and in the main folder as log\n" 
	@sed -i '1d' query2.sql
query3:	solutions
	@echo query-3: "Obtiene el número de pasajeros recibidos totales por aeropuerto, lo muestra con el código del aeropuerto al que llegan y el número de pasajeros calculado en orden ascendente\n" | tee ./solutions/query3.html ./query3.log
	@cat query3.sql | $(PSQL) | tee -a ./query3.log
	@sed -i '1i\\\H' query3.sql
	@cat query3.sql | $(PSQL) >> ./solutions/query3.html
	@echo query-3: "The query-3 result has been successfully saved inside folder solutions in html format and in the main folder as log\n" 
	@sed -i '1d' query3.sql
query4:	solutions
	@echo query-4: "Muestra el número de asientos vacíos para cada vuelo representado por su flight_id" | tee ./solutions/query4.html ./query4.log
	@cat query4.sql | $(PSQL) | tee -a ./query4.log
	@sed -i '1i\\\H' query4.sql
	@cat query4.sql | $(PSQL) >> ./solutions/query4.html
	@echo query-4: "The query-4 result has been successfully saved inside folder solutions in html format and in the main folder as log\n" 
	@sed -i '1d' query4.sql
query5:	solutions
	@echo query-5: "Sin hacer" | tee ./solutions/query5.html ./query5.log
	@cat query5.sql | $(PSQL) | tee -a ./query5.log
	@sed -i '1i\\\H' query5.sql
	@cat query5.sql | $(PSQL) >> ./solutions/query5.html
	@echo query-5: "The query-5 result has been successfully saved inside folder solutions in html format and in the main folder as log\n" 
	@sed -i '1d' query5.sql
query6: solutions
	@echo query-6: "Calcula y muestra el o los trayectos con la mayor media de retrasos acumulados, el trayecta lo muestra por su fllight_no y muestra a su derecha el valor de la media acumulada del trayecto\n " | tee ./solutions/query6.html ./query6.log
	@cat query6.sql | $(PSQL) | tee -a ./query6.log
	@sed -i '1i\\\H' query6.sql
	@cat query6.sql | $(PSQL) >> ./solutions/query6.html
	@echo query-6: "The query-6 result has been successfully saved inside folder solutions in html format and in the main folder as log\n" 
	@sed -i '1d' query6.sql
	
solutions:
	mkdir ./solutions
