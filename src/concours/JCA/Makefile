# 
# $Id: Makefile,v 1.5 1999/12/18 14:24:43 kunishi Exp $
#

INSTFILES+=	index.html
INSTFILES+=	info-note.html
INSTFILES+=	template-taikai.txt template-dantai.txt

SUBDIR+=	52nd

include ${SRCTOPDIR}/config.mk
include ${SRCTOPDIR}/rule.mk

# template
template-taikai.txt: %.txt : %.xml
	${CP} $< $@

template-dantai.txt: %.txt : %.xml
	${CP} $< $@
