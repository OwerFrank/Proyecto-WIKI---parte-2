#!/usr/bin/perl -w
use strict;
use warnings;
use CGI;
use DBI;

my $q =CGI->new;
print $q->header('text/xml; charset=UTF-8');
my $owner = $q->param('owner');
my $title = $q->param('title');

print STDERR "$owner.$title";

if(defined($owner) and defined($title)){
  print STDERR "campos llenos\n";
  my @articles =buscarBD($owner, $title);
  if(@articles){       #si ha encontrado , entonces procedera a eliminar
    print STDERR "se borraa@articles";
    my $renderCuerpo= renderCuerpo($owner, $title);
    print renderXML($renderCuerpo);
    eliminarBD($owner, $title);

  }else{
    print STDERR "no existe esos datos\n";
    print renderXML();
  }
}else{
  print STDERR "no lleno nada\n";
  print renderXML();
}
