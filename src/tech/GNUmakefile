# 
# $Id: GNUmakefile,v 1.6 2000/10/10 15:40:45 kunishi Exp $
# 

ENT2XML=	./gen-tbl.pl

ENTXMLFILES=	iso-lat1.xml iso-lat2.xml iso-cyr1.xml iso-cyr2.xml

INSTFILES+=	char-ent.utfhtml

include ${SRCTOPDIR}/config.mk

char-ent.utfhtml:	char-ent.xml ${ENTXMLFILES}

include ${SRCTOPDIR}/rule.mk

%.xml:	%.ent
	${ENT2XML} < $< > $@
