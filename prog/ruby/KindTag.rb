class KindTag
  @@list = {
    "general" => "CG",
    "univ" => "CU",
    "company" => "CC",
    "highschool" => "CS",
    "children" => "CH"
  }

  @@jlist = {
    "general" => "一般",
    "univ" => "大学",
    "company" => "職場",
    "highschool" => "中学・高校",
    "children" => "児童合唱"
  }

  def KindTag.get(tag)
    @@list[tag]
  end

  def KindTag.jname(tag)
    @@jlist[tag]
  end
end

