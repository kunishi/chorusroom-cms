# Common rule definitions.
# $Id: rule.mk,v 1.9 1999/08/25 11:49:39 kunishi Exp $
#

.SUFFIXES:	.xml .html

.PHONY:		all install clean subdir install-subdir

%.html:	%.xml
	${XSLT_PROC} $< ${DEFAULT_XSL} | ${UTF2ASCII} | ${ASCII2EUC} | ${EUC2JIS} > $@
 
all:	${INSTFILES} subdir

subdir:
ifdef SUBDIR
	@for dir in ${SUBDIR}; do \
	  (cd $${dir} && ${MAKE} all) \
	done
endif

install:	install-subdir
	${SYNC_TOOL} ${INSTFILES} ${INSTFILES_NOBUILD} ${INSTTOPDIR}${RELPATH}

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
	-rm -rf *.html
