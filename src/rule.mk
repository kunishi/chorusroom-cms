# Common rule definitions.
# $Id: rule.mk,v 1.40 2001/02/12 07:51:03 kunishi Exp $
#

.SUFFIXES:	.xml .html .utfhtml .ent .u8.html .style .xsl

.PHONY:		all install clean subdir install-subdir

define xslt-transform
${SCRIPTDIR}/xalan.sh -xml -in $< -xsl ${DEFAULT_XSL} ${XSLT_OUT} ${XSLT_PARAMS} ${XSLT_OPTIONS}
endef

define fixhtml
${HTML_FORMAT} -m ${TIDY_ENCODING} $@
${PATH_CONFIGURE} $@
endef

ifndef SPECIAL_RULES
%.html:	%.xml ${DEFAULT_XSL}
	$(xslt-transform)
	${PATH_CONFIGURE} $@
%.html:	DEFAULT_XSL=${XSLDIR}/xhtml1-chorusroom.traditional.xsl

%.utfhtml: %.xml ${DEFAULT_XSL}
	$(xslt-transform)
	${PATH_CONFIGURE} $@
%.utfhtml:	DEFAULT_XSL=${XSLDIR}/xhtml1-chorusroom.utf8.xsl
endif

all:	${INSTFILES} subdir

subdir:
ifdef SUBDIR
	@for dir in ${SUBDIR}; do \
	  (cd $${dir} && ${MAKE} -I${SRCTOPDIR}../ all \
	   RELPATH=${RELPATH}$${dir}/ SRCTOPDIR=${SRCTOPDIR}../) \
	done
endif

install:	install-subdir
ifneq ($(join ${INSTFILES},${INSTFILES_NOBUILD}),)
	install -c -p ${INSTFILES} ${INSTFILES_NOBUILD} ${INSTTOPDIR}${RELPATH}
endif

install-subdir:
ifdef SUBDIR
	@for dir in ${SUBDIR}; do \
	  if ! test -d ${INSTTOPDIR}${RELPATH}$${dir}; then \
	    mkdir -p ${INSTTOPDIR}${RELPATH}$${dir}; \
	  fi; \
	  (cd $${dir} && ${MAKE} -I${SRCTOPDIR}../ install \
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
	   ${MAKE} -I${SRCTOPDIR}../ toc \
	     RELPATH=${RELPATH}$${dir}/ SRCTOPDIR=${SRCTOPDIR}../); \
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
	@for dir in ${SUBDIR} ${PREPARE_SUBDIR}; do \
	  (cd $${dir} && ${MAKE} -I${SRCTOPDIR}../ clean \
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
	  (cd $${dir} && ${MAKE} -I${SRCTOPDIR}../ distclean \
	   RELPATH=${RELPATH}$${dir}/ SRCTOPDIR=${SRCTOPDIR}../); \
	done
endif
