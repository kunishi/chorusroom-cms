# 
# $Id: GNUmakefile,v 1.53 2001/01/12 13:01:33 kunishi Exp $
#

RELPATH=	# ./
SRCTOPDIR=	# ./

USE_NEW_SCHEME=	yes

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
		whatsnew \
		DTD

.PHONY: index gcindex upload clean

include config.mk
include rule.mk

index.html:	CSSFILE=toppage.css

info-note2.html: override DEFAULT_XSL=${XHTML10_XSL_ASCII}
info-note2.html: override TIDY_ENCODING=-ascii

.htaccess:	conf/htaccess
	${CP} $< $@

robots.txt:	conf/robots.txt
	${CP} $< $@

pre-all:
	cd tech && \
	  ${MAKE} -I$(shell pwd) pre-all RELPATH=${RELPATH}tech/ SRCTOPDIR=${SRCTOPDIR}../
	cd xsl && \
	  ${MAKE} -I$(shell pwd) pre-all RELPATH=${RELPATH}xsl/ SRCTOPDIR=${SRCTOPDIR}../
	cd DTD && \
	  ${MAKE} -I$(shell pwd) pre-all RELPATH=${RELPATH}DTD/ SRCTOPDIR=${SRCTOPDIR}../

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
