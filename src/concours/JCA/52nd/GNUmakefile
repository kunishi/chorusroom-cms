# Makefile for 
# Copyright (C) 1999 KUNISHIMA Takeo <kunishi@c.oka-pu.ac.jp>
#
# $Id: GNUmakefile,v 1.28 1999/09/27 06:20:09 kunishi Exp $

RELPATH=	JCA-concours/52nd
SRCTOPDIR=	../../
UTFTOEUC=	hutrans | tcs -f utf -t ujis
EUCTOJIS=	nkf

INSTFILES+=	index.html index.utfhtml
INSTFILES+=	aichi.html aichi.utfhtml
INSTFILES+=	chiba.html chiba.utfhtml
INSTFILES+=	chubu.html chubu.utfhtml
INSTFILES+=	chugoku.html chugoku.utfhtml
INSTFILES+=	fukuoka.html fukuoka.utfhtml
INSTFILES+=	fukushima.html fukushima.utfhtml
INSTFILES+=	hyogo.html hyogo.utfhtml
INSTFILES+=	kagoshima.html kagoshima.utfhtml
INSTFILES+=	kanagawa.html kanagawa.utfhtml
INSTFILES+=	kansai.html kansai.utfhtml
INSTFILES+=	kyushu.html kyushu.utfhtml
INSTFILES+=	mie.html mie.utfhtml
INSTFILES+=	miyagi.html miyagi.utfhtml
INSTFILES+=	shizuoka.html shizuoka.utfhtml
INSTFILES+=	tohoku.html tohoku.utfhtml
INSTFILES+=	yamagata.html yamagata.utfhtml

include ${SRCTOPDIR}/config.mk

RESULT_XSL=		result-iso2022jp.xsl
RESULT_XSL_UTF8=	result-utf8.xsl
DEFAULT_XSL=		${RESULT_XSL}
DEFAULT_XSL_UTF8=	${RESULT_XSL_UTF8}

include ${SRCTOPDIR}/rule.mk

index.html: %.html : %.xml ${XHTML10_XSL}
	${ENV} ${MAKE_ENV} ${XSLT_PROC} $< ${XHTML10_XSL} > $@

index.utfhtml: %.utfhtml : %.utfxml ${XHTML10_XSL_UTF8}
	${ENV} ${MAKE_ENV} ${XSLT_PROC} $< ${XHTML10_XSL_UTF8} > $@
