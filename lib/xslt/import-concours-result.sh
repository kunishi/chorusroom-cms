#!/bin/sh

KIND=$1
SRC=$2
DOCBASE=$HOME/Documents/svn/chorusRoom/db/concours/$KIND
OUTDIR=$HOME/Documents/chorusRoom/concours/$KIND
MODE=$3

case "$MODE" in
'result')
	STYLE=contest-result.xsl
	OUT=$OUTDIR/`basename $SRC .xml`.html
	;;
'score')
	STYLE=contest-result-score.xsl
	OUT=$OUTDIR/`basename $SRC .xml`-score.html
	;;
esac

echo xsltproc -o $OUT --param docBase \"$DOCBASE\" $STYLE $DOCBASE/$SRC 
xsltproc -o $OUT --param docBase \"$DOCBASE\" $STYLE $DOCBASE/$SRC 
