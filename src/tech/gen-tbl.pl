#!/usr/bin/perl
#
# $Id: gen-tbl.pl,v 1.2 1999/11/20 23:55:35 kunishi Exp $

use strict;
use vars qw(%HTML4symtab $line);

# symbols defined in HTMLlat1.ent, in HTML 4.0.
%HTML4symtab = ();

&construct_symbol_table();

&print_xml_decl;
print '<tbody>' . "\n";
while (<>) {
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
    if (/^<!ENTITY\s(.*)\s+"&(.*;)">\s+<!-- (.*) -->$/) {
	print '<tr>' . "\n";
	&printtd('&' . $2);
	&printtd('&amp;' . $1 . ';');
	&printtd('&amp;' . $2);
	&printtd($3);
	if ($HTML4symtab{$1}) {
	    &printtd('&circ;');
	} else {
	    &printtd('');
	}
	print '</tr>' . "\n";
    }
}
print '</tbody>' . "\n";

sub construct_symbol_table() {
    my @HTMLents = ('HTMLlat1.ent', 'HTMLspecial.ent');
    my $line;
    foreach my $HTMLent (@HTMLents) {
	open(FILE, $HTMLent);
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
		$HTML4symtab{$1} = $3;
	    }
	}
    }
}

sub print_xml_decl() {
    print '<?xml version="1.0" encoding="utf-8"?>' . "\n";
}

sub printtd($) {
    my $data = shift;
    print '<td rowspan="1" colspan="1">' . $data . '</td>' . "\n";
}

