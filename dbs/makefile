createtest: createbare testdata

createbare: createdb createfunctions

createfunctions:
	find functions -type f -name "*.sql" -exec psql autochef -f {} \;

createdb: dropdb
	createdb autochef;
	createlang plpgsql autochef;
	psql autochef -f create.sql;

dropdb:
	dropdb autochef || true;

testdata:
	psql autochef -f test.sql;
