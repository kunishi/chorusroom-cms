#
# $Id: GNUmakefile,v 1.4 2001/01/03 08:20:40 kunishi Exp $
#

USE_NEW_SCHEME=	yes

INSTFILES+=	index.html
INSTFILES_TRADITIONAL=	kovox-1997.html kovox-2000.html
INSTFILES_UTF8=		${INSTFILES_TRADITIONAL:%.html=%.utfhtml}
INSTFILES+=	${INSTFILES_TRADITIONAL} ${INSTFILES_UTF8}

${INSTFILES_TRADITIONAL}:	DEFAULT_XSL=${XSLDIR}/contest-result-generic.traditional.xsl
${INSTFILES_TRADITIONAL}:	XSLT_PARAMS+=-param "output-base" "'$(basename $@)'"
${INSTFILES_TRADITIONAL}:	XSLT_OUT=-out /dev/null

${INSTFILES_UTF8}:	DEFAULT_XSL=${XSLDIR}/contest-result-generic.utf8.xsl
${INSTFILES_UTF8}:	XSLT_PARAMS+=-param "output-base" "'$(basename $@)'"
${INSTFILES_UTF8}:	XSLT_OUT=-out /dev/null

include config.mk
include rule.mk
