# Common rule definitions.
# $Id: rule.mk,v 1.26 2000/10/08 23:37:38 kunishi Exp $
#

.SUFFIXES:	.xml .html .utfxml .utfhtml .ent .u8.html .style .xsl

.PHONY:		all install clean subdir install-subdir

ifndef SPECIAL_RULES
%.html:	%.xml ${DEFAULT_XSL}
	${ENV} ${JAVA_ENV} ${XSLT_PROC} -in $< -xsl ${DEFAULT_XSL} -out $@ ${XSLT_PARAMS}
	${SLEEP} 1
	${HTML_FORMAT} -m ${TIDY_ENCODING} $@
	${PATH_CONFIGURE} $@
	${XMLDECL_FIX} $@

%.utfhtml: %.utfxml ${DEFAULT_XSL_UTF8}
	${ENV} ${JAVA_ENV} ${XSLT_PROC} -in $< -xsl ${DEFAULT_XSL_UTF8} -out $@ ${XSLT_PARAMS}
	${SLEEP} 1
	${HTML_FORMAT} -m -utf8 $@
	${PATH_CONFIGURE} $@
	${XMLDECL_FIX} $@

%.u8.html: %.utfxml ${DEFAULT_XSL_UTF8}
	${ENV} ${JAVA_ENV} ${XSLT_PROC} -in $< -xsl ${DEFAULT_XSL_UTF8} -out $@ ${XSLT_PARAMS}
	${SLEEP} 1
	${HTML_FORMAT} -m -utf8 $@
	${PATH_CONFIGURE} $@
	${XMLDECL_FIX} $@

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
