<html xmlns="http://www.w3.org/1999/xhtml">
	<head>
		<meta http-equiv="content-type" content="text/html; encoding=utf-8" />
		<title>テスト</title>
	</head>
	<body>
		<h1>テスト</h1>
		<ul>
		<?php
			$array = array('北海道', '青森県', '秋田県', '岩手県', '山形県', '宮城県', '福島県', 
					'茨城県', '千葉県', '栃木県', '群馬県', '埼玉県', '東京都', '神奈川県', '山梨県', '新潟県', '静岡県',
					'富山県', '石川県', '福井県', '長野県', '岐阜県', '愛知県', '三重県', 
					'滋賀県', '京都府', '大阪府', '兵庫県', '奈良県', '和歌山県', 
					'鳥取県', '島根県', '岡山県', '広島県', '山口県', 
					'香川県', '徳島県', '愛媛県', '高知県',
					'福岡県', '佐賀県', '長崎県', '熊本県', '大分県', '宮崎県', '鹿児島県', '沖縄県',
					'海外', 'その他');
			// $db = mysql_connect("localhost", "chorusroom", "pizzetti");
			$db = mysql_connect("localhost", "root");
			mysql_select_db("chorusroom");
			while ($entry = each($array)) {
				$pref = $entry[value];
				printf("<li>%s", $pref);
				$result = mysql_query("SELECT * FROM choir WHERE kind='general' AND pref='$pref'");
				if ($myrow = mysql_fetch_array($result)) {
					echo "<ul>";
					do {
						$comment = $myrow["comment"];
						if (strlen($comment) > 200) {
							$comment = sprintf("%s…", substr($comment, 0, 200));
						}
						printf("<li><a href='%s'>%s</a> %s</li>",
								$myrow["url"], $myrow["name"], $comment);
					} while ($myrow = mysql_fetch_array($result));
					echo "</ul>";
				} else {
					echo "<br />登録されているリンクはありません。";
				}
				echo "</li>";
			}
			mysql_close($db);
		?>
		</ul>
	</body>
</html>