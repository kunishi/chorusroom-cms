# Common rule definitions.
# $Id: rule.mk,v 1.31 2000/11/09 04:32:00 kunishi Exp $
#

.SUFFIXES:	.xml .html .utfxml .utfhtml .ent .u8.html .style .xsl

.PHONY:		all install clean subdir install-subdir

define xslt-transform
${ENV} ${JAVA_ENV} ${XSLT_PROC} -in $< -xsl ${DEFAULT_XSL} ${XSLT_OUT} ${XSLT_PARAMS}
endef

define fixhtml
${HTML_FORMAT} -m ${TIDY_ENCODING} $@
${PATH_CONFIGURE} $@
${XMLDECL_FIX} $@
endef

ifndef SPECIAL_RULES
%.html:	%.xml ${DEFAULT_XSL}
	$(xslt-transform)
	${SLEEP} 1
	$(fixhtml)

%.utfhtml: %.utfxml ${DEFAULT_XSL}
	$(xslt-transform)
	${SLEEP} 1
	$(fixhtml)
%.utfhtml: TIDY_ENCODING=-utf8
%.utfhtml: DEFAULT_XSL=${DEFAULT_XSL_UTF8}

# new rules for reflecting Charset declaration
%.html.euc-jp:	%.xml ${DEFAULT_XSL}
	$(xslt-transform)
	${SLEEP} 1
	$(fixhtml)

%.html.utf8: %.utfxml ${DEFAULT_XSL_UTF8}
	$(xslt-transform)
	${SLEEP} 1
	$(fixhtml)
%.html.utf8: TIDY_ENCODING=-utf8
%.html.utf8: DEFAULT_XSL=${DEFAULT_XSL_UTF8}

%.style: %.xsl
	${ENV} ${JAVA_ENV} ${XSLT_COMPILER} -xsl $< -lxcout $@
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
ifneq ($(join ${INSTFILES},${INSTFILES_NOBUILD}),)
	${SYNC_TOOL} ${INSTFILES} ${INSTFILES_NOBUILD} ${INSTTOPDIR}${RELPATH}
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

toc:
ifeq (${TOPDIR},${SRCTOPDIR})
	${ECHO} "<?xml version=\"1.0\"?>" > ${TOCFILE}
	${ECHO} "<dir name=\"/\">" >> ${TOCFILE}
endif
ifneq ($(join ${INSTFILES},${INSTFILES_NOBUILD}),)
	@for file in ${INSTFILES} ${INSTFILES_NOBUILD}; do \
	  ${ECHO} "<file name=\"$${file}\"/>" >> ${TOCFILE}; \
	done
endif
ifdef SUBDIR
	@for dir in ${SUBDIR}; do \
	  ${ECHO} "<dir name=\"$${dir}\">" >> ${TOCFILE}; \
	  (cd $${dir} && \
	   ${MAKE} toc RELPATH=${RELPATH}$${dir}/ SRCTOPDIR=${SRCTOPDIR}../); \
	  ${ECHO} "</dir>" >> ${TOCFILE}; \
	done
endif
ifeq (${TOPDIR},${SRCTOPDIR})
	${ECHO} "</dir>" >> ${TOCFILE}
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
