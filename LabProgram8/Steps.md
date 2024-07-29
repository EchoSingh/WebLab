
# How to Run the Perl Script with Apache on Ubuntu

This guide will help you set up and run a Perl script that displays a greeting message randomly chosen from a list of 4 messages. The script will be hosted on an Apache server.

## Prerequisites

- Ubuntu system
- Internet connection

## Steps

### 1. Update the Package List

First, update the package list to ensure you have the latest package information.

```sh
sudo apt update
```

### 2. Install Apache

Install the Apache web server.

```sh
sudo apt install apache2
```

### 3. Enable CGI Module in Apache

Enable the CGI module in Apache to allow it to execute Perl scripts.

```sh
sudo a2enmod cgid
sudo systemctl restart apache2
```

### 4. Install PHP and Perl Modules

Install PHP and Perl modules.

```sh
sudo apt install php7.4-cgi
sudo apt install mysql-server
sudo apt install -y libdbd-mysql-perl
```

### 5. Confirm MySQL Installation

Confirm that MySQL is installed correctly.

```sh
mysql -u root -p
exit
```

### 6. Navigate to the `cgi-bin` Directory

Navigate to the `cgi-bin` directory where the Perl script will be stored.

```sh
cd /usr/lib/cgi-bin
```

### 7. Save the Perl Script

Save the following Perl script as `greeting.pl` in the `cgi-bin` directory.

```perl
#!/usr/bin/perl
use strict;
use warnings;
use CGI ':standard';

# Array of greeting messages
my @msg = ("Welcome", "Have a nice day", "Good Morning", "Good Day");

# Generate a random number to select a greeting message
my $range = @msg;
my $random_number = int(rand($range));

# CGI to handle the form submission and response
print header();
if (param) {
    my $name = param('name');
    print start_html(-title => "User Name", -bgcolor => "Pink", -text => "blue");
    print b("Hello $name, $msg[$random_number]"), br();
    print start_form();
    print submit(-value => "Back");
    print end_form();
    print end_html();
} else {
    print start_html(-title => "Enter user name", -bgcolor => "yellow", -text => "blue");
    print start_form(), textfield(-name => 'name', -value => ' '), submit(-name => 'submit', -value => 'Submit'), reset();
    print end_form();
    print end_html();
}
```

### 8. Set Permissions for the Perl Script

Set the correct permissions for the script to make it executable.

```sh
sudo chmod 777 greeting.pl
```

### 9. Ensure Apache Server is Running

Make sure the Apache server is running.

```sh
sudo systemctl start apache2
```

### 10. Run the Perl Script

Open a browser and navigate to the following URL to run the Perl script.

```
http://localhost/cgi-bin/greeting.pl
```

You should see a form to enter your name and get a random greeting message.
