# 
# $Id: GNUmakefile,v 1.7 2000/08/25 08:22:12 kunishi Exp $
#

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
