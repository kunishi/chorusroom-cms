# Makefile for 	-*-Makefile-*-
# Copyright (C) 2000 KUNISHIMA Takeo kunishi@c.oka-pu.ac.jp
# $Id: GNUmakefile,v 1.66 2001/01/30 13:24:53 kunishi Exp $

USE_NEW_SCHEME=		yes

INSTFILES+=	index.html

INSTFILES_TRADITIONAL=	aichi.html
INSTFILES_TRADITIONAL+=	chiba.html
INSTFILES_TRADITIONAL+=	chubu.html
INSTFILES_TRADITIONAL+=	chugoku.html
INSTFILES_TRADITIONAL+=	ehime.html
INSTFILES_TRADITIONAL+=	fukuoka.html
INSTFILES_TRADITIONAL+=	fukushima.html
INSTFILES_TRADITIONAL+=	gunma.html
INSTFILES_TRADITIONAL+=	hiroshima.html
INSTFILES_TRADITIONAL+=	${HOKKAIDO_HTML}
INSTFILES_TRADITIONAL+=	hyogo.html
INSTFILES_TRADITIONAL+=	ishikawa.html
INSTFILES_TRADITIONAL+=	iwate.html
INSTFILES_TRADITIONAL+=	kagawa.html
INSTFILES_TRADITIONAL+=	${KANSAI_HTML}
INSTFILES_TRADITIONAL+=	${KANTO_HTML}
INSTFILES_TRADITIONAL+=	${KUMAMOTO_HTML}
INSTFILES_TRADITIONAL+=	${KYUSHU_HTML}
INSTFILES_TRADITIONAL+=	mie.html
INSTFILES_TRADITIONAL+=	miyagi.html
INSTFILES_TRADITIONAL+=	nagano.html
INSTFILES_TRADITIONAL+=	okayama.html
INSTFILES_TRADITIONAL+=	saga.html
INSTFILES_TRADITIONAL+=	${SHIKOKU_HTML}
INSTFILES_TRADITIONAL+=	shimane.html
INSTFILES_TRADITIONAL+=	tokyo.html
INSTFILES_TRADITIONAL+=	${TOHOKU_HTML}
INSTFILES_TRADITIONAL+=	yamagata.html
INSTFILES_TRADITIONAL+=	yamaguchi.html
INSTFILES_TRADITIONAL+=	${HIGHSCHOOL_HTML}
INSTFILES_TRADITIONAL+=	${NATIONAL_HTML}

KANSAI_HTML=		kansai-highschool.html \
			kansai-general.html \
			kansai-univ-company.html
KANTO_HTML=		kanto-2000-09-23.html \
			kanto-2000-09-24.html \
			kanto-general.html
KUMAMOTO_HTML=		kumamoto-2000-07-23.html \
			kumamoto-2000-07-25.html
KYUSHU_HTML=		kyushu-2000-09-09.html \
			kyushu-2000-09-10.html
SHIKOKU_HTML=		shikoku-2000-09-02.html shikoku-2000-09-03.html
HOKKAIDO_HTML=		hokkaido-2000-09-24.html hokkaido-2000-10-08.html
TOHOKU_HTML=		tohoku-2000-09-29.html \
			tohoku-2000-09-30.html \
			tohoku-2000-10-01.html
HIGHSCHOOL_HTML=	highschool-2000-10-28.html \
			highschool-2000-10-29.html
NATIONAL_HTML=		national-2000-11-25.html \
			national-2000-11-26.html

INSTFILES_TRADITIONAL_SAITEN+=	chiba-saiten.html
INSTFILES_TRADITIONAL_SAITEN+=	chubu-saiten.html
INSTFILES_TRADITIONAL_SAITEN+=	chugoku-saiten.html
INSTFILES_TRADITIONAL_SAITEN+=	hokkaido-2000-10-08-saiten.html
INSTFILES_TRADITIONAL_SAITEN+=	ishikawa-saiten.html
INSTFILES_TRADITIONAL_SAITEN+=	kansai-highschool-saiten.html \
			kansai-general-saiten.html \
			kansai-univ-company-saiten.html
INSTFILES_TRADITIONAL_SAITEN+=	kanto-2000-09-23-saiten.html \
			kanto-general-saiten.html
INSTFILES_TRADITIONAL_SAITEN+=	mie-saiten.html
INSTFILES_TRADITIONAL_SAITEN+=	nagano-saiten.html
INSTFILES_TRADITIONAL_SAITEN+=	tokyo-saiten.html
INSTFILES_TRADITIONAL+=	${INSTFILES_TRADITIONAL_SAITEN}

INSTFILES_UTF8=	${INSTFILES_TRADITIONAL:%.html=%.utfhtml}

INSTFILES_NOBUILD+=	hyogo.xml

INSTFILES+=	${INSTFILES_TRADITIONAL} \
		${INSTFILES_UTF8}

REDIRECT_HTML=	${KANSAI_HTML} ${KANTO_HTML} ${KUMAMOTO_HTML} ${KYUSHU_HTML} \
		${HOKKAIDO_HTML} ${SHIKOKU_HTML} ${TOHOKU_HTML} \
		${HIGHSCHOOL_HTML} ${NATIONAL_HTML}

${INSTFILES_TRADITIONAL}: DEFAULT_XSL=${XSLDIR}/jca-comp-result.traditional.xsl
${INSTFILES_TRADITIONAL}: XSLT_PARAMS+=-param "output-base" "'$(basename $@)'"
${INSTFILES_TRADITIONAL}: XSLT_OUT=-out /dev/null

${INSTFILES_UTF8}: DEFAULT_XSL=${XSLDIR}/jca-comp-result.utf8.xsl
${INSTFILES_UTF8}: XSLT_PARAMS+=-param "output-base" "'$(basename $@)'"
${INSTFILES_UTF8}: XSLT_OUT=-out /dev/null

include ${SRCTOPDIR}/config.mk
include ${SRCTOPDIR}/rule.mk

.INTERMEDIATE: ${REDIRECT_HTML:%.html=%.xml}
.INTERMEDIATE: ${REDIRECT_HTML:%.html=%.utfxml}

###

${HIGHSCHOOL_HTML:%.html=%.xml}: highschool.xml
	${LN_S} $< $@

${HIGHSCHOOL_HTML:%.html=%.utfxml}: highschool.utfxml
	${LN_S} $< $@

${HOKKAIDO_HTML:%.html=%.xml}: hokkaido.xml
	${LN_S} $< $@

${HOKKAIDO_HTML:%.html=%.utfxml}: hokkaido.utfxml
	${LN_S} $< $@

${KANSAI_HTML:%.html=%.xml}: kansai.xml
	${LN_S} $< $@

${KANSAI_HTML:%.html=%.utfxml}: kansai.utfxml
	${LN_S} $< $@

${KANTO_HTML:%.html=%.xml}: kanto.xml
	${LN_S} $< $@

${KANTO_HTML:%.html=%.utfxml}: kanto.utfxml
	${LN_S} $< $@

${KUMAMOTO_HTML:%.html=%.xml}: kumamoto.xml
	${LN_S} $< $@

${KUMAMOTO_HTML:%.html=%.utfxml}: kumamoto.utfxml
	${LN_S} $< $@

${KYUSHU_HTML:%.html=%.xml}: kyushu.xml
	${LN_S} $< $@

${KYUSHU_HTML:%.html=%.utfxml}: kyushu.utfxml
	${LN_S} $< $@

${NATIONAL_HTML:%.html=%.xml}: national.xml
	${LN_S} $< $@

${NATIONAL_HTML:%.html=%.utfxml}: national.utfxml
	${LN_S} $< $@

${SHIKOKU_HTML:%.html=%.xml}: shikoku.xml
	${LN_S} $< $@

${SHIKOKU_HTML:%.html=%.utfxml}: shikoku.utfxml
	${LN_S} $< $@

${TOHOKU_HTML:%.html=%.xml}: tohoku.xml
	${LN_S} $< $@

${TOHOKU_HTML:%.html=%.utfxml}: tohoku.utfxml
	${LN_S} $< $@
