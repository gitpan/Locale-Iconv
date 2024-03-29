# Before `make install' is performed this script should be runnable with
# `make test'. After `make install' it should work as `perl test.pl'

######################### We start with some black magic to print on failure.

# Change 1..1 below to 1..last_test_to_print .
# (It may become useful if the test is moved to ./t subdirectory.)

BEGIN { $| = 1; print "1..3\n"; }
END {print "not ok 1\n" unless $loaded;}
use Locale::Iconv;
$loaded = 1;
print "ok 1\n";

######################### End of black magic.

# Insert your test code below (better if it prints "ok 13"
# (correspondingly "not ok 13") depending on the success of chunk 13
# of the test code):

# ASCII superset to ASCII superset

$cd = Locale::Iconv->new("roman8", "iso88591");
$a  = "abc";
$b  = $cd->convert($a);
if($a eq $b)
{
    print "ok 2\n";
}
else
{
    print "not ok 2\n";
}

# ASCII to EBCDIC and back

$cd = Locale::Iconv->new("iso88591", "cp037");
$a  = "abc";
$b  = $cd->convert($a);
$cd = Locale::Iconv->new("cp037", "iso88591");
$b  = $cd->convert($b);
if($a eq $b)
{
    print "ok 3\n";
}
else
{
    print "not ok 3\n";
}
