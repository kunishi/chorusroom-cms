# $Id: GNUmakefile,v 1.12 2001/09/18 02:20:30 kunishi Exp $

USE_NEW_SCHEME=		yes

INSTFILES+=		index.html

INSTFILES_TRADITIONAL=	chiba.html \
			fukuoka.html \
			gifu.html \
			gunma.html \
			hyogo.html \
			kagoshima.html \
			nagano.html \
			nagasaki.html \
			oita.html \
			okayama.html \
			okinawa.html \
			osaka.html \
			saga.html \
			shimane.html \
			tochigi.html

INSTFILES_UTF8=		${INSTFILES_TRADITIONAL:%.html=%.utfhtml}

INSTFILES+=	${INSTFILES_TRADITIONAL} ${INSTFILES_UTF8}

WITH_SCORE=	true

${INSTFILES_TRADITIONAL}: DEFAULT_XSL=${XSLDIR}/jca-comp-result.traditional.xsl
${INSTFILES_TRADITIONAL}: XSLT_PARAMS+=-param "output-base" "$(basename $@)" \
				       -param "with-score" "${WITH_SCORE}"

${INSTFILES_UTF8}: DEFAULT_XSL=${XSLDIR}/jca-comp-result.utf8.xsl
${INSTFILES_UTF8}: XSLT_PARAMS+=-param "output-base" "$(basename $@)" \
				-param "with-score" "${WITH_SCORE}"

osaka.html:	WITH_SCORE=false
osaka.utfhtml:	WITH_SCORE=false

include ${SRCTOPDIR}/config.mk
include ${SRCTOPDIR}/rule.mk

###

