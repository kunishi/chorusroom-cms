require 'ChoirId'
require 'rexml/document'

class Choir
  attr_reader :urn, :name, :url, :pref, :type, :kind, :comment

  def initialize(f)
    self.read(f)
  end

  def read(f)
    file = File.new(f)
    @doc = REXML::Document.new file
    root = @doc.root
    root.elements.each("c:urn or urn") { |e| @urn = e.text }
    root.elements.each("c:name or name") { |e| @name = e.text }
    root.elements.each("c:url or url") { |e| @url = e.text }
    root.elements.each("c:prefecture or prefecture") { |e| @pref = e.text }
    root.elements.each("c:choir-type or choir-type") { |e| @type = e.text }
    root.elements.each("c:kind or kind") { |e| @kind = e.text }
    root.elements.each("c:comment or comment") { |e| @comment = e.text }
    genUrn
    @doc
  end

  def genUrn
    if @urn == nil
      @urn = ChoirId.generate(@kind)
    end
    node = @doc.root.elements["c:urn or urn"]
    if node.text == nil
      node.text = @urn
    end
    @urn
  end

  def write(f)
    @doc.write(File.new(f, File::CREAT|File::WRONLY))
  end
end
