# 
# $Id: Makefile,v 1.17 1999/09/17 02:21:36 kunishi Exp $
#

RELPATH=	.
SRCTOPDIR=	./

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
			panaMusica.ps.gz

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
		whatsnew

include ${SRCTOPDIR}/config.mk
include ${SRCTOPDIR}/rule.mk

PUBLIC_SERVER=	psi.c.oka-pu.ac.jp
PUBLIC_DIR=	/usr/local/www/data/chorusRoom/

.PHONY: sync-upload

install-namazu:
	cp /usr/local/namazu/bin/namazu ${PUBLIC_DIR}/search.cgi

index:
	cd ${INSTTOPDIR}/namazu/index && mknmz "" "${INSTTOPDIR}"

sync-upload:
	rsync -Cavuz --delete -e ssh --exclude="search.cgi" \
	  ${INSTTOPDIR} ${PUBLIC_SERVER}:${PUBLIC_DIR}
