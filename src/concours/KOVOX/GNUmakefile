#
# $Id: GNUmakefile,v 1.9 2002/04/10 01:27:14 kunishi Exp $
#

USE_NEW_SCHEME=	yes

INSTFILES+=	index.html
INSTFILES_TRADITIONAL=	kovox-1997.html \
			kovox-1998.html \
			kovox-2000.html \
			kovox-2001.html \
			kovox-2002.html
INSTFILES_UTF8=		${INSTFILES_TRADITIONAL:%.html=%.utfhtml}
INSTFILES+=	${INSTFILES_TRADITIONAL} ${INSTFILES_UTF8}

${INSTFILES_TRADITIONAL}:	DEFAULT_XSL=${XSLDIR}/contest-result-generic.traditional.xsl
${INSTFILES_TRADITIONAL}:	XSLT_PARAMS+=-param "output-base" "$(basename $@)"

${INSTFILES_UTF8}:	DEFAULT_XSL=${XSLDIR}/contest-result-generic.utf8.xsl
${INSTFILES_UTF8}:	XSLT_PARAMS+=-param "output-base" "$(basename $@)"

include config.mk
include rule.mk
