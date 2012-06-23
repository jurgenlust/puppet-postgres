# Creates a user in PostgreSQL
define postgres::user($username, $password) {
	exec { "create-${username}" :
		command =>  "/usr/bin/psql -c \"create user ${username} with encrypted password '${password}' createdb createuser\" template1",
		onlyif => "/usr/bin/test `/usr/bin/psql -tAc \"SELECT count(*) FROM pg_roles WHERE rolname='${username}'\" template1` -eq 0",
		user => "postgres",
		require => Class["postgres"],
	}	
}