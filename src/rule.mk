# Common rule definitions.
# $Id: rule.mk,v 1.16 1999/11/20 23:41:41 kunishi Exp $
#

.SUFFIXES:	.xml .html .utfxml .utfhtml .ent

.PHONY:		all install clean subdir install-subdir

ifndef SPECIAL_RULES
%.html:	%.xml
	${ENV} ${MAKE_ENV} ${XSLT_PROC} $< ${DEFAULT_XSL} > $@

%.utfhtml: %.utfxml
	${ENV} ${MAKE_ENV} ${XSLT_PROC} $< ${DEFAULT_XSL_UTF8} > $@
endif

%.utfxml: %.xml
	${XML2UTFXML} $< > $@

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
