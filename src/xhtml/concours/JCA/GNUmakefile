# 
# $Id: GNUmakefile,v 1.4 1999/08/30 02:45:02 kunishi Exp $
#

RELPATH=	JCA-concours
SRCTOPDIR=	../

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
