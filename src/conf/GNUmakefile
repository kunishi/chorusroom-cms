#
# $Id: GNUmakefile,v 1.1 2000/11/16 15:55:18 kunishi Exp $
#

INSTFILES+=	Makefile.dist

ifneq (${USE_NAMAZU1},yes)
INSTFILES+=	namazurc
endif

include ${SRCTOPDIR}config.mk
include ${SRCTOPDIR}rule.mk

Makefile.dist:	Makefile.dist.in
	${SED}  -e 's|%%PUBLIC_DIR%%|${PUBLIC_DIR}|g' \
		-e 's|%%NAMAZU_INDEX_DIR%%|${NAMAZU_INDEX_DIR}|g' \
		-e 's|%%GCNMZ%%|${GCNMZ}|g' \
		$< > $@

ifneq (${USE_NAMAZU1},yes)
namazurc:	namazurc.v2.in
	${SED}  -e 's|%%PUBLIC_DIR%%|${PUBLIC_DIR}|g' \
		-e 's|%%NAMAZU_INDEX_DIR%%|${NAMAZU_INDEX_DIR}|g' \
		-e 's|%%TOP_URL%%|${TOP_URL}|g' \
		$< > $@
endif
