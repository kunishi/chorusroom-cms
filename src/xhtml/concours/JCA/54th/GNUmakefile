# $Id: GNUmakefile,v 1.1 2001/07/24 04:55:16 kunishi Exp $

USE_NEW_SCHEME=		yes

INSTFILES+=		index.html

INSTFILES_TRADITIONAL=	saga.html

INSTFILES_UTF8=		${INSTFILES_TRADITIONAL:%.html=%.utfhtml}

INSTFILES+=	${INSTFILES_TRADITIONAL} ${INSTFILES_UTF8}

WITH_SCORE=	true

${INSTFILES_TRADITIONAL}: DEFAULT_XSL=${XSLDIR}/jca-comp-result.traditional.xsl
${INSTFILES_TRADITIONAL}: XSLT_PARAMS+=-param "output-base" "$(basename $@)" \
				       -param "with-score" "${WITH_SCORE}"

${INSTFILES_UTF8}: DEFAULT_XSL=${XSLDIR}/jca-comp-result.utf8.xsl
${INSTFILES_UTF8}: XSLT_PARAMS+=-param "output-base" "$(basename $@)" \
				-param "with-score" "${WITH_SCORE}"

include ${SRCTOPDIR}/config.mk
include ${SRCTOPDIR}/rule.mk

###

