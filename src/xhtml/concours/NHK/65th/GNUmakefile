#
# $Id: GNUmakefile,v 1.4 2001/02/06 02:30:00 kunishi Exp $
#

USE_NEW_SCHEME=	yes

INSTFILES_TRADITIONAL+=	asahikawa.html \
			hokkaido.html \
			national.html \
			sapporo.html
INSTFILES_UTF8=		${INSTFILES_TRADITIONAL:%.html=%.utfhtml}

INSTFILES+=	index.html
INSTFILES+=	${INSTFILES_TRADITIONAL} ${INSTFILES_UTF8}

${INSTFILES_TRADITIONAL}: DEFAULT_XSL=${XSLDIR}/nhk-contest-result.traditional.xsl
${INSTFILES_TRADITIONAL}: XSLT_PARAMS+=-param "output-base" "$(basename $@)"
${INSTFILES_TRADITIONAL}: XSLT_OUT=-out /dev/null

${INSTFILES_UTF8}: DEFAULT_XSL=${XSLDIR}/nhk-contest-result.utf8.xsl
${INSTFILES_UTF8}: XSLT_PARAMS+=-param "output-base" "$(basename $@)"
${INSTFILES_UTF8}: XSLT_OUT=-out /dev/null

include config.mk
include rule.mk
