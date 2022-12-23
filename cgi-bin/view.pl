#!/usr/bin/perl -w
use strict;
use warnings;
use CGI;
use DBI;

my $q = CGI->new;
print $q->header('text/xml; charset= UTF-8');

my $owner = $q->param('owner');
my $title = $q->param('title');


print STDERR "$owner $title\n";

my @articlesTex;
if(defined($owner) and defined($title)){
  print STDERR  "se ingreo todos los campos requeridos\n";
  @articlesTex = buscarBD($owner, $title);
  print STDERR "@articlesTex\n";
  print STDERR "tamño de salida de BD";
  
  print STDERR scalar(@articlesTex);
  if(@articlesTex){
    print STDERR  "se encontAo su texto\n";
    print STDERR "este es el texto a cambiar@articlesTex\n";
    my @lineasArticles = split(/\s*\n\s*/,$articlesTex[0]);
    print "  ";
    print interpretar(@lineasArticles);

  }else{
    print STDERR " no se encontAre su texto, revise eus datos\n";
  }
}else{
  print STDERR  "no se lleno todos los campos\n";
}
