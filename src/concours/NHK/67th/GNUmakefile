#
# $Id: GNUmakefile,v 1.4 2001/01/12 12:03:10 kunishi Exp $
#

USE_NEW_SCHEME=	yes

INSTFILES_TRADITIONAL+=	aichi.html
INSTFILES_TRADITIONAL+=	aomori.html
INSTFILES_TRADITIONAL+=	asahikawa.html
INSTFILES_TRADITIONAL+=	fukuoka.html
INSTFILES_TRADITIONAL+=	yamaguchi.html
INSTFILES_UTF8=		${INSTFILES_TRADITIONAL:%.html=%.utfhtml}

INSTFILES+=	index.html
INSTFILES+=	${INSTFILES_TRADITIONAL} ${INSTFILES_UTF8}

${INSTFILES_TRADITIONAL}: DEFAULT_XSL=${XSLDIR}/nhk-contest-result.traditional.xsl
${INSTFILES_TRADITIONAL}: XSLT_PARAMS+=-param "output-base" "'$(basename $@)'"
${INSTFILES_TRADITIONAL}: XSLT_OUT=-out /dev/null

${INSTFILES_UTF8}: DEFAULT_XSL=${XSLDIR}/nhk-contest-result.utf8.xsl
${INSTFILES_UTF8}: XSLT_PARAMS+=-param "output-base" "'$(basename $@)'"
${INSTFILES_UTF8}: XSLT_OUT=-out /dev/null

include config.mk
include rule.mk
