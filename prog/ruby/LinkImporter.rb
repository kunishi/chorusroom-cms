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
    schema = ['id', 'name', 'yomi', 'url', 'comment', 'created']
    tuple = [
      Mysql.quote(link.id.to_s),
      Mysql.quote(link.name.to_s),
      Mysql.quote(link.yomi.to_s),
      Mysql.quote(link.url.to_s),
      Mysql.quote(link.comment.to_s)]
    if ((ans = getByName(link.name)).num_rows() == 0)
      tuple.insert(tuple.length, Time.new().strftime("%Y%m%d%H%M%S"))
      @db.query(sprintf("INSERT INTO %s (%s) VALUES (%s);", 
			TABLE, 
			schema.join(","), 
			tuple.map {
			  |v|
			  v.instance_of?(String) ? sprintf("'%s'", v) : v
			}.join(",")))
    else
      tuple.insert(tuple.length, ans.fetch_hash()['created'])
      @db.query(sprintf("REPLACE INTO %s (%s) VALUES (%s);",
			TABLE, 
			schema.join(","), 
			tuple.map {
			  |v|
			  v.instance_of?(String) ? sprintf("'%s'", v) : v
			}.join(",")))
    end
    tupleId = @db.insert_id()
    ans = @db.query(sprintf("SELECT * FROM %s WHERE id=%s;", KEYTABLE, tupleId))
    if (ans.num_rows() != 0)
      @db.query(sprintf("DELETE FROM %s WHERE id=%s;", KEYTABLE, tupleId))
    end
    @db.query(sprintf("INSERT INTO %s (id,keyword) VALUES %s;",
		      KEYTABLE,
		      link.kind.map {
			|k|
			sprintf("(%s,'%s')", tupleId, k)
		      }.join(",")))
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
    l = Link.importFrom(element)
    importer.import(l)
    puts "imported " + l.name
  }
}
