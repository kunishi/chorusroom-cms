# 
# $Id: Makefile,v 1.13 1999/08/24 14:46:18 kunishi Exp $
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

INSTFILES_NOBUILD+=	chorusroom-logo.gif \
			panaMusica-map.txt \
			panaMusica.gif \
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
		style \
		whatsnew

include ${SRCTOPDIR}/config.mk
include ${SRCTOPDIR}/rule.mk

PUBLIC_SERVER=	psi.c.oka-pu.ac.jp
PUBLIC_DIR=	/usr/local/www/data/chorusRoom/

.PHONY: sync-upload

sync-upload:
	rsync -Cavuz --delete -e ssh \
	  ${INSTTOPDIR} "${PUBLIC_SERVER}:${PUBLIC_DIR}"
