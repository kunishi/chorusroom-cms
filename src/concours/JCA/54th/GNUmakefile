# $Id: GNUmakefile,v 1.17 2001/10/03 15:16:19 kunishi Exp $

USE_NEW_SCHEME=		yes

INSTFILES+=		index.html

INSTFILES_TRADITIONAL=	chiba.html \
			chubu.html \
			chugoku.html \
			fukuoka.html \
			fukushima.html \
			gifu.html \
			gunma.html \
			hyogo.html \
			kagoshima.html \
			${KANSAI_HTML} \
			kyushu.html \
			nagano.html \
			nagasaki.html \
			oita.html \
			okayama.html \
			okinawa.html \
			osaka.html \
			saga.html \
			shimane.html \
			tochigi.html

INSTFILES_TRADITIONAL_SAITEN+=	chubu-saiten.html
INSTFILES_TRADITIONAL+=		${INSTFILES_TRADITIONAL_SAITEN}

INSTFILES_UTF8=		${INSTFILES_TRADITIONAL:%.html=%.utfhtml}

INSTFILES+=	${INSTFILES_TRADITIONAL} ${INSTFILES_UTF8}

KANSAI_HTML=	kansai-2001-09-23.html
REDIRECT_HTML=	${KANSAI_HTML}

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

.INTERMEDIATE: ${REDIRECT_HTML:%.html=%.xml}

###

${KANSAI_HTML:%.html=%.xml}: kansai.xml
	${LN_S} $< $@
