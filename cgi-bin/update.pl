#!/usr/bin/perl -w
use strict;
use warnings;
use CGI;
use DBI;

my $q = CGI->new;
print $q->header('text/xml;  charset= UTF-8A');

my $title =$q->param('title');
my $text = $q->param('text');
my $owner = $q->param('owner');

print STDERR "$title,$text,$owner\n";

my @salidaConsulta;
if(defined($title) and defined($owner)){
  print STDERR "se lleno los campos necesarioo\n";
  @salidaConsulta =buscarBD($owner, $title);
  if(@salidaConsulta){
    print STDERR "se procedera a insertar nuevo texto";
    insertBD($owner, $title, $text);
    my @textModif = insertBD($owner, $title, $text);
    push(@textModif, $title);
    print STDERR @textModif;
    my $cuerpoXML =renderCuerpo(@textModif);
    print renderXML($cuerpoXML);
  }else{
    print STDERR "no se encontro dichos datos\n";
    print renderXML();
  }
}else{
  print STDERR "No lleno todos los campos\n";
  print renderXML();
}
