require 'ChoirId'
require 'rexml/document'

class Choir
  attr_reader :urn, :name, :yomi, :url, :pref, :type, :kind, :comment,
    :created, :modified

  def initialize(f)
    self.read(f)
  end

  def read(f)
    file = File.new(f)
    @doc = REXML::Document.new file
    root = @doc.root
    root.elements.each {
      |e|
      case e.name
      when "urn" 
	@urn = e.text
      when "name"
	@name = e.text
	@yomi = e.attributes["yomi"]
      when "url"
	@url = e.text
      when "prefecture"
	@pref = e.text
      when "choir-type"
	@type = e.text
      when "kind"
	@kind = e.text
      when "comment"
	@comment = e.text
      when "created"
	@created = e.text
      when "modified"
	@modified = e.text
      else
      end
    }
    genUrn
    @doc
  end

  def genUrn
    if @urn == nil
      @urn = ChoirId.generate(@kind)
      @doc.root.elements.each {
	|e|
	if e.name == "urn" && ! e.has_text?
	  e.text = @urn
	end
      }
    end
    @urn
  end

  def write(f)
    @doc.write(File.new(f, File::CREAT|File::WRONLY))
  end
end
