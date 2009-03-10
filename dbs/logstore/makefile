createbare: createdb createfunctions

createfunctions:
	find functions -type f -name "*.sql" -exec psql logstore -f {} \;

createdb: dropdb
	createdb logstore;
	createlang plpgsql logstore;
	psql logstore -f create.sql;

dropdb:
	dropdb logstore || true;
