#
# $Id: GNUmakefile,v 1.2 2001/08/19 16:01:13 kunishi Exp $
#

USE_NEW_SCHEME=	yes

INSTFILES_TRADITIONAL=	asahikawa.html \
			${HYOGO_HTML} \
			sapporo.html
INSTFILES_UTF8=		${INSTFILES_TRADITIONAL:%.html=%.utfhtml}

INSTFILES+=		index.html
INSTFILES+=		${INSTFILES_TRADITIONAL} ${INSTFILES_UTF8}

HYOGO_HTML=		hyogo-preliminary-hanshin.html \
			hyogo-preliminary-himeji.html

.INTERMEDIATE:		${HYOGO_HTML:%.html=%.xml}

${INSTFILES_TRADITIONAL}: DEFAULT_XSL=${XSLDIR}/nhk-contest-result.traditional.xsl
${INSTFILES_TRADITIONAL}: XSLT_PARAMS+=-param "output-base" "$(basename $@)"

${INSTFILES_UTF8}: DEFAULT_XSL=${XSLDIR}/nhk-contest-result.utf8.xsl
${INSTFILES_UTF8}: XSLT_PARAMS+=-param "output-base" "$(basename $@)"

include config.mk
include rule.mk

${HYOGO_HTML:%.html=%.xml}:	hyogo.xml
	${LN_S} $< $@
