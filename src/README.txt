$B!V9g>'$NIt20!W$K4X$9$k%a%b=q$-(B
$Id: README.txt,v 1.1 2000/09/05 08:53:44 kunishi Exp $

1. $B35MW(B
$B8=:_!"!V9g>'$NIt20!W$N(BWWW$B%Z!<%8$O0J2<$N4D6-$G%a%s%F%J%s%9$5$l$F$$$^$9!#(B

Computer: $BEl<G(B Libretto ff1100V
          (PentiumII 266MHz, Memory 128MB, HDD 20GB)
OS:       FreeBSD 4.1-STABLE

$B%Z!<%8$O$9$Y$F(BXML$B$J$$$7(BXHTML$B$G=q$$$F$"$j!"%W%m%0%i%`$r;H$C$F(BHTML$B$r<+F0(B
$B@8@.$9$k7A<0$r:N$C$F$$$^$9!#(B

2. $B;HMQ%W%m%0%i%`(B
$B85$N%=!<%9J8=q$NJT=8$O(B Emacs (20.7)$B$rMQ$$$F$$$^$9!#$^$?!"<!$N(B major mode
$B$rMxMQ$7$F$$$^$9!#(B($B%+%C%3Fb$O(B FreeBSD $B$N%Q%C%1!<%8L>!#0J2<F1MM(B)
PSGML (editors/psgml-emacs20)

HTML$B$N<+F0@8@.$K$O0J2<$N%W%m%0%i%`$r;HMQ$7$F$$$^$9!#(B
perl  (FreeBSD$BI8=`$N$b$N!#(B5.00503)
gmake (devel/gmake)
nkf   (japanese/nkf)
jdk   (java/jdk)
swing (java/swing)
tya   (java/tya)
tcs   (textproc/tcs)
xml4j (textproc/xml4j)
xt    (textproc/xt)
tidy  (www/tidy)

$B%5!<%P$X$N%"%C%W%m!<%I$K$O!"0J2<$N%W%m%0%i%`$r;HMQ$7$F$$$^$9!#(B
rsync (net/rsync)

WWW$B%5!<%P!&A4J88!:w%7%9%F%`$O!"0J2<$N%W%m%0%i%`$r;HMQ$7$F$$$^$9!#(B
namazu   (japanese/namazu)
apache13 (www/apache13)

3. HTML$B%Z!<%8$N99?7$N;EJ}(B
$B%H%C%W%G%#%l%/%H%j$G(B

% gmake

$B$H$9$k$H!"$9$Y$F$N(BXML$B%U%!%$%k$N0MB84X78$rD4$Y!"I,MW$J(BHTML$B%U%!%$%k$r(B
$B@8@.$7$^$9!#(B
$B$?$@$7!"8=:_$O(B JDK1.1.8 $B$r;H$o$:(B JDK1.2.2($B%"%k%U%!HG(B)$B$r;HMQ$9$k@_Dj$K(B
$B$7$F$"$j$^$9$N$G!"DL>o$N(B FreeBSD $B$N4D6-$G$O(B

% gmake USE_JDK11=yes

$B$H$9$kI,MW$,$"$k$G$7$g$&!#(B

WWW$B%5!<%P$K%"%C%W%m!<%I$9$k$?$a$N(BHTML$BJ8=q%D%j!<9=C[$O!"%H%C%W%G%#%l%/(B
$B%H%j$G<!$N$h$&$K$7$^$9!#(B

% gmake install

$B$3$l$K$h$j!"(B/usr/local/www/data/chorusRoom/ $B0J2<$K(BHTML$BJ8=q%D%j!<$,9=C[(B
$B$5$l$^$9!#(Brsync $B$rMQ$$$F$$$^$9$N$G!"99?7$5$l$?%U%!%$%k$N$_$,%3%T!<$5$l(B
$B$^$9!#(B

$BA4J88!:wMQ$N%$%s%G%C%/%9:n@.$O!"%H%C%W%G%#%l%/%H%j$G<!$N$h$&$K$7$^$9!#(B

% gmake index

$B99?7$5$l$?%U%!%$%k$,B?$/$J$C$F$-$?$i!"E,59!"%$%s%G%C%/%9$N%4%_=8$a$r(B
$B9T$$$^$9!#(B

% gmake gcindex

$B9=C[$5$l$?(BHTML$BJ8=q%D%j!<$r!"%5!<%P>e$N$b$N$HF14|$5$;$k$K$O!"%H%C%W(B
$B%G%#%l%/%H%j$G<!$N$h$&$K$7$^$9!#(B

% gmake upload
