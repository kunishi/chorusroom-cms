#
# $Id: GNUmakefile,v 1.15 2001/08/06 02:14:30 kunishi Exp $
#

USE_NEW_SCHEME=	yes

INSTFILES_TRADITIONAL=	aichi.html \
			aomori.html \
			asahikawa.html \
			ehime.html \
			fukuoka.html \
			hokkaido.html \
			hyogo.html \
			ishikawa.html \
			${HTML_KINKI} \
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
			toyama.html \
			yamaguchi.html \
			yamanashi.html
INSTFILES_UTF8=		${INSTFILES_TRADITIONAL:%.html=%.utfhtml}

INSTFILES+=	index.html
INSTFILES+=	${INSTFILES_TRADITIONAL} ${INSTFILES_UTF8}

HTML_KINKI=		kinki-2000-09-09.html kinki-2000-09-10.html
HTML_KUMAMOTO=		kumamoto-preliminary.html kumamoto-main.html
HTML_TOKYO=		tokyo-preliminary-a.html \
			tokyo-preliminary-b.html \
			tokyo-elementary-school-main.html \
			tokyo-junior-highschool-main.html \
			tokyo-senior-highschool-main.html
.INTERMEDIATE:		${HTML_KINKI:%.html=%.xml}
.INTERMEDIATE:		${HTML_KUMAMOTO:%.html=%.xml}
.INTERMEDIATE:		${HTML_TOKYO:%.html=%.xml}

${INSTFILES_TRADITIONAL}: DEFAULT_XSL=${XSLDIR}/nhk-contest-result.traditional.xsl
${INSTFILES_TRADITIONAL}: XSLT_PARAMS+=-param "output-base" "$(basename $@)"

${INSTFILES_UTF8}: DEFAULT_XSL=${XSLDIR}/nhk-contest-result.utf8.xsl
${INSTFILES_UTF8}: XSLT_PARAMS+=-param "output-base" "$(basename $@)"

include config.mk
include rule.mk

${HTML_KINKI:%.html=%.xml}:	kinki.xml
	${LN_S} $< $@

${HTML_KUMAMOTO:%.html=%.xml}:	kumamoto.xml
	${LN_S} $< $@

${HTML_TOKYO:%.html=%.xml}:	tokyo.xml
	${LN_S} $< $@
