# 
# $Id: GNUmakefile,v 1.8 2001/01/01 01:51:48 kunishi Exp $
# 

ENT2XML=	${SCRIPTDIR}/gen-char-table.pl

DOCBOOK_ENTDIR=	/usr/local/share/xml/docbook/ent
ENTXMLFILES=	iso-lat1.xml iso-lat2.xml iso-cyr1.xml iso-cyr2.xml

include config.mk
include rule.mk

all:

pre-all:	${ENTXMLFILES}

%.xml:	${DOCBOOK_ENTDIR}/%.ent
	${ENT2XML} $< > $@
