# Common rule definitions.
# $Id: rule.mk,v 1.23 2000/09/28 02:15:16 kunishi Exp $
#

.SUFFIXES:	.xml .html .utfxml .utfhtml .ent .u8.html

.PHONY:		all install clean subdir install-subdir

ifndef SPECIAL_RULES
%.html:	%.xml
	${ENV} ${XSLT_ENV} ${XSLT_PROC} $< ${DEFAULT_XSL} | ${ASCII2EUC} | ${EUC2JIS} > $@
	${PATH_CONFIGURE} $@
	${HTML_FORMAT} -m -iso2022 $@

%.utfhtml: %.utfxml
	${ENV} ${XSLT_ENV} ${XSLT_PROC} $< ${DEFAULT_XSL_UTF8} > $@
	${PATH_CONFIGURE} $@
	${HTML_FORMAT} -m -utf8 $@

%.u8.html: %.utfxml
	${ENV} ${XSLT_ENV} ${XSLT_PROC} $< ${DEFAULT_XSL_UTF8} > $@
	${PATH_CONFIGURE} $@
	${HTML_FORMAT} -m -utf8 $@
endif

%.utfxml: %.xml
	${XML2UTFXML} $< > $@

all:	${INSTFILES} subdir

subdir:
ifdef SUBDIR
	@for dir in ${SUBDIR}; do \
	  (cd $${dir} && ${MAKE} all \
	   RELPATH=${RELPATH}$${dir}/ SRCTOPDIR=${SRCTOPDIR}../) \
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
	  if ! test -d ${INSTTOPDIR}${RELPATH}$${dir}; then \
	    mkdir -p ${INSTTOPDIR}${RELPATH}$${dir}; \
	  fi; \
	  (cd $${dir} && ${MAKE} install \
	   RELPATH=${RELPATH}$${dir}/ SRCTOPDIR=${SRCTOPDIR}../); \
	done
endif

clean:	clean-subdir
ifdef INSTFILES
	-rm -f ${INSTFILES}
endif

clean-subdir:
ifdef SUBDIR
	@for dir in ${SUBDIR}; do \
	  (cd $${dir} && ${MAKE} clean \
	   RELPATH=${RELPATH}$${dir}/ SRCTOPDIR=${SRCTOPDIR}../); \
	done
endif

distclean:	distclean-subdir
ifdef INSTFILES
	-rm -f ${INSTFILES}
endif
ifdef GENFILES
	-rm -f ${GENFILES}
endif

distclean-subdir:
ifdef SUBDIR
	@for dir in ${SUBDIR}; do \
	  (cd $${dir} && ${MAKE} distclean \
	   RELPATH=${RELPATH}$${dir}/ SRCTOPDIR=${SRCTOPDIR}../); \
	done
endif
