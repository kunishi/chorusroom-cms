#
# $Id: GNUmakefile,v 1.7 2001/01/12 13:01:33 kunishi Exp $
#

GEN_DTDS_NONS=	char-table.dtd
GEN_DTDS_NS=	contest-result-generic.dtd \
		jca-comp-result.dtd \
		nhk-contest-result.dtd \
		xhtml1-chorusroom.dtd \
		given-programs.dtd \
		resource.dtd
GEN_RELAX_MODULES=	characters.rxm

INSTFILES=	${GEN_DTDS_NONS} ${GEN_DTDS_NS}

all:

pre-all:	${GEN_DTDS_NONS} ${GEN_RELAX_MODULES} ${GEN_DTDS_NS}

contest-result-generic.dtd:	contest-result-generic.rxg
	relaxer -dtd -validation:none -tagPrefix:-,p,cr $<

jca-comp-result.dtd:	jca-comp-result.rxg
	relaxer -dtd -validation:none -tagPrefix:-,p,cr $<

nhk-contest-result.dtd:	nhk-contest-result.rxg
	relaxer -dtd -validation:none -tagPrefix:-,p,cr $<

xhtml1-chorusroom.dtd:	xhtml1-chorusroom.rxg
	relaxer -dtd -validation:none -tagPrefix:-,cr,r $<

given-programs.dtd:	given-programs.rxg
	relaxer -dtd -validation:none -tagPrefix:-,p,cr $<

char-table.dtd:	char-table.rxm
	relaxer -dtd $<

resource.dtd:	resource.rxm
	relaxer -dtd $<

characters.rxm:	../tech/all-chars.xml
	${ENV} ${JAVA_ENV} ${XSLT_PROC} -in $< -xsl ../xsl/gen-char-relax.xsl ${XSLT_OUT} ${XSLT_PARAMS}

realclean:	clean
	${RM} ${GEN_RELAX_MODULES}

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
