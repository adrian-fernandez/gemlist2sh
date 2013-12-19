##### gemlist_to_sh #####
##                     ######################################################################################
##                                                                                                         ##
## Genera un script SH para automatizar la instalación de todas las gemas indicadas en un fichero de texto ##
##													   ##
## Forma de uso: perl gemlist_to_sh.pl <gem_list.txt> > <nuevo_script.sh>                                  ##
##  													   ##
## Adrián Fernández - adrian.fernandez@vorago.es							   ##
##													   ##
#############################################################################################################

#!/usr/bin/perl -w
use strict;
my ($fichero) = @ARGV;
if (not defined $fichero) {
    die "Uso: perl gemas.pl <gem_list.txt> > <nuevo_script.sh> \n";
}
my @gems = qx(cat $fichero);
chomp(@gems);
foreach my $gem (@gems)
{
    $gem =~ m/(\S+)\s\((.+)\)/i;
    $gem = $1;
    my @gem_versions = split(/,/, $2);
    foreach (@gem_versions)
    {
        $_ =~ s/^\s+//;
        print "gem install $gem --version=$_ --no-ri --no-rdoc \n";
    }
}
