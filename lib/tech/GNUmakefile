# 
# $Id: GNUmakefile,v 1.5 2000/08/23 05:06:58 kunishi Exp $
# 

ENT2XML=	./gen-tbl.pl

ENTXMLFILES=	iso-lat1.xml iso-lat2.xml iso-cyr1.xml iso-cyr2.xml

INSTFILES+=	char-ent.utfhtml

include ${SRCTOPDIR}/config.mk

char-ent.utfhtml:	char-ent.xml ${ENTXMLFILES}

include ${SRCTOPDIR}/rule.mk

%.xml:	%.ent
	${ENT2XML} < $< > $@
