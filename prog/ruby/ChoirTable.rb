require 'mysql'
require 'Choir'
require 'Pref'

class ChoirTable
  attr_reader :db, :table
  DB = 'chorusroom'
  TABLE = 'choir'

  def ChoirTable.create()
    ChoirTable.create('localhost', 'root', 'chorusroom2706')
  end

  def ChoirTable.create(host, user, passwd)
    if (@@choirtb == nil)
      @@choirtb = ChoirTable.new(host, user, passwd)
    end
    return @@choirtb
  end

  def update(c)
    schema = '(urn,name,url,prefecture,type,kind,comment)'
    tuple =
      "(" + 
      [c.urn, c.name, c.url, Pref.name(c.pref), c.type, 
      c.kind, c.comment].map { |v|
        "'" + Mysql.quote(v) + "'"
      }.join(",") + ")" 
    if (get(c.urn).num_rows() == 0)
      @db.query('INSERT INTO ' + TABLE + schema + ' VALUES ' + tuple + ';')
    else
      @db.query('REPLACE INTO ' + TABLE + schema + ' VALUES ' + tuple + ';')
    end
  end

  def list
    ans = @db.query('SELECT * FROM ' + TABLE + ';')
    ans.each_hash { |t|
      puts t['url']
    }
  end

  def get(urn)
    return @db.query('SELECT * FROM ' + TABLE +
		     " WHERE urn='" + Mysql.quote(urn) + "';")
  end

  private
  @@choirtb = nil

  def initialize(host, user, passwd)
    @db = Mysql.new(host, user, passwd, DB)
  end
end

ct = ChoirTable.create('localhost', 'root', 'chorusroom2706')
c = Choir.new(ARGV[0])
ct.update(c)
ct.list
ct.db().close
