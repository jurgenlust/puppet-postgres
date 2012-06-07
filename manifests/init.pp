# Class: postgres
#
# This module manages postgres
#
# Parameters:
#
# Actions:
#
# Requires:
#
# Sample Usage:
#
# [Remember: No empty lines between comments and class definition]
class postgres {
	package {
		postgresql :
			ensure => present,
	}
	service {
		"postgresql" :
			ensure => running,
			enable => true,
			require => Package["postgresql"],
	}
}