#
# $Id: GNUmakefile,v 1.14 2002/01/26 04:49:24 kunishi Exp $
#

USE_NEW_SCHEME=	yes

INSTFILES_TRADITIONAL=	asahikawa.html \
			chugoku.html \
			donan.html \
			hokkaido.html \
			${HYOGO_HTML} \
			kanto.html \
			kinki.html \
			kitami.html \
			kyoto.html \
			kyushu.html \
			${NATIONAL} \
			sapporo.html \
			tochigi.html
INSTFILES_UTF8=		${INSTFILES_TRADITIONAL:%.html=%.utfhtml}

INSTFILES+=		index.html
INSTFILES+=		${INSTFILES_TRADITIONAL} ${INSTFILES_UTF8}

HYOGO_HTML=		hyogo-preliminary-hanshin.html \
			hyogo-preliminary-himeji.html \
			hyogo-main.html
NATIONAL=		national-elementary-school-2001-10-07.html \
			national-junior-highschool-2001-10-08.html \
			national-senior-highschool-2001-10-08.html

.INTERMEDIATE:		${HYOGO_HTML:%.html=%.xml} ${NATIONAL:%.html=%.xml}

${INSTFILES_TRADITIONAL}: DEFAULT_XSL=${XSLDIR}/nhk-contest-result.traditional.xsl
${INSTFILES_TRADITIONAL}: XSLT_PARAMS+=-param "output-base" "$(basename $@)"

${INSTFILES_UTF8}: DEFAULT_XSL=${XSLDIR}/nhk-contest-result.utf8.xsl
${INSTFILES_UTF8}: XSLT_PARAMS+=-param "output-base" "$(basename $@)"

include config.mk
include rule.mk

${HYOGO_HTML:%.html=%.xml}:	hyogo.xml
	${LN_S} $< $@

${NATIONAL:%.html=%.xml}:	national.xml
	${LN_S} $< $@
