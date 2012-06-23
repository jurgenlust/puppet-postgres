# Creates a database in PostgreSQL
define postgres::db($name, $owner) {
	exec { "create-pgdb-${name}" :
		command =>  "/usr/bin/createdb -O ${owner} ${name}",
		onlyif => "/usr/bin/test `/usr/bin/psql -tAc \"select count(*) from pg_catalog.pg_database where datname = '${name}'\" template1` -eq 0",
		user => "postgres",
		require => [Class["postgres"],Postgres::User[$owner]],
	}	
}