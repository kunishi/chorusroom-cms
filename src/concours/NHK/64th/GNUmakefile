#
# $Id: GNUmakefile,v 1.4 2001/04/02 06:59:03 kunishi Exp $
#

USE_NEW_SCHEME=	yes

INSTFILES_TRADITIONAL+=	asahikawa.html \
			sapporo.html \
			${NATIONAL_HTML}
INSTFILES_UTF8=		${INSTFILES_TRADITIONAL:%.html=%.utfhtml}

NATIONAL_HTML=		national-1997-10-12.html

INSTFILES+=	index.html
INSTFILES+=	${INSTFILES_TRADITIONAL} ${INSTFILES_UTF8}

REDIRECT_HTML=	${NATIONAL_HTML}

${INSTFILES_TRADITIONAL}: DEFAULT_XSL=${XSLDIR}/nhk-contest-result.traditional.xsl
${INSTFILES_TRADITIONAL}: XSLT_PARAMS+=-param "output-base" "$(basename $@)"

${INSTFILES_UTF8}: DEFAULT_XSL=${XSLDIR}/nhk-contest-result.utf8.xsl
${INSTFILES_UTF8}: XSLT_PARAMS+=-param "output-base" "$(basename $@)"

include config.mk
include rule.mk

.INTERMEDIATE:	${REDIRECT_HTML:%.html=%.xml}

###

${NATIONAL_HTML:%.html=%.xml}:	national.xml
	${LN_S} $< $@