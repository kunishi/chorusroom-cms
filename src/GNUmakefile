# 
# $Id: GNUmakefile,v 1.48 2000/11/16 16:36:38 kunishi Exp $
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
		notice.html \
		.htaccess \
		robots.txt

INSTFILES_NOBUILD+=	panaMusica-map.txt \
			panaMusica.png \
			panaMusica.ps \
			panaMusica.ps.gz

SUBDIR+=	ajcl \
		concours \
		conf \
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

.PHONY: index gcindex upload

index.html:	CSSFILE=toppage.css

info-note2.html: override DEFAULT_XSL=${XHTML10_XSL_ASCII}
info-note2.html: override TIDY_ENCODING=-ascii

.htaccess:	conf/htaccess
	${CP} $< $@

robots.txt:	conf/robots.txt
	${CP} $< $@

upload:
	rsync -Cavu -e ssh --exclude="search.cgi" \
	  ${INSTTOPDIR} ${PUBLIC_SERVER}:${PUBLIC_DIR}

### targets only for maintenance.

install-namazu:	${INSTTOPDIR}search.cgi

${PUBLIC_DIR}search.cgi:	${NAMAZU_SRC}
	cp ${NAMAZU_SRC} ${NAMAZU_INSTDIR}search.cgi

index:
ifeq (${USE_NAMAZU1},yes)
	cd ${NAMAZU_INDEX_DIR} && mknmz "" "${INSTTOPDIR}"
else
	mknmz -O ${NAMAZU_INDEX_DIR} ${INSTTOPDIR}
endif

gcindex:
	cd ${NAMAZU_INDEX_DIR} && ${GCNMZ}
