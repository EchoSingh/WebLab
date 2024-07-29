
# How to Run the Perl CGI Script and HTML Form

## Prerequisites

1. **MySQL Database**: Ensure you have MySQL installed and running.
2. **Perl and DBI Module**: Ensure you have Perl and the DBI module installed.
3. **Web Server**: Ensure you have a web server (like Apache) installed and running.

## Setting Up MySQL

1. Create the database:
    ```sql
    CREATE DATABASE database_name;
    ```

2. Create the table:
    ```sql
    USE database_name;
    CREATE TABLE table_name (
        name VARCHAR(15),
        age VARCHAR(3)
    );
    ```

3. Create the user and grant privileges:
    ```sql
    CREATE USER 'user_name'@'localhost' IDENTIFIED BY 'password';
    GRANT ALL PRIVILEGES ON database_name.* TO 'user_name'@'localhost';
    FLUSH PRIVILEGES;
    ```

## Setting Up the Perl CGI Script

1. Copy `9.pl` to the `/usr/lib/cgi-bin/` directory:
    ```sh
    sudo cp 9.pl /usr/lib/cgi-bin/
    ```

2. Set the permissions for `9.pl`:
    ```sh
    sudo chmod 777 /usr/lib/cgi-bin/9.pl
    ```

## Setting Up the HTML Form

1. Copy `9.html` to the `/var/www/html/` directory:
    ```sh
    sudo cp 9.html /var/www/html/
    ```

## Running the Script

1. Open your web browser and go to `http://localhost/9.html`.

2. Fill in the form with the name and age information and submit it.

3. The current contents of the table will be displayed.

## Example Files

### Perl CGI Script (9.pl)
```perl
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
```

### HTML Form (9.html)
```html
<!DOCTYPE html>
<html>
<head>
    <title>Enter Information</title>
</head>
<body>
    <h1>Enter Information:</h1>
    <form action="http://localhost/cgi-bin/9.pl" method="post">
        Name: <input type="text" name="name"> <br>
        Age: <input type="text" name="age"> <br>
        <input type="submit" value="SUBMIT">
        <input type="reset" value="RESET">
    </form>
</body>
</html>
```
