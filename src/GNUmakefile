# 
# $Id: GNUmakefile,v 1.41 2000/10/08 23:37:37 kunishi Exp $
#

RELPATH=	# ./
SRCTOPDIR=	# ./

INSTFILES+=	CDShop.html \
		asian960518.html \
		faq.html \
		gakufuShop.html \
		hyogoEarthquake.html \
		index.html \
		info-note.html \
		info-note2.html \
		misc.html \
		profile.html \
		notice.html

INSTFILES_NOBUILD+=	panaMusica-map.txt \
			panaMusica.png \
			panaMusica.ps \
			panaMusica.ps.gz \
			robots.txt

SUBDIR+=	ajcl \
		concours \
		hml \
		image \
		links \
		namazu \
		server \
		style \
		tech \
		whatsnew

include ${SRCTOPDIR}config.mk
include ${SRCTOPDIR}rule.mk

PUBLIC_SERVER=	psi.c.oka-pu.ac.jp
PUBLIC_DIR=	/usr/local/www/data/

NAMAZU_SRC=	/usr/local/namazu/bin/namazu
NAMAZU_INDEX_DIR=	${INSTTOPDIR}namazu/index/

.PHONY: index gcindex upload

index.html:	CSSFILE=toppage.css

info-note2.html: override DEFAULT_XSL=${XHTML10_XSL_ASCII}
info-note2.html: override TIDY_ENCODING=-ascii

install-namazu:	${INSTTOPDIR}search.cgi

${PUBLIC_DIR}search.cgi:	${NAMAZU_SRC}
	cp ${NAMAZU_SRC} ${INSTTOPDIR}search.cgi

index:
	cd ${NAMAZU_INDEX_DIR} && mknmz "" "${INSTTOPDIR}"

gcindex:
	cd ${NAMAZU_INDEX_DIR} && /usr/local/namazu/bin/gcnmz

upload:
	rsync -Cavu -e ssh --exclude="search.cgi" \
	  ${INSTTOPDIR} ${PUBLIC_SERVER}:${PUBLIC_DIR}

