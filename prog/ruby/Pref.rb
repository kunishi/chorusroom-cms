class Pref 
  @@list = {
    "hokkaido"  => "北海道",
    "aomori"    => "青森県",
    "akita"     => "秋田県", 
    "iwate"     => "岩手県", 
    "yamagata"  => "山形県",
    "miyagi"    => "宮城県",
    "fukushima" => "福島県",
    "ibaragi"   => "茨城県",
    "chiba"     => "千葉県",
    "tochigi"   => "栃木県",
    "gunma"     => "群馬県", 
    "saitama"   => "埼玉県", 
    "tokyo"     => "東京都",
    "kanagawa"  => "神奈川県", 
    "yamanashi" => "山梨県",
    "niigata"   => "新潟県",
    "nagano"    => "長野県",
    "shizuoka"  => "静岡県",
    "toyama"    => "富山県",
    "ishikawa"  => "石川県", 
    "fukui"     => "福井県", 
    "gifu"      => "岐阜県",
    "aichi"     => "愛知県",
    "mie"       => "三重県",
    "shiga"     => "滋賀県",
    "kyoto"     => "京都府",
    "osaka"     => "大阪府",
    "hyogo"     => "兵庫県",
    "nara"      => "奈良県",
    "wakayama"  => "和歌山県",
    "tottori"   => "鳥取県",
    "shimane"   => "島根県",
    "okayama"   => "岡山県",
    "hiroshima" => "広島県",
    "yamaguchi" => "山口県",
    "kagawa"    => "香川県",
    "ehime"     => "愛媛県",
    "tokushima" => "徳島県",
    "kochi"     => "高知県",
    "fukuoka"   => "福岡県",
    "saga"      => "佐賀県",
    "nagasaki"  => "長崎県",
    "oita"      => "大分県",
    "kumamoto"  => "熊本県",
    "miyazaki"  => "宮崎県",
    "kagoshima" => "鹿児島県",
    "okinawa"   => "沖縄県"
  }

  @@revlist = @@list.invert

  @@idlist = {
    1 => "北海道",
    2 => "青森県",
    3 => "秋田県", 
    4 => "岩手県", 
    5 => "山形県",
    6 => "宮城県",
    7 => "福島県",
    8 => "茨城県",
    9 => "栃木県",
    10 => "群馬県", 
    11 => "埼玉県", 
    12 => "千葉県",
    13 => "東京都",
    14 => "神奈川県", 
    15 => "山梨県",
    16 => "新潟県",
    17 => "富山県",
    18 => "石川県", 
    19 => "福井県", 
    20 => "長野県",
    21 => "岐阜県",
    22 => "静岡県",
    23 => "愛知県",
    24 => "三重県",
    25 => "滋賀県",
    26 => "京都府",
    27 => "大阪府",
    28 => "兵庫県",
    29 => "奈良県",
    30 => "和歌山県",
    31 => "鳥取県",
    32 => "島根県",
    33 => "岡山県",
    34 => "広島県",
    35 => "山口県",
    36 => "香川県",
    37 => "徳島県",
    38 => "愛媛県",
    39 => "高知県",
    40 => "福岡県",
    41 => "佐賀県",
    42 => "長崎県",
    43 => "大分県",
    44 => "熊本県",
    45 => "宮崎県",
    46 => "鹿児島県",
    47 => "沖縄県",
    48 => "海外",
    49 => "その他"
  }    

  @@revid = @@idlist.invert

  def Pref.jname(name)
    @@list.fetch(name)
  end

  def Pref.name(jname)
    @@revlist.fetch(jname)
  end

  def Pref.nameById(id)
    @@idlist.fetch(id)
  end

  def Pref.idByName(name)
    @@revid.fetch(name)
  end
end
