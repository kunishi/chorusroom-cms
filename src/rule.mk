# Common rule definitions.
# $Id: rule.mk,v 1.2 1999/08/17 06:11:35 kunishi Exp $
#

.SUFFIXES:	.xml .html

.PHONY:		all install clean

%.html:	%.xml
	${XSLT_PROC} $< ${DEFAULT_XSL} > $@
 
# %.html:		%.utfhtml
# 	${UTF2ASCII} < $< | ${ASCII2EUC} | ${EUC2JIS} | ${HTML_FORMAT} > $@
 
all:	${INSTFILES}

install:
	${SYNC_TOOL} ${INSTFILES} ${INSTTOPDIR}${RELPATH}
 
clean:
	-rm -rf *.html
