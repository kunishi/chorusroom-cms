#
# $Id: GNUmakefile,v 1.2 2001/02/28 01:27:49 kunishi Exp $
#

USE_NEW_SCHEME=	yes

INSTFILES_TRADITIONAL+=	asahikawa.html \
			sapporo.html \
			${NATIONAL_HTML}
INSTFILES_UTF8=		${INSTFILES_TRADITIONAL:%.html=%.utfhtml}

NATIONAL_HTML=		nationa-1997-10-12.html

INSTFILES+=	index.html
INSTFILES+=	${INSTFILES_TRADITIONAL} ${INSTFILES_UTF8}

REDIRECT_HTML=	${NATIONAL_HTML}

${INSTFILES_TRADITIONAL}: DEFAULT_XSL=${XSLDIR}/nhk-contest-result.traditional.xsl
${INSTFILES_TRADITIONAL}: XSLT_PARAMS+=-param "output-base" "$(basename $@)"
${INSTFILES_TRADITIONAL}: XSLT_OUT=-out /dev/null

${INSTFILES_UTF8}: DEFAULT_XSL=${XSLDIR}/nhk-contest-result.utf8.xsl
${INSTFILES_UTF8}: XSLT_PARAMS+=-param "output-base" "$(basename $@)"
${INSTFILES_UTF8}: XSLT_OUT=-out /dev/null

include config.mk
include rule.mk

.INTERMEDIATE:	${REDIRECT_HTML:%.html=%.xml}

###

${NATIONAL_HTML:%.html=%.xml}:	national.xml
	${LN_S} $< $@