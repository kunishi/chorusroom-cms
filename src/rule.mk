# Common rule definitions.
# $Id: rule.mk,v 1.4 1999/08/22 15:25:44 kunishi Exp $
#

.SUFFIXES:	.xml .html

.PHONY:		all install clean subdir install-subdir

%.html:	%.xml
	${XSLT_PROC} $< ${DEFAULT_XSL} > $@
 
all:	${INSTFILES} subdir

subdir:
ifdef SUBDIR
	for dir in ${SUBDIR}; do \
	  (cd $${dir} && ${MAKE} all) \
	done
endif

install:	install-subdir
	${SYNC_TOOL} ${INSTFILES} ${INSTTOPDIR}${RELPATH}

install-subdir:
ifdef SUBDIR
	for dir in ${SUBDIR}; do \
	  (cd $${dir} && ${MAKE} install) \
	done
endif

clean:
	-rm -rf *.html
