#
# $Id: GNUmakefile,v 1.4 2001/01/03 12:32:58 kunishi Exp $
#

GEN_DTDS_NONS=	char-table.dtd
GEN_DTDS_NS=	contest-result-generic.dtd \
		jca-comp-result.dtd \
		nhk-contest-result.dtd \
		xhtml1-chorusroom.dtd \
		given-programs.dtd
GEN_RELAX_MODULES=	characters.rxm

all:

pre-all:	${GEN_DTDS_NONS} ${GEN_RELAX_MODULES} ${GEN_DTDS_NS}

contest-result-generic.dtd:	contest-result-generic.rxg
	relaxer -dtd -validation:none -tagPrefix:-,p,cr $<

jca-comp-result.dtd:	jca-comp-result.rxg
	relaxer -dtd -validation:none -tagPrefix:-,p,cr $<

nhk-contest-result.dtd:	nhk-contest-result.rxg
	relaxer -dtd -validation:none -tagPrefix:-,p,cr $<

xhtml1-chorusroom.dtd:	xhtml1-chorusroom.rxg
	relaxer -dtd -validation:none -tagPrefix:-,cr $<

given-programs.dtd:	given-programs.rxg
	relaxer -dtd -validation:none -tagPrefix:-,p,cr $<

char-table.dtd:	char-table.rxm
	relaxer -dtd $<

characters.rxm:	../tech/all-chars.xml
	${ENV} ${JAVA_ENV} ${XSLT_PROC} -in $< -xsl ../xsl/gen-char-relax.xsl ${XSLT_OUT} ${XSLT_PARAMS}

clean:
	${RM} ${GEN_RELAX_MODULES} ${GEN_DTDS_NONS} ${GEN_DTDS_NS}

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
