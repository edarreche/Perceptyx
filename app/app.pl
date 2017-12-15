#!/usr/bin/perl
use strict;
use warnings;
use v5.10; # for say() function

use DBI;

# MySQL database configurations
#my $dsn = "DBI:mysql:employees";
my $db="employees";
my $host="172.17.0.1";
my $username = "root";
my $password = 'password';

# connect to MySQL database
my %attr = ( PrintError=>0,  # turn off error reporting via warn()
             RaiseError=>1   # report error via die()
           );
#my $dbh = DBI->connect($dsn,$username,$password,\%attr)or
#   die ( "Couldn't connect to database: " . DBI->errstr );

my $dbh = DBI->connect ("DBI:mysql:database=$db:host=$host",
                              $username,
                              $password)
                              or die "Can't connect to database: $DBI::errstr\n";

# query data from the employees table
query_employees($dbh);

# disconnect from the MySQL database
$dbh->disconnect();

sub query_employees{
  # query data from the tags table

  my ($dbh) = @_;
  my $sql = "SELECT * FROM employees WHERE gender = 'M' AND birth_date = '1965-02-01 ' and hire_date > '1990-01-01' ORDER BY first_name,last_name";
  my $sth = $dbh->prepare($sql);
  $sth->execute();
  $sth->dump_results( );
  $sth->finish();
}
