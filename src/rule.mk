# Common rule definitions.
# $Id: rule.mk,v 1.5 1999/08/22 15:53:11 kunishi Exp $
#

.SUFFIXES:	.xml .html

.PHONY:		all install clean subdir install-subdir

%.html:	%.xml
	${XSLT_PROC} $< ${DEFAULT_XSL} > $@
 
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
	  if ! test -d $${dir} && mkdir -p $${dir}; \
	  (cd $${dir} && ${MAKE} install) \
	done
endif

clean:
	-rm -rf *.html
