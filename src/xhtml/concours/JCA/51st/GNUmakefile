# 
# $Id: GNUmakefile,v 1.6 2002/01/07 03:36:35 kunishi Exp $
# 

USE_NEW_SCHEME=	yes

INSTFILES+=	index.html kadaikyoku.html schedule.html

INSTFILES_TRADITIONAL+=	aichi.html \
			chiba.html \
			${CHUBU} \
			chugoku.html \
			fukuoka.html \
			fukushima.html \
			gifu.html \
			${HIGHSCHOOL} \
			hiroshima.html \
			${HOKKAIDO} \
			hyogo.html \
			ishikawa.html \
			${IWATE} \
			kagoshima.html \
			kanagawa.html \
			${KANSAI} \
			${KANTO} \
			kyushu.html \
			mie.html \
			miyagi.html \
			nagano.html \
			${NATIONAL} \
			saitama.html \
			${SHIKOKU} \
			shimane.html \
			shizuoka.html \
			tohoku.html \
			yamagata.html \
			yamanashi.html

CHUBU=		chubu-1998-09-26.html chubu-1998-09-27.html
HIGHSCHOOL=	highschool-1998-10-31.html highschool-1998-11-01.html
HOKKAIDO=	hokkaido-1998-09-13.html hokkaido-1998-10-13.html
IWATE=		iwate-1998-08-29.html iwate-1998-08-30.html
KANSAI=		kansai-1998-09-20.html kansai-1998-10-17-18.html \
		kansai-1998-10-25.html
KANTO=		kanto-1998-09-26-27.html kanto-1998-10-10-11.html
NATIONAL=	national-1998-11-21.html national-1998-11-22.html
SHIKOKU=	shikoku-1998-08-29.html shikoku-1998-08-30.html

SCORES=		chubu-1998-09-26-saiten.html \
		chubu-1998-09-27-saiten.html \
		chugoku-saiten.html \
		kanto-1998-10-10-11-saiten.html \
		kyushu-saiten.html \
		nagano-saiten.html \
		saitama-saiten.html \
		yamanashi-saiten.html
INSTFILES_TRADITIONAL+=	${SCORES}

INSTFILES_UTF8=		${INSTFILES_TRADITIONAL:%.html=%.utfhtml}

INSTFILES+=		${INSTFILES_TRADITIONAL} ${INSTFILES_UTF8}

${INSTFILES_TRADITIONAL}: DEFAULT_XSL=${XSLDIR}/jca-comp-result.traditional.xsl
${INSTFILES_TRADITIONAL}: XSLT_PARAMS+=-param "output-base" "$(basename $@)"

${INSTFILES_UTF8}: DEFAULT_XSL=${XSLDIR}/jca-comp-result.utf8.xsl
${INSTFILES_UTF8}: XSLT_PARAMS+=-param "output-base" "$(basename $@)"

include ${SRCTOPDIR}/config.mk
include ${SRCTOPDIR}/rule.mk
