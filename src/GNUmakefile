# 
# $Id: GNUmakefile,v 1.28 2000/08/28 06:03:11 kunishi Exp $
#

RELPATH=	.
SRCTOPDIR=	.

INSTFILES+=	CDShop.html \
		asian960518.html \
		faq.html \
		gakufuShop.html \
		hyogoEarthquake.html \
		index.html \
		info-note.html \
		info-note2.html \
		misc.html \

INSTFILES_NOBUILD+=	chorusroom-logo.png \
			panaMusica-map.txt \
			panaMusica.png \
			panaMusica.ps \
			panaMusica.ps.gz \
			toppage.css

SUBDIR+=	ajcl \
		concours \
		hml \
		image \
		links \
		namazu \
		style \
		tech \
		whatsnew

include ${SRCTOPDIR}/config.mk
include ${SRCTOPDIR}/rule.mk

PUBLIC_SERVER=	psi.c.oka-pu.ac.jp
PUBLIC_DIR=	/usr/local/www/data/chorusRoom/

NAMAZU_SRC=	/usr/local/namazu/bin/namazu
NAMAZU_INDEX_DIR=	${INSTTOPDIR}namazu/index/

.PHONY: sync-upload

install-namazu:	${INSTTOPDIR}search.cgi

${PUBLIC_DIR}search.cgi:	${NAMAZU_SRC}
	cp ${NAMAZU_SRC} ${INSTTOPDIR}search.cgi

index:
	cd ${NAMAZU_INDEX_DIR} && mknmz "" "${INSTTOPDIR}"

gcindex:
	cd ${NAMAZU_INDEX_DIR} && /usr/local/namazu/bin/gcnmz

sync-upload:
	rsync -Cavu --delete -e ssh --exclude="search.cgi" \
	  ${INSTTOPDIR} ${PUBLIC_SERVER}:${PUBLIC_DIR}

info-note2.html: %.html : %.xml ${XHTML10_XSL_ISO8859_1}
	${ENV} ${XSLT_ENV} ${XSLT_PROC} $< ${XHTML10_XSL_ASCII} > $@
	${PERL} -pi -e "s@%%TOPDIR%%@${TOPDIR}@g; \
			s@%%STYLEDIR%%@${STYLEDIR}@g;" $@
	${HTML_FORMAT} -m -utf8 $@
