#!/usr/bin/perl
#
# $Id: gen-char-table.pl,v 1.4 2001/02/06 08:18:28 kunishi Exp $

use strict;
use vars qw(%entity_tab @docbook_ents
            $html_dtd_dir @html_ents
            $local_ent_dir @local_ents
            $line);

# symbols defined in HTMLlat1.ent, in HTML 4.0.
%entity_tab = ();

@docbook_ents = ('iso-amsa.ent',
		 'iso-amsb.ent',
		 'iso-amsc.ent',
		 'iso-amsn.ent',
		 'iso-amso.ent',
		 'iso-box.ent',
		 'iso-cyr1.ent',
		 'iso-cyr2.ent',
		 'iso-dia.ent',
		 'iso-grk1.ent',
		 'iso-grk2.ent',
		 'iso-grk3.ent',
		 'iso-grk4.ent',
		 'iso-lat1.ent',
		 'iso-lat2.ent',
		 'iso-num.ent',
		 'iso-pub.ent',
		 'iso-tech.ent');

$html_dtd_dir = "/usr/local/share/sgml/html/4.01/";
@html_ents = ('HTMLlat1.ent', 'HTMLspecial.ent');

$local_ent_dir = $ENV{'HOME'} . "/cvs/xml/www/chorusRoom/tech/";
@local_ents = ('html-special-chars.txt');

#&construct_symbol_table();

&print_xml_decl;
print '<characters xmlns="http://www.chorusroom.org/character">' . "\n";

open(DOCBK_ENT, @ARGV[0])
  || print STDERR "cannot open @ARGV[0]";
while (<DOCBK_ENT>) {
    chop;
    if (!/-->$/) {
	s/^\s+/ /;
	$line = $line . $_;
	next;
    }
    if (/-->$/ && $line) {
	s/^\s+/ /;
	$_ = $line . $_;
	$line = '';
    }
    if (/^<!ENTITY\s(.*)\s+"&#(x[0-9A-F]*);">\s+<!-- (.*) -->$/) {
	&print_char_entry($1, $2, $3);
    }
}
print '</characters>' . "\n";

sub construct_symbol_table() {
    my $line;
    my %local_ent_table;
    my $entname;
    my $entvalue;

    foreach my $local_ent (@local_ents) {
	open (LOCAL_ENT, $local_ent_dir . $local_ent)
	  || print STDERR "cannot open file " . $local_ent_dir . $local_ent;
	while (<LOCAL_ENT>) {
	    chop;
	    ($entname, $entvalue) = split(/\t/, $_);
	    $local_ent_table{$entname} = $entvalue;
	}
    }

    foreach my $table (@html_ents) {
	open(FILE, $html_dtd_dir . $table)
	  || print STDERR "cannot open " . $html_dtd_dir . $table;
	while (<FILE>) {
	    chop;
	    if (!/-->$/) {
		s/^\s+/ /;
		$line = $line . $_;
		next;
	    }
	    if (/-->$/ && $line) {
		s/^\s+/ /;
		$_ = $line . $_;
		$line = '';
	    }
	    if (/^<!ENTITY\s(\w+)\s+CDATA\s+"&(.*;)"\s+-- (.*) -->$/) {
		if ($local_ent_table{$1}) {
		    $entity_tab{$1} = $local_ent_table{$1};
		} else {
		    $entity_tab{$1} = $2;
		}
	    }
	}
    }
}

sub print_xml_decl() {
    print '<?xml version="1.0" encoding="utf-8"?>' . "\n";
}

sub print_char_entry($$$) {
    my $data = shift;
    my $alternative;
    if ($entity_tab{$1}) {
	$alternative = $entity_tab{$1};
    } else {
	$alternative = "[$1]";
    }
    print '<character ' .
	  "utf8-codepoint=\"$2\" " .
	  "nickname=\"$1\" " .
	  "description=\"$3\" " .
	  "alternative=\"$alternative\"" .
	  '/>' . "\n";
}

