# 
# $Id: Makefile,v 1.3 1999/08/30 02:09:07 kunishi Exp $
#

RELPATH=	JCA-concours
SRCTOPDIR=	../

INSTFILES+=	index.html
INSTFILES+=	template-taikai.txt template-dantai.txt

SUBDIR+=	52nd

include ${SRCTOPDIR}/config.mk
include ${SRCTOPDIR}/rule.mk

# template
template-taikai.txt: %.txt : %.xml
	${CP} $< $@

template-dantai.txt: %.txt : %.xml
	${CP} $< $@
