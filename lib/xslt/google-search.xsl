<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
		xmlns="http://www.w3.org/1999/xhtml"
		version="1.0">

  <xsl:template name="google-search">
    <form method="get" action="http://www.google.co.jp/search">
      <table class="google">
	<tr>
	  <td>
	    <a href="http://www.google.co.jp/"><img src="/image/Logo_25wht.gif" alt="Google"/></a>
	  </td>
	</tr>
	<tr>
	  <td>
	    <input type="hidden" name="domains" value="chorusroom.org"/>
	    <input type="text" name="q" size="17" maxlength="255" value=""/>
	    <input type="hidden" name="sitesearch" value="chorusroom.org"/>
	    <input type="submit" name="btnG" value="サイト内を検索"/>
	  </td>
	</tr>
      </table>
    </form>
  </xsl:template>
  
  <xsl:template name="google-search-www">
    <xsl:param name="keyword"></xsl:param>
    <form method="get" action="http://www.google.co.jp/search">
      <table class="google">
	<tr>
	  <td>
	    <a href="http://www.google.co.jp/" class="google"><img src="/image/Logo_25wht.gif" alt="Google" class="google"/></a>
	  </td>
	</tr>
	<tr>
	  <td>
	    <input type="hidden" name="domains" value="chorusroom.org"/>
	    <input type="text" name="q" size="17" maxlength="255">
	      <xsl:attribute name="value">
		<xsl:value-of select="$keyword"/>
	      </xsl:attribute>
	    </input>
	    <br/>
	    <input type="radio" name="sitesearch" value=""/>
	    <xsl:text>WWW全体</xsl:text>
	    <input type="radio" name="sitesearch"
		   value="chorusroom.org" checked="checked"/>
	    <xsl:text>サイト内</xsl:text>
	    <input type="submit" name="btnG" value="検索"/>
	  </td>
	</tr>
      </table>
    </form>
  </xsl:template>

</xsl:stylesheet>
