# 
# $Id: GNUmakefile,v 1.25 2000/08/23 06:04:01 kunishi Exp $
#

RELPATH=	.
SRCTOPDIR=	.

INSTFILES+=	CDShop.html \
		ajcl-contest.html \
		asian960518.html \
		faq.html \
		gakufuShop.html \
		hyogoEarthquake.html \
		index.html \
		info-note.html \
		info-note2.html \
		kovox.html \
		misc.html \
		47thajcl.html

INSTFILES_NOBUILD+=	chorusroom-logo.png \
			panaMusica-map.txt \
			panaMusica.png \
			panaMusica.ps \
			panaMusica.ps.gz \
			toppage.css

SUBDIR+=	48th \
		49th \
		50th \
		51st \
		JCA-concours \
		ajcl \
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

sync-upload:
	rsync -Cavu --delete -e ssh --exclude="search.cgi" \
	  ${INSTTOPDIR} ${PUBLIC_SERVER}:${PUBLIC_DIR}

info-note2.html: %.html : %.xml ${XHTML10_XSL_ISO8859_1}
	${ENV} ${XSLT_ENV} ${XSLT_PROC} $< ${XHTML10_XSL_ASCII} > $@
