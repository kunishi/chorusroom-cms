# $Id: GNUmakefile,v 1.5 2001/08/19 14:17:59 kunishi Exp $

USE_NEW_SCHEME=		yes

INSTFILES+=		index.html

INSTFILES_TRADITIONAL=	fukuoka.html \
			kagoshima.html \
			nagasaki.html \
			oita.html \
			okinawa.html \
			saga.html

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

