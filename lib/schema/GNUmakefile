#
# $Id: GNUmakefile,v 1.10 2002/01/26 04:53:24 kunishi Exp $
#

GEN_DTDS_NONS=	char-table.dtd
GEN_DTDS_NS=	contest-result-generic.dtd \
		jca-comp-result.dtd \
		nhk-contest-result.dtd \
		xhtml1-chorusroom.dtd \
		given-programs.dtd \
		resource.dtd \
		choir.dtd
GEN_RELAX_MODULES=	characters.rxm

INSTFILES=	${GEN_DTDS_NONS} ${GEN_DTDS_NS}

CONTEST_AUX_RXM=	characters.rxm \
			choir-piece.rxm \
			utf8-char.rxm \
			contest-result.rxm

all:

prepare-build:	${GEN_DTDS_NONS} ${GEN_RELAX_MODULES} ${GEN_DTDS_NS}

prepare:	install

contest-result-generic.dtd:	contest-result-generic.rxg
contest-result-generic.dtd:	${CONTEST_AUX_RXM}
	relaxer -dtd -tagPrefix:-,p,cr $(@:%.dtd=%.rxg)
	cat contest.aux.dtd >> $@

jca-comp-result.dtd:	jca-comp-result.rxg
jca-comp-result.dtd:	jca-comp-result.rxm
jca-comp-result.dtd:	${CONTEST_AUX_RXM}
	relaxer -dtd -tagPrefix:-,p,cr $(@:%.dtd=%.rxg)
	cat contest.aux.dtd >> $@

nhk-contest-result.dtd:	nhk-contest-result.rxg
nhk-contest-result.dtd:	nhk-contest-result.rxm
nhk-contest-result.dtd:	${CONTEST_AUX_RXM}
	relaxer -dtd -tagPrefix:-,p,cr $(@:%.dtd=%.rxg)
	cat contest.aux.dtd >> $@

xhtml1-chorusroom.dtd:	xhtml1-chorusroom.rxg
	relaxer -dtd -tagPrefix:-,cr,r $(@:%.dtd=%.rxg)
	cat $(@:%.dtd=%.aux.dtd) >> $@

given-programs.dtd:	given-programs.rxg
	relaxer -dtd -tagPrefix:-,p,cr $(@:%.dtd=%.rxg)
	cat $(@:%.dtd=%.aux.dtd) >> $@

choir.dtd:	choir.rxg choir.rxm utf8-char.rxm
	relaxer -dtd -tagPrefix:c,cr $(@:%.dtd=%.rxg)
	cat $(@:%.dtd=%.aux.dtd) >> $@

char-table.dtd:	char-table.rxm
	relaxer -dtd $(@:%.dtd=%.rxm)
	cat $(@:%.dtd=%.aux.dtd) >> $@

resource.dtd:	resource.rxm
	relaxer -dtd $(@:%.dtd=%.rxm)
	cat $(@:%.dtd=%.aux.dtd) >> $@

characters.rxm:	../tech/all-chars.xml
	${ENV} ${JAVA_ENV} ${XSLT_PROC} -in $< -xsl ../xsl/gen-char-relax.xsl ${XSLT_OUT} ${XSLT_PARAMS}

realclean:	clean
	${RM} ${GEN_RELAX_MODULES}

include config.mk
include rule.mk

###
xhtml1-chorusroom.rxg:	xhtml1-strict.rxm
xhtml1-chorusroom.rxg:	utf8-char.rxm
xhtml1-chorusroom.rxg:	characters.rxm
