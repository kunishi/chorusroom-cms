# 
# $Id: GNUmakefile,v 1.9 2001/01/09 10:12:18 kunishi Exp $
#

USE_NEW_SCHEME=	yes

INSTFILES+=	index.html
INSTFILES+=	info-note.html
INSTFILES+=	template-taikai.txt template-dantai.txt

SUBDIR+=	47th
SUBDIR+=	48th
SUBDIR+=	49th
SUBDIR+=	50th
SUBDIR+=	51st
SUBDIR+=	52nd
SUBDIR+=	53rd

include ${SRCTOPDIR}/config.mk
include ${SRCTOPDIR}/rule.mk

# template
template-taikai.txt: %.txt : %.xml
	${CP} $< $@

template-dantai.txt: %.txt : %.xml
	${CP} $< $@
