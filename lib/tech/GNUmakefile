# 
# $Id: GNUmakefile,v 1.2 1999/11/20 23:44:34 kunishi Exp $
# 

RELPATH=	tech
SRCTOPDIR=	../

ENT2XML=	./gen-tbl.pl

include ${SRCTOPDIR}config.mk
include ${SRCTOPDIR}rule.mk

%.xml:	%.ent
	${ENT2XML} < $< > $@
