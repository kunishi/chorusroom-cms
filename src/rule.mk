# Common rule definitions.
# $Id: rule.mk,v 1.13 1999/09/26 16:27:32 kunishi Exp $
#

.SUFFIXES:	.xml .html .utfxml .utfhtml

.PHONY:		all install clean subdir install-subdir

%.html:	%.xml
	${ENV} ${MAKE_ENV} ${XSLT_PROC} $< ${DEFAULT_XSL} > $@

%.utfxml: %.xml
	${XML2UTFXML} $< > $@

%.utfhtml: %.utfxml
	${ENV} ${MAKE_ENV} ${XSLT_PROC} $< ${DEFAULT_XSL_UTF8} > $@
 
all:	${INSTFILES} subdir

subdir:
ifdef SUBDIR
	@for dir in ${SUBDIR}; do \
	  (cd $${dir} && ${MAKE} all) \
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
	  (cd $${dir} && ${MAKE} install); \
	done
endif

clean:
	-rm -rf *.html *.utfhtml
