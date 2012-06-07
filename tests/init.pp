include postgres

postgres::user { 'puppet': 
	username => 'puppet',
	password => 'puppet',
}

postgres::db { 'puppetdb':
	name => 'puppetdb',
	owner => 'puppet'
}