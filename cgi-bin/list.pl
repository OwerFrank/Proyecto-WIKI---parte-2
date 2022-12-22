#!/usr/bin/perl -w
use strict;
use warnings;
use CGI;
use DBI;

my $q = CGI->new;
print $q->header('text/xml; charset=UTF-8');

my $owner = $q->param('owner');
print STDERR "$owner\n";

if(defined($owner)){
  my @articles = buscarBD($owner);
  if(@articles){
    print STEDERR "@articles";
    push(@articles, $owner);
    my  $articlesXML =renderCuerpo(@articles);
    print STDERR  "$articlesXML";
    print renderXML($articlesXML);

  }else{
    print STDERR "no se encontro dicho dato\n";
    print renderXML();
  }
}else{
  print STDERR "nose ingreso datos\n";
  print renderXML();
}
