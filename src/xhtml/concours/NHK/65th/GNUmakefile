#
# $Id: GNUmakefile,v 1.5 2001/04/02 06:59:06 kunishi Exp $
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

${INSTFILES_UTF8}: DEFAULT_XSL=${XSLDIR}/nhk-contest-result.utf8.xsl
${INSTFILES_UTF8}: XSLT_PARAMS+=-param "output-base" "$(basename $@)"

include config.mk
include rule.mk
