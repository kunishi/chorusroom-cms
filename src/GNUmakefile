# 
# $Id: GNUmakefile,v 1.55 2001/02/09 03:40:29 kunishi Exp $
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
		whatsnew

PREPARE_SUBDIR+=	tech xsl DTD

.PHONY: index gcindex upload clean

include config.mk
include rule.mk

index.html:	CSSFILE=toppage.css

info-note2.html: override DEFAULT_XSL=${XHTML10_XSL_UTF8}

.htaccess:	conf/htaccess
	${CP} $< $@

robots.txt:	conf/robots.txt
	${CP} $< $@

prepare-build:
	@for dir in ${PREPARE_SUBDIR}; do \
	  (cd $${dir} && ${MAKE} -I${SRCTOPDIR}../ prepare-build \
	   RELPATH=${RELPATH}$${dir}/ SRCTOPDIR=${SRCTOPDIR}../) \
	done

prepare:
	@for dir in ${PREPARE_SUBDIR}; do \
	  (cd $${dir} && ${MAKE} -I${SRCTOPDIR}../ prepare \
	   RELPATH=${RELPATH}$${dir}/ SRCTOPDIR=${SRCTOPDIR}../) \
	done

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
