# Common rule definitions.
# $Id: rule.mk,v 1.20 2000/08/28 00:09:35 kunishi Exp $
#

.SUFFIXES:	.xml .html .utfxml .utfhtml .ent

.PHONY:		all install clean subdir install-subdir

ifndef SPECIAL_RULES
%.html:	%.xml
	${ENV} ${XSLT_ENV} ${XSLT_PROC} $< ${DEFAULT_XSL} | ${ASCII2EUC} | ${EUC2JIS} > $@
	${PERL} -pi -e "s@%%TOPDIR%%@${SRCTOPDIR}@g; \
			s@%%STYLEDIR%%@${STYLEDIR}@g;" $@
	${HTML_FORMAT} -m -iso2022 $@

%.utfhtml: %.utfxml
	${ENV} ${XSLT_ENV} ${XSLT_PROC} $< ${DEFAULT_XSL_UTF8} > $@
	${PERL} -pi -e "s@%%TOPDIR%%@${SRCTOPDIR}@g; \
			s@%%STYLEDIR%%@${STYLEDIR}@g;" $@
	${HTML_FORMAT} -m -utf8 $@
endif

%.utfxml: %.xml
	${XML2UTFXML} $< > $@

all:	${INSTFILES} subdir

subdir:
ifdef SUBDIR
	@for dir in ${SUBDIR}; do \
	  (cd $${dir} && ${MAKE} all \
	   RELPATH=${RELPATH}/$${dir} SRCTOPDIR=${SRCTOPDIR}/..) \
	done
endif

install:	install-subdir
ifdef INSTFILES
	${SYNC_TOOL} ${INSTFILES} ${INSTTOPDIR}${RELPATH}
endif
ifdef INSTFILES_NOBUILD
	${SYNC_TOOL} ${INSTFILES_NOBUILD} ${INSTTOPDIR}${RELPATH}
endif

install-subdir:
ifdef SUBDIR
	@for dir in ${SUBDIR}; do \
	  if ! test -d ${INSTTOPDIR}${RELPATH}/$${dir}; then \
	    mkdir -p ${INSTTOPDIR}${RELPATH}/$${dir}; \
	  fi; \
	  (cd $${dir} && ${MAKE} install \
	   RELPATH=${RELPATH}/$${dir} SRCTOPDIR=${SRCTOPDIR}/..); \
	done
endif

clean:
	-rm -rf *.html *.utfhtml
