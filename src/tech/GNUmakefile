# 
# $Id: GNUmakefile,v 1.7 2000/12/25 14:24:02 kunishi Exp $
# 

ENT2XML=	${SCRIPTDIR}/gen-char-table.pl

DOCBOOK_ENTDIR=	/usr/local/share/xml/dtd/docbook/ent
ENTXMLFILES=	iso-lat1.xml iso-lat2.xml iso-cyr1.xml iso-cyr2.xml

include ${SRCTOPDIR}/config.mk
include ${SRCTOPDIR}/rule.mk

%.xml:	${DOCBOOK_ENTDIR}/%.ent
	${ENT2XML} $< > $@
