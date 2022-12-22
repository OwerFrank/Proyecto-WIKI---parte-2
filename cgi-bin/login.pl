#!/usr/bin/perl -w
use strict;
use warnings;
use CGI;
use DBI;

my $q = CGI->new;
print $q->header('text/xml;charset=UTF-8');

my $user = $q->param('user');
my $password = $q->param('password');

print STDERR "$user\n";
print STDERR "$password\n";
my @respuesta;
if(defined($user) and defined($password)){
  @respuesta =checkLogin($user, $password);
  print STDERR "len ".scalar(@respuesta)."\n";
  print STDERR "salida :@respuesta\n";
  print STDERR "Se ingre todos los capos\n";
  if(checkLogin($user, $password)){
    print STDERR "@respuesta\n";
    my $cuerpoXML =renderCuerpo(@respuesta);
    print renderXML($cuerpoXML);
  }else{
    print STDERR "no hay coincidecnias\n";
    print renderXML('Hola segundo');

  }


}else{
  print STDERR "No ingreso los dos datos\n";
  print renderXML('Hola');
}
