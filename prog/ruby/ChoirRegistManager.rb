require 'Choir'
require 'KindTag'
require 'Pref'
require 'timeout'

class ChoirRegistManager
  @@basedir = ENV['HOME'] + "/Documents/svn/chorusRoom"
  @@dbdir = @@basedir + "/db/choir"

  def regist(f, dir)
    c = Choir.new(f)
    new = false
    path = @@dbdir + "/" + KindTag.get(c.kind) + "/" + c.urn
    if Dir[path].length == 0
      new = true
      Dir.mkdir(path)
    end
    c.write(path + "/" + c.urn + ".xml")

    pwd = Dir.pwd
    Dir.chdir(dir)

    ref = File.new("idref" + c.urn, "w")
    ref.puts(linkentry(c))
    ref.close

    list = File.new("list", "a")
    list.puts(newsentry(c, new))
    list.close

    rss = File.new("rss", "a")
    rss.print(rssentry(c, new))
    rss.close

    Dir.chdir(pwd)
  end

  private
  def linkentry(choir)
    choidref(choir.urn, "c") + "  " + comment(choir.name)
  end

  def newsentry(choir, new)
    "<li>" +
      category(choir) + ' ' +
      ahref(choir.name, choir.url) + "  " +
      enthref(internaluri(choir)) +
      (new ? " (新規)" : " (変更)") +
      "</li>"
  end

  def rssentry(choir, new)
    choir.name + " (" +
      KindTag.jname(choir.kind) + "・" + choir.pref + "、" +
      (new ? "新規" : "変更") + ")、"
  end

  def category(c)
    "[リンク集&gt;合唱団&gt;" + KindTag.jname(c.kind) + "(" + c.pref + ")]"
  end

  def choidref(id, prefix)
    qname = "choirIdRef"
    if prefix != nil
      qname = prefix + ":" + qname
    end
    "<" + qname + " id=\"" + id + "\"/>"
  end

  def ahref(src, dst)
    "<a href='" + dst + "'>" + src + "</a>"
  end

  def enthref(dst)
    "[<a href='" + dst + "'>詳細</a>]"
  end

  def internaluri(c)
    "/choir/" + KindTag.get(c.kind) + "/" + c.urn + "/"  + c.urn
  end

  def comment(str)
    "<!-- " + str + " -->"
  end
end

crm = ChoirRegistManager.new
dir = Time.now.to_i.to_s
Dir.mkdir(dir)
ARGV.each {
  |entry|
  crm.regist(entry, dir)
  sleep 1
}
