#
# $Id: GNUmakefile,v 1.1 2001/01/01 01:51:12 kunishi Exp $
#

CHAR_ENT_GEN_FILES=	${TOPDIR}/tech/iso-lat1.xml \
			${TOPDIR}/tech/iso-lat2.xml \
			${TOPDIR}/tech/iso-cyr1.xml \
			${TOPDIR}/tech/iso-cyr2.xml
CHAR_ENT_FILES=		${TOPDIR}/tech/circled-number.xml \
			${TOPDIR}/tech/roman-numeral.xml \
			${CHAR_ENT_GEN_FILES}

GEN_XSLT=		ascii-char-conv.xsl utf8-char-conv.xsl

all:

prepare:	${GEN_XSLT}

ascii-char-conv.xsl:	${TOPDIR}/tech/all-chars.xml
	${ENV} ${JAVA_ENV} ${XSLT_PROC} -in $< -xsl $(addprefix gen-,$@) ${XSLT_OUT} ${XSLT_PARAMS}

utf8-char-conv.xsl:	${TOPDIR}/tech/all-chars.xml
	${ENV} ${JAVA_ENV} ${XSLT_PROC} -in $< -xsl $(addprefix gen-,$@) ${XSLT_OUT} ${XSLT_PARAMS}

${TOPDIR}/tech/all-chars.xml:	${CHAR_ENT_FILES}

${CHAR_ENT_GEN_FILES}:
	cd ${TOPDIR}/tech && ${MAKE} $(notdir $@)

include config.mk
include rule.mk
