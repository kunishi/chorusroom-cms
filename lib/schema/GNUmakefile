#
# $Id: GNUmakefile,v 1.2 2001/01/01 01:53:18 kunishi Exp $
#

GEN_DTDS=	jca-comp-result.dtd \
		xhtml1-chorusroom.dtd \
		char-table.dtd

all:

pre-all:	${GEN_DTDS}

jca-comp-result.dtd:	jca-comp-result.rxg
	relaxer -dtd -validation:none -tagPrefix:-,p,cr $<

xhtml1-chorusroom.dtd:	xhtml1-chorusroom.rxg
	relaxer -dtd -validation:none -tagPrefix:-,cr $<

char-table.dtd:	char-table.rxm
	relaxer -dtd $<

characters.rxm:	../tech/all-chars.xml
	${ENV} ${JAVA_ENV} ${XSLT_PROC} -in $< -xsl ../xsl/gen-char-relax.xsl ${XSLT_OUT} ${XSLT_PARAMS}

include config.mk
include rule.mk

###
jca-comp-result.rxg:	jca-comp-result.rxm
jca-comp-result.rxg:	contest-result.rxm
jca-comp-result.rxg:	choir-piece.rxm
jca-comp-result.rxg:	utf8-char.rxm
jca-comp-result.rxg:	characters.rxm
xhtml1-chorusroom.rxg:	xhtml1-strict.rxm
xhtml1-chorusroom.rxg:	utf8-char.rxm
xhtml1-chorusroom.rxg:	characters.rxm
