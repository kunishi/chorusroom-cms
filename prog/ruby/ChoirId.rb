# require 'Time'
require 'KindTag'

class ChoirId
  def ChoirId.generate(tag)
    t = Time.new
    KindTag.get(tag) + t.strftime("%Y%m%d%H%M%S")
  end
end
