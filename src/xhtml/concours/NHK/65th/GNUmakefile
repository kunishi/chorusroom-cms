#
# $Id: GNUmakefile,v 1.6 2001/08/07 02:12:26 kunishi Exp $
#

USE_NEW_SCHEME=	yes

INSTFILES_TRADITIONAL+=	asahikawa.html \
			hokkaido.html \
			${NATIONAL_HTML} \
			sapporo.html
NATIONAL_HTML=		national-junior-highschool.html \
			national-senior-highschool.html
.INTERMEDIATE:		${NATIONAL_HTML:%.html=%.xml}

INSTFILES_UTF8=		${INSTFILES_TRADITIONAL:%.html=%.utfhtml}

INSTFILES+=	index.html
INSTFILES+=	${INSTFILES_TRADITIONAL} ${INSTFILES_UTF8}

${INSTFILES_TRADITIONAL}: DEFAULT_XSL=${XSLDIR}/nhk-contest-result.traditional.xsl
${INSTFILES_TRADITIONAL}: XSLT_PARAMS+=-param "output-base" "$(basename $@)"

${INSTFILES_UTF8}: DEFAULT_XSL=${XSLDIR}/nhk-contest-result.utf8.xsl
${INSTFILES_UTF8}: XSLT_PARAMS+=-param "output-base" "$(basename $@)"

include config.mk
include rule.mk

${NATIONAL_HTML:%.html=%.xml}:	national.xml
	${LN_S} $< $@
