#!/bin/sh

RUBYLIB=prog/ruby; export RUBYLIB
ruby prog/ruby/ChoirRegistManager.rb $*
