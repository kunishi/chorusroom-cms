# 
# $Id: GNUmakefile,v 1.10 2001/02/06 08:18:28 kunishi Exp $
# 

USE_NEW_SCHEME=	yes

ENT2XML=	${SCRIPTDIR}/gen-char-table.pl

DOCBOOK_ENTDIR=	/usr/local/share/xml/docbook/ent
ENTXMLFILES=	iso-lat1.xml iso-lat2.xml iso-cyr1.xml iso-cyr2.xml

%.xml:	${DOCBOOK_ENTDIR}/%.ent
	${ENT2XML} $< > $@

all:

prepare-build:	${ENTXMLFILES} all-chars-extracted.xml

prepare:

clean:
	rm -f ${ENTXMLFILES} all-chars-extracted.xml 

all-chars-extracted.xml:	DEFAULT_XSL=${XSLDIR}/gen-all-chars.xsl
all-chars-extracted.xml:	all-chars.xml
	${XSLT_PROC} -in $< -xsl ${DEFAULT_XSL} ${XSLT_OUT}

all-chars.html:	DEFAULT_XSL=${XSLDIR}/all-chars.xsl

include config.mk
include rule.mk
