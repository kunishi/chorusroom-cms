# Makefile for 	-*-Makefile-*-
# Copyright (C) 2000 KUNISHIMA Takeo kunishi@c.oka-pu.ac.jp
# $Id: Makefile,v 1.48 2000/10/09 17:06:19 kunishi Exp $

INSTFILES_HTML+=	index.html
INSTFILES_HTML+=	aichi.html
INSTFILES_HTML+=	chiba.html
INSTFILES_HTML+=	chubu.html
INSTFILES_HTML+=	chugoku.html
INSTFILES_HTML+=	ehime.html
INSTFILES_HTML+=	fukuoka.html
INSTFILES_HTML+=	fukushima.html
INSTFILES_HTML+=	gunma.html
INSTFILES_HTML+=	hiroshima.html
INSTFILES_HTML+=	${HOKKAIDO_HTML}
INSTFILES_HTML+=	hyogo.html
INSTFILES_HTML+=	ishikawa.html
INSTFILES_HTML+=	iwate.html
INSTFILES_HTML+=	kagawa.html
INSTFILES_HTML+=	${KANSAI_HTML}
INSTFILES_HTML+=	kanto.html
INSTFILES_HTML+=	${KUMAMOTO_HTML}
INSTFILES_HTML+=	${KYUSHU_HTML}
INSTFILES_HTML+=	mie.html
INSTFILES_HTML+=	miyagi.html
INSTFILES_HTML+=	okayama.html
INSTFILES_HTML+=	saga.html
INSTFILES_HTML+=	${SHIKOKU_HTML}
INSTFILES_HTML+=	shimane.html
INSTFILES_HTML+=	tokyo.html
INSTFILES_HTML+=	${TOHOKU_HTML}
INSTFILES_HTML+=	yamagata.html
INSTFILES_HTML+=	yamaguchi.html

KANSAI_HTML=		kansai-highschool.html
KUMAMOTO_HTML=		kumamoto.html kumamoto2.html
KYUSHU_HTML=		kyushu-2000-09-10.html
SHIKOKU_HTML=		shikoku-2000-09-02.html shikoku-2000-09-03.html
HOKKAIDO_HTML=		hokkaido-2000-09-24.html
TOHOKU_HTML=		tohoku-2000-09-29.html \
			tohoku-2000-09-30.html \
			tohoku-2000-10-01.html

INSTFILES_HTML_SAITEN+=	chiba-saiten.html
INSTFILES_HTML_SAITEN+=	chubu-saiten.html
INSTFILES_HTML_SAITEN+=	chugoku-saiten.html
INSTFILES_HTML_SAITEN+=	ishikawa-saiten.html
INSTFILES_HTML_SAITEN+=	mie-saiten.html

INSTFILES_NOBUILD+=	hyogo.xml

INSTFILES+=	${INSTFILES_HTML} \
		${INSTFILES_HTML:%.html=%.utfhtml} \
		${INSTFILES_HTML_SAITEN} \
		${INSTFILES_HTML_SAITEN:%.html=%.utfhtml}

REDIRECT_HTML=	${KANSAI_HTML} ${KUMAMOTO_HTML} ${KYUSHU_HTML} \
		${HOKKAIDO_HTML} ${SHIKOKU_HTML} ${TOHOKU_HTML}

RESULT_XSL=		${XSLDIR}/jca-result-2000-eucjp-xalan.xsl
RESULT_XSL_UTF8=	${XSLDIR}/jca-result-2000-utf8-xalan.xsl
RESULT_XSL_COMMON=	${XSLDIR}/jca-result-2000-common.xsl
DEFAULT_XSL=		${RESULT_XSL}
DEFAULT_XSL_UTF8=	${RESULT_XSL_UTF8}

CSSFILE=		jca-concour.css

include ${SRCTOPDIR}/config.mk
include ${SRCTOPDIR}/rule.mk

.INTERMEDIATE: hokkaido.utfxml kansai.utfxml kumamoto.utfxml
.INTERMEDIATE: kyushu.utfxml shikoku.utfxml tohoku.utfxml
.INTERMEDIATE: ${REDIRECT_HTML:%.html=%.xml}
.INTERMEDIATE: ${REDIRECT_HTML:%.html=%.utfxml}

%-saiten.html:	%.html
	$(fixhtml)

%-saiten.html:	TIDY_ENCODING=utf8
%-saiten.utfhtml:	%.utfhtml
	$(fixhtml)

###

index.html:	DEFAULT_XSL=${XHTML10_XSL}
index.html:	CSSFILE=default.css

index.utfhtml:	DEFAULT_XSL_UTF8=${XHTML10_XSL_UTF8}
index.utfhtml:	CSSFILE=default.css

${REDIRECT_HTML}:	XSLT_OUT=-param "output-base" "'$(basename $@)'"
${REDIRECT_HTML:%.html=%.utfhtml}:	XSLT_OUT=-param "output-base" "'$(basename $@)'"

${HOKKAIDO_HTML:%.html=%.xml}: hokkaido.xml
	${LN_S} $< $@

${HOKKAIDO_HTML:%.html=%.utfxml}: hokkaido.utfxml
	${LN_S} $< $@

${KANSAI_HTML:%.html=%.xml}: kansai.xml
	${LN_S} $< $@

${KANSAI_HTML:%.html=%.utfxml}: kansai.utfxml
	${LN_S} $< $@

${KUMAMOTO_HTML:%.html=%.xml}: kumamoto.xml
	${LN_S} $< $@

${KUMAMOTO_HTML:%.html=%.utfxml}: kumamoto.utfxml
	${LN_S} $< $@

${KYUSHU_HTML:%.html=%.xml}: kyushu.xml
	${LN_S} $< $@

${KYUSHU_HTML:%.html=%.utfxml}: kyushu.utfxml
	${LN_S} $< $@

${SHIKOKU_HTML:%.html=%.xml}: shikoku.xml
	${LN_S} $< $@

${SHIKOKU_HTML:%.html=%.utfxml}: shikoku.utfxml
	${LN_S} $< $@

${TOHOKU_HTML:%.html=%.xml}: tohoku.xml
	${LN_S} $< $@

${TOHOKU_HTML:%.html=%.utfxml}: tohoku.utfxml
	${LN_S} $< $@
