#!/bin/sh

RUBYLIB=`dirname $0`/prog/ruby; export RUBYLIB
ruby `dirname $0`/prog/ruby/ChoirRegistManager.rb $*
