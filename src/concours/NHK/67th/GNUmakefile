#
# $Id: GNUmakefile,v 1.6 2001/01/23 11:56:43 kunishi Exp $
#

USE_NEW_SCHEME=	yes

INSTFILES_TRADITIONAL=	aichi.html \
			aomori.html \
			asahikawa.html \
			fukuoka.html \
			hokkaido.html \
			hyogo.html \
			ishikawa.html \
			kitami.html \
			kochi.html \
			${HTML_KUMAMOTO} \
			kyushu.html \
			mie.html \
			oita.html \
			otaru-shiribeshi.html \
			saga.html \
			saitama.html \
			sapporo.html \
			shizuoka.html \
			sorachi.html \
			tokai-hokuriku.html \
			${HTML_TOKYO} \
			yamaguchi.html
INSTFILES_UTF8=		${INSTFILES_TRADITIONAL:%.html=%.utfhtml}

INSTFILES+=	index.html
INSTFILES+=	${INSTFILES_TRADITIONAL} ${INSTFILES_UTF8}

HTML_KUMAMOTO=		kumamoto-preliminary.html kumamoto-main.html
HTML_TOKYO=		tokyo-preliminary-a.html \
			tokyo-preliminary-b.html
.INTERMEDIATE:		${HTML_KUMAMOTO:%.html=%.xml}
.INTERMEDIATE:		${HTML_TOKYO:%.html=%.xml}

${INSTFILES_TRADITIONAL}: DEFAULT_XSL=${XSLDIR}/nhk-contest-result.traditional.xsl
${INSTFILES_TRADITIONAL}: XSLT_PARAMS+=-param "output-base" "'$(basename $@)'"
${INSTFILES_TRADITIONAL}: XSLT_OUT=-out /dev/null

${INSTFILES_UTF8}: DEFAULT_XSL=${XSLDIR}/nhk-contest-result.utf8.xsl
${INSTFILES_UTF8}: XSLT_PARAMS+=-param "output-base" "'$(basename $@)'"
${INSTFILES_UTF8}: XSLT_OUT=-out /dev/null

include config.mk
include rule.mk

${HTML_KUMAMOTO:%.html=%.xml}:	kumamoto.xml
	${LN_S} $< $@

${HTML_TOKYO:%.html=%.xml}:	tokyo.xml
	${LN_S} $< $@
