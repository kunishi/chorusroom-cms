require 'mysql'
require 'Choir'
require 'Pref'

class ChoirTable
  attr_reader :db, :table
  DB = 'chorusroom'
  TABLE = 'choir'

  def ChoirTable.create()
    ChoirTable.create('localhost', 'chorusroom', 'pizzetti')
  end

  def ChoirTable.create(host, user, passwd)
    if (@@choirtb == nil)
      @@choirtb = ChoirTable.new(host, user, passwd)
    end
    return @@choirtb
  end

  def update(c)
    schema = ['urn', 'name', 'url', 'pref', 'type', 'kind', 'comment',
      'created']
    tuple = [c.urn, c.name, c.url, c.pref, c.type, c.kind, c.comment]
    if ((ans = get(c.urn)).num_rows() == 0)
      tuple.insert(tuple.length, Time.new().strftime("%Y%m%d%H%M%S"))
      @db.query('INSERT INTO ' + TABLE +
		sprintf("(%s)", schema.join(",")) +
		' VALUES ' + sprintf("(%s)",
				     tuple.map {
				       |v|
				       sprintf("'%s'", Mysql.quote(v))
				     }.join(",")) +
		';')
    else
      tuple.insert(tuple.length, ans.fetch_hash()['created'])
      @db.query('REPLACE INTO ' + TABLE +
		sprintf("(%s)", schema.join(",")) +
		' VALUES ' + sprintf("(%s)",
				     tuple.map {
				       |v|
				       sprintf("'%s'", Mysql.quote(v))
				     }.join(",")) +
		';')
    end
  end

  def list
    ans = @db.query('SELECT * FROM ' + TABLE + ';')
    ans.each_hash { |t|
      puts t['name']
    }
  end

  def get(urn)
    return @db.query('SELECT * FROM ' + TABLE +
		     " WHERE urn=" + sprintf("'%s'", Mysql.quote(urn)) + ";")
  end

  private
  @@choirtb = nil

  def initialize(host, user, passwd)
    @db = Mysql.new(host, user, passwd, DB)
  end

end

ct = ChoirTable.create('localhost', 'root', 'chorusroom2706')

ARGV.each {
  |entry|
  c = Choir.new(entry)
  ct.update(c)
  puts "register " + c.name
}
# ct.list
ct.db().close
