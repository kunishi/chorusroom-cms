#!/usr/local/bin/ruby
#
# a script for fixing irregular result of Xalan
# $Id: fix-xmldecl-duplication.rb,v 1.3 2000/10/04 05:37:14 kunishi Exp $

ARGV.each {
  |file|

  $xmldecl = 'no'
  $fd = File.open(file)
  $newfd = File.new(file + '.new', "w+")
  while $_ = $fd.gets
    if $_ =~ /^<\?xml version="1.0" / then
      if $xmldecl == 'yes' then next end
      $xmldecl = 'yes'
    end
    $newfd.print $_
  end
  $fd.close
  $newfd.close
  File.rename(file + '.new', file)
}
