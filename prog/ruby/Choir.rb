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
    @urn = root.elements["urn"].text
    @name = root.elements["name"].text
    @url = root.elements["url"].text
    @pref = root.elements["prefecture"].text
    if root.elements["choir-type"] != nil
      @type = root.elements["choir-type"].text
    end
    @kind = root.elements["kind"].text
    @comment = root.elements["comment"].text
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
