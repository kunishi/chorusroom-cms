require 'rexml/document'

class Link
  attr_reader :id, :name, :url, :kind, :comment, :created, :modified

  def initialize(id, name, url, kind, comment, created, modified)
    @id = id
    @name = name
    @url = url
    @kind = kind
    @comment = comment
    @created = created
    @modified = modified
  end

  def Link.import(e)
  end
end
