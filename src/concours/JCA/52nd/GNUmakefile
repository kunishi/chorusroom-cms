# Makefile for 
# Copyright (C) 1999 KUNISHIMA Takeo <kunishi@c.oka-pu.ac.jp>
#
# $Id: GNUmakefile,v 1.6 1999/08/17 06:12:45 kunishi Exp $

RELPATH=	JCA-concours/52nd
SRCTOPDIR=	../../

RESULT_XSL=	result-1999.xsl

INSTFILES+=	index.html
INSTFILES+=	fukuoka.html

include ${SRCTOPDIR}/config.mk
include ${SRCTOPDIR}/rule.mk

fukuoka.html: %.html : %.xml ${RESULT_XSL}
	${XSLT_PROC} $< ${RESULT_XSL} > $@
