#!/usr/bin/perl -w
use strict;
use warnings;
use CGI;
use DBI;

my $q = CGI->new;
print $q->header('text/xml;charset=UTF-8');

my $userName = $q->param('userName');
my $password = $q->param('password');
my $firstName = $q->param('firstName');
my $lastName = $q->param('lastName');
my @parametros;
push(@parametros, $userName);
push(@parametros, $password);
push(@parametros, $firstName);
push(@parametros, $lastName);
print STDERR length($userName);

#print @parametros;
my $len =scalar(@parametros) ;
#print "tamña$len\n";
my @salida;
print STDERR "validacion".validarArray(@parametros);
if(validarArray(@parametros)==4){
  insertaBD(@parametros);
  @salida = @parametros;
  my $cuerpoXML= renderCuerpo(@salida);
  print renderXML($cuerpoXML);

}else{
  print renderXML(@salida);
}
