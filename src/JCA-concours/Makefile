# 
# $Id: Makefile,v 1.6 2000/07/17 15:26:06 kunishi Exp $
#

INSTFILES+=	index.html
INSTFILES+=	info-note.html
INSTFILES+=	template-taikai.txt template-dantai.txt

SUBDIR+=	52nd
SUBDIR+=	53rd

include ${SRCTOPDIR}/config.mk
include ${SRCTOPDIR}/rule.mk

# template
template-taikai.txt: %.txt : %.xml
	${CP} $< $@

template-dantai.txt: %.txt : %.xml
	${CP} $< $@
