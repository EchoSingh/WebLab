#!/usr/bin/perl
use strict;
use warnings;
use CGI ':standard';
use DBI;

print "Content-type: text/html\n\n";
print "<HTML><HEAD><TITLE>Result of the Insert Operation</TITLE></HEAD><BODY>";

# Connect to the database
my $dbh = DBI->connect('DBI:mysql:database_name', 'user_name', 'password', 
    { RaiseError => 1, AutoCommit => 1 }) or die "Could not connect to database: $DBI::errstr";

# Get form parameters
my $name = param('name');
my $age = param('age');

# Insert the data into the table
my $sth = $dbh->prepare('INSERT INTO table_name (name, age) VALUES (?, ?)');
$sth->execute($name, $age) or die $dbh->errstr;

# Retrieve the current contents of the table
$sth = $dbh->prepare('SELECT name, age FROM table_name');
$sth->execute() or die $dbh->errstr;

# Display the results in a table
print "<table border='1' cellpadding='5'><tr><th>Name</th><th>Age</th></tr>";
while (my @row = $sth->fetchrow_array) {
    print "<tr><td>$row[0]</td><td>$row[1]</td></tr>";
}
print "</table>";

# Finish up
$sth->finish();
$dbh->disconnect();

print "</BODY></HTML>";
