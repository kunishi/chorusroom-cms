<?xml version='1.0' encoding='utf-8'?>
<xsl:stylesheet version='1.0'
  xmlns:xsl='http://www.w3.org/1999/XSL/Transform'
  xmlns:c='http://www.chorusroom.org/choir'
  xmlns:cr='http://www.chorusroom.org/character'
  xmlns='http://www.w3.org/1999/xhtml'
  exclude-result-prefixes='c cr'>

  <xsl:import href="common.xsl"/>
  <xsl:output method='xml' indent='yes' encoding='utf-8'/>

  <xsl:template match='/'>
    <html>
      <head>
        <title>
          <xsl:text>合唱の部屋:合唱団リンク:</xsl:text>
          <xsl:value-of select='c:choir/c:name'/>
        </title>
	<xsl:call-template name="additional-header"/>
      </head>
      <body>
	<xsl:call-template name="body-header"/>
        <h1>
          <xsl:value-of select='c:choir/c:name'/>
        </h1>
        <table border='1'>
          <tbody>
            <tr>
              <th align='left'>種別</th>
              <td>
                <xsl:apply-templates select='c:choir/c:kind' />
              </td>
            </tr>
            <tr>
              <th align='left'>主な活動地域(都道府県)</th>
              <td>
                <xsl:value-of select='c:choir/c:prefecture'/>
              </td>
            </tr>
            <tr>
              <th align='left'>ホームページURL</th>
              <td>
		<xsl:for-each select="c:choir/c:url">
		  <xsl:apply-templates select="."/>
		  <xsl:if test="not(position()=last())">
		    <br/>
		  </xsl:if>
		</xsl:for-each>
              </td>
            </tr>
            <tr>
              <th align='left'>コメント</th>
              <td>
                <xsl:value-of select='c:choir/c:comment'/>
              </td>
            </tr>
          </tbody>
        </table>
        <xsl:call-template name='google-search'>
          <xsl:with-param name='name'>
            <xsl:value-of select='c:choir/c:name'/>
          </xsl:with-param>
        </xsl:call-template>
	<xsl:call-template name="footer"/>
      </body>
    </html>
  </xsl:template>

  <xsl:template match='c:kind'>
    <xsl:choose>
      <xsl:when test='.="general"'>
	<a>
	  <xsl:attribute name="href">
	    <xsl:text>/links/Choir/General/</xsl:text>
	  </xsl:attribute>
	  <xsl:text>一般</xsl:text>
	</a>
      </xsl:when>
      <xsl:when test='.="univ"'>
	<a>
	  <xsl:attribute name="href">
	    <xsl:text>/links/Choir/Univ/</xsl:text>
	  </xsl:attribute>
	  <xsl:text>大学</xsl:text>
	</a>
      </xsl:when>
      <xsl:when test='.="company"'>
	<a>
	  <xsl:attribute name="href">
	    <xsl:text>/links/Choir/Company/</xsl:text>
	  </xsl:attribute>
	  <xsl:text>職場</xsl:text>
	</a>
      </xsl:when>
      <xsl:when test='.="highschool"'>
	<a>
	  <xsl:attribute name="href">
	    <xsl:text>/links/Choir/Highschool/</xsl:text>
	  </xsl:attribute>
	  <xsl:text>中学・高校</xsl:text>
	</a>
      </xsl:when>
      <xsl:when test='.="children"'>
	<a>
	  <xsl:attribute name="href">
	    <xsl:text>/links/Choir/Children/</xsl:text>
	  </xsl:attribute>
	  <xsl:text>児童合唱</xsl:text>
	</a>
      </xsl:when>
      <xsl:otherwise>
        <xsl:text>そのほか</xsl:text>
      </xsl:otherwise>
    </xsl:choose>
  </xsl:template>

  <xsl:template match="c:url">
    <a>
      <xsl:attribute name='href'>
	<xsl:value-of select='.'/>
      </xsl:attribute>
      <xsl:value-of select='.'/>
    </a>
  </xsl:template>

  <xsl:template name='google-search'>
    <xsl:param name='name'></xsl:param>
    <xsl:comment> SiteSearch Google </xsl:comment>
    <form method='GET' action='http://www.google.co.jp/search'>
      <table bgcolor='#FFFFFF'>
        <tr valign='top'>
          <td>
            <a href='http://www.google.co.jp/'>
              <img src='http://www.google.com/logos/Logo_40wht.gif'
                border='0' alt='Google' align='absmiddle'/>
            </a>
          </td>
          <td>
            <input type='text' name='q' size='31' maxlenght='255'>
              <xsl:attribute name='value'>
                <xsl:value-of select='$name'/>
              </xsl:attribute>
            </input>
            <input type='hidden' name='hl' value='ja' />
            <input type='submit' name='btnG' value='Google検索' />
            <font size='-1'>
              <input type='hidden' name='domains' value='chorusroom.org' />
              <br />
                <input type='radio' name='sitesearch' value='' />
                  <xsl:text>WWWを検索</xsl:text>
                  <input type='radio' name='sitesearch'
                    value='chorusroom.org' checked='checked' />
                    <xsl:text>「合唱の部屋」内を検索</xsl:text>
            </font>
          </td>
        </tr>
      </table>
    </form>
    <xsl:comment> SiteSearch Google </xsl:comment>
  </xsl:template>
</xsl:stylesheet>
