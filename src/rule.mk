# Common rule definitions.
# $Id: rule.mk,v 1.1 1999/08/06 02:41:23 kunishi Exp $
#

.SUFFIXES:	.xml .utfhtml .html

.PHONY:		all install clean

%.utfhtml:	%.xml
	${XSLT_PROC} $< ${DEFAULT_XSL} > $@
 
%.html:		%.utfhtml
	${UTF2ASCII} < $< | ${ASCII2EUC} | ${EUC2JIS} | ${HTML_FORMAT} > $@
 
all:	${INSTFILES}

install:
	${SYNC_TOOL} ${INSTFILES} ${INSTTOPDIR}${RELPATH}
 
clean:
	-rm -rf *.utfhtml *.html
