# 
# $Id: Makefile,v 1.4 1999/12/18 14:25:41 kunishi Exp $
# 

ENT2XML=	./gen-tbl.pl

ENTXMLFILES=	iso-lat1.xml iso-lat2.xml iso-cyr1.xml iso-cyr2.xml

include ${SRCTOPDIR}/config.mk

char-ent.utfhtml:	char-ent.xml ${ENTXMLFILES}

include ${SRCTOPDIR}/rule.mk

%.xml:	%.ent
	${ENT2XML} < $< > $@
