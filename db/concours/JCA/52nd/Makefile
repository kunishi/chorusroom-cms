# Makefile for 
# Copyright (C) 1999 KUNISHIMA Takeo <kunishi@c.oka-pu.ac.jp>
#
# $Id: Makefile,v 1.5 1999/08/06 02:41:00 kunishi Exp $

RELPATH=	JCA-concours/52nd
SRCTOPDIR=	../../

RESULT_XSL=	result-1999.xsl

INSTFILES+=	index.html
INSTFILES+=	fukuoka.html

include ${SRCTOPDIR}/config.mk
include ${SRCTOPDIR}/rule.mk

fukuoka.utfhtml: %.utfhtml : %.xml ${RESULT_XSL}
	${XSLT_PROC} $< ${RESULT_XSL} > $@
