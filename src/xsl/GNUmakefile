#
# $Id: GNUmakefile,v 1.5 2001/02/06 08:20:44 kunishi Exp $
#

CHAR_ENT_GEN_FILES=	${SRCTOPDIR}/tech/iso-lat1.xml \
			${SRCTOPDIR}/tech/iso-lat2.xml \
			${SRCTOPDIR}/tech/iso-cyr1.xml \
			${SRCTOPDIR}/tech/iso-cyr2.xml
CHAR_ENT_FILES=		${SRCTOPDIR}/tech/circled-number.xml \
			${SRCTOPDIR}/tech/roman-numeral.xml \
			${CHAR_ENT_GEN_FILES}

GEN_XSLT=		char-conv-traditional.xsl \
			char-conv-utf8.xsl \
			contest-result-generic.traditional.xsl \
			contest-result-generic.utf8.xsl \
			jca-comp-result.traditional.xsl \
			jca-comp-result.utf8.xsl \
			nhk-contest-result.traditional.xsl \
			nhk-contest-result.utf8.xsl \
			xhtml1-chorusroom.traditional.xsl \
			xhtml1-chorusroom.utf8.xsl

all:

prepare-build:	${GEN_XSLT}

prepare:

char-conv-traditional.xsl:	${SRCTOPDIR}/tech/all-chars.xml
	${SCRIPTDIR}/xalan.sh -xml -in $< -xsl $(addprefix gen-,$@) ${XSLT_OUT} ${XSLT_PARAMS}

char-conv-utf8.xsl:	${SRCTOPDIR}/tech/all-chars.xml
	${SCRIPTDIR}/xalan.sh -xml -in $< -xsl $(addprefix gen-,$@) ${XSLT_OUT} ${XSLT_PARAMS}

%.traditional.xsl:	XSLT_PARAMS=-param "output-encoding" "euc-jp"
%.traditional.xsl:	%.src.xsl
	${SCRIPTDIR}/xalan.sh -xml -in $< -xsl gen-xsl-with-encoding.xsl ${XSLT_OUT} ${XSLT_PARAMS}

%.utf8.xsl:	XSLT_PARAMS=-param "output-encoding" "utf-8"
%.utf8.xsl:	%.src.xsl
	${SCRIPTDIR}/xalan.sh -xml -in $< -xsl gen-xsl-with-encoding.xsl ${XSLT_OUT} ${XSLT_PARAMS}

${SRCTOPDIR}/tech/all-chars.xml:	${CHAR_ENT_FILES}

clean:
	${RM} ${GEN_XSLT}

include config.mk
include rule.mk
