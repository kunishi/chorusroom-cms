# 
# $Id: Makefile,v 1.40 2000/10/04 15:46:04 kunishi Exp $
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

info-note2.html: %.html : %.xml ${XHTML10_XSL_UTF8}
	${ENV} ${XSLT_ENV} ${XSLT_PROC} -in $< -xsl ${XHTML10_XSL_UTF8} -out $@
	${PATH_CONFIGURE} $@
	${HTML_FORMAT} -m -utf8 $@
