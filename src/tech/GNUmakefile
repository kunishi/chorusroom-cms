# 
# $Id: GNUmakefile,v 1.9 2001/01/04 01:09:48 kunishi Exp $
# 

USE_NEW_SCHEME=	yes

ENT2XML=	${SCRIPTDIR}/gen-char-table.pl

DOCBOOK_ENTDIR=	/usr/local/share/xml/docbook/ent
ENTXMLFILES=	iso-lat1.xml iso-lat2.xml iso-cyr1.xml iso-cyr2.xml

%.xml:	${DOCBOOK_ENTDIR}/%.ent
	${ENT2XML} $< > $@

all:

pre-all:	${ENTXMLFILES}

all-chars.html:	DEFAULT_XSL=${XSLDIR}/all-chars.xsl

include config.mk
include rule.mk
