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
    root.elements.each("urn") { |e| @urn = e.text }
    root.elements.each("name") { |e| @name = e.text }
    root.elements.each("url") { |e| @url = e.text }
    root.elements.each("prefecture") { |e| @pref = e.text }
    root.elements.each("choir-type") { |e| @type = e.text }
    root.elements.each("kind") { |e| @kind = e.text }
    root.elements.each("comment") { |e| @comment = e.text }
    genUrn
    @doc
  end

  def genUrn
    if @urn == nil
      @urn = ChoirId.generate(@kind)
    end
    if @doc.root.elements["urn"].text == nil
      @doc.root.elements["urn"].text = @urn
    end
    @urn
  end

  def write(f)
    @doc.write(File.new(f, File::CREAT|File::WRONLY))
  end
end
