# Common rule definitions.
# $Id: rule.mk,v 1.7 1999/08/23 13:23:44 kunishi Exp $
#

.SUFFIXES:	.xml .html

.PHONY:		all install clean subdir install-subdir

%.html:	%.xml
	${XSLT_PROC} $< ${DEFAULT_XSL} | ${UTF2ASCII} | ${ASCII2EUC} \
	  | ${EUC2JIS} > $@
 
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
	  if ! test -d $${dir}; then \
	    mkdir -p $${dir}; \
	  fi; \
	  (cd $${dir} && ${MAKE} install); \
	done
endif

clean:
	-rm -rf *.html
