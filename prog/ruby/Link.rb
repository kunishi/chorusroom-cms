require 'rexml/document'

class Link
  attr_reader :id, :name, :yomi, :url, :kind, :comment, :created, :modified

  def initialize(id, name, yomi, url, kind, comment, created, modified)
    @id = id
    @name = name
    @yomi = yomi
    @url = url
    @kind = kind
    @comment = comment
    @created = created
    @modified = modified
  end

  def Link.importFrom(e)
    if (!e.nil?)
      if (e.instance_of?(REXML::Element))
	Link.new(nil,
		 e.elements["*[local-name()='name']"].text,
		 e.elements["*[local-name()='name']"].attributes["yomi"],
		 e.elements["*[local-name()='url']"].text,
		 e.elements["*[local-name()='kind']/text()"],
		 e.elements["*[local-name()='comment']"].text,
		 nil,
		 nil)
      else
	nil
      end
    end
  end
end

# ARGV.each {
#   |file|
#   doc = REXML::Document.new(File.new(file))
#   doc.root.elements.each("//*[local-name()='link']") {
#     |element|
#     puts Link.importFrom(element).kind
#   }
# }
