# Makefile for 
# Copyright (C) 1999 KUNISHIMA Takeo <kunishi@c.oka-pu.ac.jp>
#
# $Id: Makefile,v 1.57 2000/10/03 11:34:59 kunishi Exp $

NATIONAL_HTML=	highschool-1999-10-30.html \
		highschool-1999-10-31.html \
		national-1999-11-20.html \
		national-1999-11-21.html

CHUBU_HTML=	chubu-09-25.html chubu-09-25-saiten.html \
		chubu-09-26.html chubu-09-26-saiten.html

KANSAI_HTML=	kansai-09-23.html kansai-09-23-saiten.html \
		kansai-10-17.html kansai-10-17-saiten.html \
		kansai-10-24.html

INSTFILES_HTML+=	index.html
INSTFILES_HTML+=	aichi.html
INSTFILES_HTML+=	chiba.html
INSTFILES_HTML+=	${CHUBU_HTML}
INSTFILES_HTML+=	chugoku.html
INSTFILES_HTML+=	fukuoka.html
INSTFILES_HTML+=	fukushima.html
INSTFILES_HTML+=	hokkaido.html hokkaido-saiten.html hokkaido-1999-09-12.html
INSTFILES_HTML+=	hyogo.html
INSTFILES_HTML+=	kagoshima.html
INSTFILES_HTML+=	kanagawa.html
INSTFILES_HTML+=	${KANSAI_HTML}
INSTFILES_HTML+=	kanto.html kanto-saiten.html
INSTFILES_HTML+=	kyushu.html
INSTFILES_HTML+=	mie.html
INSTFILES_HTML+=	miyagi.html
INSTFILES_HTML+=	nagano.html nagano-saiten.html
INSTFILES_HTML+=	shimane-junior.html shimane-senior.html
INSTFILES_HTML+=	shizuoka.html
INSTFILES_HTML+=	tohoku.html
INSTFILES_HTML+=	yamagata.html
INSTFILES_HTML+=	${NATIONAL_HTML}

INSTFILES+=	${INSTFILES_HTML} ${INSTFILES_HTML:%.html=%.utfhtml}

GENFILES+=	${INSTFILES_HTML:%.html=%.jhtml}
GENFILES+=	${INSTFILES_HTML:%.html=%.uhtml}

include ${SRCTOPDIR}/config.mk

ifdef USE_XALAN
RESULT_XSL=		result-eucjp-xalan.xsl
RESULT_XSL_UTF8=	result-utf8-xalan.xsl
else
RESULT_XSL=		result-eucjp.xsl
RESULT_XSL_UTF8=	result-utf8.xsl
endif
RESULT_XSL_COMMON=	result-common.xsl
DEFAULT_XSL=		${RESULT_XSL}
DEFAULT_XSL_UTF8=	${RESULT_XSL_UTF8}

SPECIAL_RULES=		yes

include ${SRCTOPDIR}/rule.mk

ifdef USE_XALAN
%.html: %.xml ${RESULT_XSL_COMMON}
	${ENV} ${JAVA_ENV} ${XSLT_PROC} -IN $< -XSL ${DEFAULT_XSL} -OUT $@
	${HTML_FORMAT} -m -iso2022 $@
	${PATH_CONFIGURE} $@

%.utfhtml: %.utfxml ${RESULT_XSL_COMMON}
	${ENV} ${JAVA_ENV} ${XSLT_PROC} -IN $< -XSL ${DEFAULT_XSL_UTF8} -OUT $@
	${HTML_FORMAT} -m -utf8 $@
	${PATH_CONFIGURE} $@
else
%.jhtml: %.xml ${RESULT_XSL_COMMON}
	${ENV} ${JAVA_ENV} ${XSLT_PROC} $< ${DEFAULT_XSL}

%.html:	%.jhtml
	${ASCII2EUC} $< | ${EUC2JIS} > $@
	${HTML_FORMAT} -m -iso2022 $@
	${PATH_CONFIGURE} $@

%.uhtml: %.utfxml ${RESULT_XSL_COMMON}
	${JAVA_ENV} ${XSLT_PROC} $< ${DEFAULT_XSL_UTF8}

%.utfhtml: %.uhtml
	${CP} $< $@
	${HTML_FORMAT} -m -utf8 $@
	${PATH_CONFIGURE} $@
endif

###

index.html: %.html : %.xml ${XHTML10_XSL}
ifdef USE_XALAN
	${ENV} ${JAVA_ENV} ${XSLT_PROC} -IN $< -XSL ${XHTML10_XSL} -OUT $@
else
	${JAVA_ENV} ${XSLT_PROC} $< ${XHTML10_XSL} | ${ASCII2EUC} | ${EUC2JIS} > $@
endif
	${PATH_CONFIGURE} $@
	${HTML_FORMAT} -m -iso2022 $@

index.utfhtml: %.utfhtml : %.utfxml ${XHTML10_XSL_UTF8}
ifdef USE_XALAN
	${ENV} ${JAVA_ENV} ${XSLT_PROC} -IN $< -XSL ${XHTML10_XSL_UTF8} -OUT $@
else
	${JAVA_ENV} ${XSLT_PROC} $< ${XHTML10_XSL_UTF8} > $@
endif
	${PATH_CONFIGURE} $@
	${HTML_FORMAT} -m -utf8 $@

ifdef USE_XALAN
${CHUBU_HTML}:	chubu.xml ${RESULT_XSL_COMMON}
	${ENV} ${JAVA_ENV} ${XSLT_PROC} -IN $< -XSL ${DEFAULT_XSL}
	${PATH_CONFIGURE} ${CHUBU_HTML}
	${HTML_FORMAT} -m -iso2022 ${CHUBU_HTML}

${CHUBU_HTML:%.html=%.utfhtml}:	chubu.utfxml ${RESULT_XSL_COMMON}
	${ENV} ${JAVA_ENV} ${XSLT_PROC} -IN $< -XSL ${DEFAULT_XSL_UTF8}
	${PATH_CONFIGURE} ${CHUBU_HTML:%.html=%.utfhtml}
	${HTML_FORMAT} -m -utf8 ${CHUBU_HTML:%.html=%.utfhtml}
else
${CHUBU_HTML:%.html=%.jhtml}:	chubu.xml ${RESULT_XSL_COMMON}
	${JAVA_ENV} ${XSLT_PROC} $< ${DEFAULT_XSL}

${CHUBU_HTML:%.html=%.uhtml}:	chubu.utfxml ${RESULT_XSL_COMMON}
	${JAVA_ENV} ${XSLT_PROC} $< ${DEFAULT_XSL_UTF8}
endif

ifdef USE_XALAN
${KANSAI_HTML}: kansai.xml ${RESULT_XSL_COMMON}
	${ENV} ${JAVA_ENV} ${XSLT_PROC} -IN $< -XSL ${DEFAULT_XSL}
	${PATH_CONFIGURE} ${KANSAI_HTML}
	${HTML_FORMAT} -m -iso2022 ${KANSAI_HTML}

${KANSAI_HTML:%.html=%.utfhtml}: kansai.utfxml ${RESULT_XSL_COMMON}
	${ENV} ${JAVA_ENV} ${XSLT_PROC} -IN $< -XSL ${DEFAULT_XSL_UTF8}
	${PATH_CONFIGURE} ${KANSAI_HTML:%.html=%.utfhtml}
	${HTML_FORMAT} -m -utf8 ${KANSAI_HTML:%.html=%.utfhtml}
else
${KANSAI_HTML:%.html=%.jhtml}:	kansai.xml ${RESULT_XSL_COMMON}
	${JAVA_ENV} ${XSLT_PROC} $< ${DEFAULT_XSL}

${KANSAI_HTML:%.html=%.uhtml}: kansai.utfxml ${RESULT_XSL_COMMON}
	${JAVA_ENV} ${XSLT_PROC} $< ${DEFAULT_XSL_UTF8}
endif

ifdef USE_XALAN
${NATIONAL_HTML}: national.xml ${RESULT_XSL_COMMON}
	${ENV} ${JAVA_ENV} ${XSLT_PROC} -IN $< -XSL ${DEFAULT_XSL}
	${PATH_CONFIGURE} ${NATIONAL_HTML}
	${HTML_FORMAT} -m -iso2022 ${NATIONAL_HTML}

${NATIONAL_HTML:%.html=%.utfhtml}: national.utfxml ${RESULT_XSL_COMMON}
	${ENV} ${JAVA_ENV} ${XSLT_PROC} -IN $< -XSL ${DEFAULT_XSL_UTF8}
	${PATH_CONFIGURE} ${NATIONAL_HTML:%.html=%.utfhtml}
	${HTML_FORMAT} -m -utf8 ${NATIONAL_HTML:%.html=%.utfhtml}
else
${NATIONAL_HTML:%.html=%.jhtml}: national.xml ${RESULT_XSL_COMMON}
	${JAVA_ENV} ${XSLT_PROC} $< ${DEFAULT_XSL}

${NATIONAL_HTML:%.html=%.uhtml}: national.utfxml ${RESULT_XSL_COMMON}
	${JAVA_ENV} ${XSLT_PROC} $< ${DEFAULT_XSL_UTF8}
endif

## dummy target.
## *-saiten.{jhtml,uhtml} is actually generated from *.xml.
hokkaido-saiten.jhtml: hokkaido.xml
hokkaido-saiten.uhtml: hokkaido.utfxml
hokkaido-1999-09-12.jhtml: hokkaido.xml
hokkaido-1999-09-12.uhtml: hokkaido.utfxml
kanto-saiten.jhtml: kanto.xml
kanto-saiten.uhtml: kanto.utfxml
nagano-saiten.jhtml: nagano.xml
nagano-saiten.uhtml: nagano.utfxml
