#
# $Id: GNUmakefile,v 1.1 2000/12/26 16:22:10 kunishi Exp $
#

jca-comp-result.dtd:	jca-comp-result.rxg
	relaxer -dtd -validation:none -tagPrefix:-,p,cr $<

xhtml1-chorusroom.dtd:	xhtml1-chorusroom.rxg
	relaxer -dtd -validation:none -tagPrefix:-,cr $<

char-table.dtd:	char-table.rxm
	relaxer -dtd $<

###
jca-comp-result.rxg:	jca-comp-result.rxm
jca-comp-result.rxg:	contest-result.rxm
jca-comp-result.rxg:	choir-piece.rxm
jca-comp-result.rxg:	utf8-char.rxm
jca-comp-result.rxg:	characters.rxm
xhtml1-chorusroom.rxg:	xhtml1-strict.rxm
xhtml1-chorusroom.rxg:	utf8-char.rxm
xhtml1-chorusroom.rxg:	characters.rxm
