#!/usr/bin/env ruby

require 'xml/xslt'
require 'rexml/document'

xslt = XML::XSLT.new()
xslt.xml = ARGV[0]
xslt.xslfile = 'concours2body.xsl'
out = xslt.serve()
xslt.xslfile = 'concours2title.xsl'
title = xslt.serve()

doc = REXML::Document.new()
doc << REXML::XMLDecl.new('1.0', 'utf-8')
el = doc.add_element "templateItems",
  {
  "codeOutsiteHTMLIsLocked" => "false", 
  "template" => "/Templates/default.dwt"
  }
e = el.add_element "item", { "name" => "head" }
e = el.add_element "item", { "name" => "doctitle" }
e.add_text REXML::CData.new(title)
e = el.add_element "item", { "name" => "DocumentBody" }
e.add_text REXML::CData.new(out)

print doc.to_s
