require 'Link'
require 'rexml/document'
require 'mysql'

class LinkImporter
  attr_reader :db, :keydb
  DB = 'chorusroom'
  TABLE = 'link'
  KEYTABLE = 'link_key'

  def LinkImporter.create(host, user, passwd)
    if (@@linkdb == nil)
      @@linkdb = LinkImporter.new(host, user, passwd)
    end
    return @@linkdb
  end

  def import(link)
    schema = ['id', 'name', 'yomi', 'url', 'comment', 'created', 'modified']
    tuple = [
      Mysql.quote(link.id.to_s),
      Mysql.quote(link.name.to_s),
      Mysql.quote(link.yomi.to_s),
      Mysql.quote(link.url.to_s),
      Mysql.quote(link.comment.to_s)]
    if ((ans = getByName(link.name)).num_rows() == 0)
      tuple.insert(tuple.length, Time.new().strftime("%Y%m%d%H%M%S"))
      @db.query("INSERT INTO %s (%s) VALUES (%s);", 
		TABLE, 
		schema.join(","), 
		tuple.map {
		  |v|
		  v.instance_of?(String) ? sprintf("'%s'", v) : v
		}.join(","))
    else
      tuple.insert(tuple.length, ans.fetch_hash()['created'])
      @db.query("RELACE INTO %s (%s) VALUES (%s);",
		TABLE, 
		schema.join(","), 
		tuple.map {
		  |v|
		  v.instance_of?(String) ? sprintf("'%s'", v) : v
		}.join(","))
    end
    tupleId = Mysql.insert_id()
    ans = @db.query("SELECT * FROM %s WHERE id=%s;", KEYTABLE, tupleid)
    if (ans.num_rows() != 0)
      @db.query("DELETE FROM %s WHERE id=%s;", KEYTABLE, tupleid)
    end
    @db.query("INSERT INTO %s (id,keyword) VALUES %s;",
	      KEYTABLE,
	      link.kind.map {
		|k|
		sprintf("(%s,'%s')", tupleid, k)
	      }.join(","))
  end

  def getById(id)
    @db.query(sprintf("SELECT * FROM %s WHERE id=%s;", TABLE, id))
  end

  def getByName(name)
    @db.query(sprintf("SELECT * FROM %s WHERE name='%s'", 
		      TABLE, Mysql.quote(name)))
  end

  private
  @@linkdb = nil

  def initialize(host, user, passwd)
    @db = Mysql.new(host, user, passwd, DB)
  end
end

importer = LinkImporter.create('localhost', 'chorusroom', 'pizzetti')

ARGV.each {
  |file|
  doc = REXML::Document.new(File.new(file))
  doc.root.elements.each("//*[local-name()='link']") {
    |element|
    importer.import(Link.importFrom(element))
    puts "imported " + element.name
  }
}
