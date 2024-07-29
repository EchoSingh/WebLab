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
