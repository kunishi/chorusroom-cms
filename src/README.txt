「合唱の部屋」に関するメモ書き
$Id: README.txt,v 1.1 2000/09/05 08:53:44 kunishi Exp $

1. 概要
現在、「合唱の部屋」のWWWページは以下の環境でメンテナンスされています。

Computer: 東芝 Libretto ff1100V
          (PentiumII 266MHz, Memory 128MB, HDD 20GB)
OS:       FreeBSD 4.1-STABLE

ページはすべてXMLないしXHTMLで書いてあり、プログラムを使ってHTMLを自動
生成する形式を採っています。

2. 使用プログラム
元のソース文書の編集は Emacs (20.7)を用いています。また、次の major mode
を利用しています。(カッコ内は FreeBSD のパッケージ名。以下同様)
PSGML (editors/psgml-emacs20)

HTMLの自動生成には以下のプログラムを使用しています。
perl  (FreeBSD標準のもの。5.00503)
gmake (devel/gmake)
nkf   (japanese/nkf)
jdk   (java/jdk)
swing (java/swing)
tya   (java/tya)
tcs   (textproc/tcs)
xml4j (textproc/xml4j)
xt    (textproc/xt)
tidy  (www/tidy)

サーバへのアップロードには、以下のプログラムを使用しています。
rsync (net/rsync)

WWWサーバ・全文検索システムは、以下のプログラムを使用しています。
namazu   (japanese/namazu)
apache13 (www/apache13)

3. HTMLページの更新の仕方
トップディレクトリで

% gmake

とすると、すべてのXMLファイルの依存関係を調べ、必要なHTMLファイルを
生成します。
ただし、現在は JDK1.1.8 を使わず JDK1.2.2(アルファ版)を使用する設定に
してありますので、通常の FreeBSD の環境では

% gmake USE_JDK11=yes

とする必要があるでしょう。

WWWサーバにアップロードするためのHTML文書ツリー構築は、トップディレク
トリで次のようにします。

% gmake install

これにより、/usr/local/www/data/chorusRoom/ 以下にHTML文書ツリーが構築
されます。rsync を用いていますので、更新されたファイルのみがコピーされ
ます。

全文検索用のインデックス作成は、トップディレクトリで次のようにします。

% gmake index

更新されたファイルが多くなってきたら、適宜、インデックスのゴミ集めを
行います。

% gmake gcindex

構築されたHTML文書ツリーを、サーバ上のものと同期させるには、トップ
ディレクトリで次のようにします。

% gmake upload
