<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
                version="1.0"
  xmlns:c="http://www.chorusroom.org/choir"
  xmlns="http://www.w3.org/1999/xhtml"
  exclude-result-prefixes="c">

  <xsl:param name="linkDbDir"/>

  <xsl:template match="c:choir-list">
    <xsl:apply-templates select="c:choirIdRef"/>
    <xsl:call-template name="choir-list">
      <xsl:with-param name="pref">北海道</xsl:with-param>
    </xsl:call-template>
    <xsl:call-template name="choir-list">
      <xsl:with-param name="pref">青森県</xsl:with-param>
    </xsl:call-template>
    <xsl:call-template name="choir-list">
      <xsl:with-param name="pref">秋田県</xsl:with-param>
    </xsl:call-template>
    <xsl:call-template name="choir-list">
      <xsl:with-param name="pref">岩手県</xsl:with-param>
    </xsl:call-template>
    <xsl:call-template name="choir-list">
      <xsl:with-param name="pref">山形県</xsl:with-param>
    </xsl:call-template>
    <xsl:call-template name="choir-list">
      <xsl:with-param name="pref">宮城県</xsl:with-param>
    </xsl:call-template>
    <xsl:call-template name="choir-list">
      <xsl:with-param name="pref">福島県</xsl:with-param>
    </xsl:call-template>
    <xsl:call-template name="choir-list">
      <xsl:with-param name="pref">茨城県</xsl:with-param>
    </xsl:call-template>
    <xsl:call-template name="choir-list">
      <xsl:with-param name="pref">栃木県</xsl:with-param>
    </xsl:call-template>
    <xsl:call-template name="choir-list">
      <xsl:with-param name="pref">群馬県</xsl:with-param>
    </xsl:call-template>
    <xsl:call-template name="choir-list">
      <xsl:with-param name="pref">千葉県</xsl:with-param>
    </xsl:call-template>
    <xsl:call-template name="choir-list">
      <xsl:with-param name="pref">東京都</xsl:with-param>
    </xsl:call-template>
    <xsl:call-template name="choir-list">
      <xsl:with-param name="pref">埼玉県</xsl:with-param>
    </xsl:call-template>
    <xsl:call-template name="choir-list">
      <xsl:with-param name="pref">神奈川県</xsl:with-param>
    </xsl:call-template>
    <xsl:call-template name="choir-list">
      <xsl:with-param name="pref">新潟県</xsl:with-param>
    </xsl:call-template>
    <xsl:call-template name="choir-list">
      <xsl:with-param name="pref">富山県</xsl:with-param>
    </xsl:call-template>
    <xsl:call-template name="choir-list">
      <xsl:with-param name="pref">石川県</xsl:with-param>
    </xsl:call-template>
    <xsl:call-template name="choir-list">
      <xsl:with-param name="pref">福井県</xsl:with-param>
    </xsl:call-template>
    <xsl:call-template name="choir-list">
      <xsl:with-param name="pref">長野県</xsl:with-param>
    </xsl:call-template>
    <xsl:call-template name="choir-list">
      <xsl:with-param name="pref">山梨県</xsl:with-param>
    </xsl:call-template>
    <xsl:call-template name="choir-list">
      <xsl:with-param name="pref">静岡県</xsl:with-param>
    </xsl:call-template>
    <xsl:call-template name="choir-list">
      <xsl:with-param name="pref">岐阜県</xsl:with-param>
    </xsl:call-template>
    <xsl:call-template name="choir-list">
      <xsl:with-param name="pref">愛知県</xsl:with-param>
    </xsl:call-template>
    <xsl:call-template name="choir-list">
      <xsl:with-param name="pref">三重県</xsl:with-param>
    </xsl:call-template>
    <xsl:call-template name="choir-list">
      <xsl:with-param name="pref">滋賀県</xsl:with-param>
    </xsl:call-template>
    <xsl:call-template name="choir-list">
      <xsl:with-param name="pref">京都府</xsl:with-param>
    </xsl:call-template>
    <xsl:call-template name="choir-list">
      <xsl:with-param name="pref">大阪府</xsl:with-param>
    </xsl:call-template>
    <xsl:call-template name="choir-list">
      <xsl:with-param name="pref">兵庫県</xsl:with-param>
    </xsl:call-template>
    <xsl:call-template name="choir-list">
      <xsl:with-param name="pref">奈良県</xsl:with-param>
    </xsl:call-template>
    <xsl:call-template name="choir-list">
      <xsl:with-param name="pref">和歌山県</xsl:with-param>
    </xsl:call-template>
    <xsl:call-template name="choir-list">
      <xsl:with-param name="pref">鳥取県</xsl:with-param>
    </xsl:call-template>
    <xsl:call-template name="choir-list">
      <xsl:with-param name="pref">島根県</xsl:with-param>
    </xsl:call-template>
    <xsl:call-template name="choir-list">
      <xsl:with-param name="pref">岡山県</xsl:with-param>
    </xsl:call-template>
    <xsl:call-template name="choir-list">
      <xsl:with-param name="pref">広島県</xsl:with-param>
    </xsl:call-template>
    <xsl:call-template name="choir-list">
      <xsl:with-param name="pref">山口県</xsl:with-param>
    </xsl:call-template>
    <xsl:call-template name="choir-list">
      <xsl:with-param name="pref">香川県</xsl:with-param>
    </xsl:call-template>
    <xsl:call-template name="choir-list">
      <xsl:with-param name="pref">徳島県</xsl:with-param>
    </xsl:call-template>
    <xsl:call-template name="choir-list">
      <xsl:with-param name="pref">愛媛県</xsl:with-param>
    </xsl:call-template>
    <xsl:call-template name="choir-list">
      <xsl:with-param name="pref">高知県</xsl:with-param>
    </xsl:call-template>
    <xsl:call-template name="choir-list">
      <xsl:with-param name="pref">福岡県</xsl:with-param>
    </xsl:call-template>
    <xsl:call-template name="choir-list">
      <xsl:with-param name="pref">佐賀県</xsl:with-param>
    </xsl:call-template>
    <xsl:call-template name="choir-list">
      <xsl:with-param name="pref">長崎県</xsl:with-param>
    </xsl:call-template>
    <xsl:call-template name="choir-list">
      <xsl:with-param name="pref">熊本県</xsl:with-param>
    </xsl:call-template>
    <xsl:call-template name="choir-list">
      <xsl:with-param name="pref">大分県</xsl:with-param>
    </xsl:call-template>
    <xsl:call-template name="choir-list">
      <xsl:with-param name="pref">宮崎県</xsl:with-param>
    </xsl:call-template>
    <xsl:call-template name="choir-list">
      <xsl:with-param name="pref">鹿児島県</xsl:with-param>
    </xsl:call-template>
    <xsl:call-template name="choir-list">
      <xsl:with-param name="pref">沖縄県</xsl:with-param>
    </xsl:call-template>
    <xsl:call-template name="choir-list">
      <xsl:with-param name="pref">海外</xsl:with-param>
    </xsl:call-template>
    <xsl:call-template name="choir-list">
      <xsl:with-param name="pref">その他</xsl:with-param>
    </xsl:call-template>
  </xsl:template>

  <xsl:template name="choir-list">
    <xsl:param name="pref">東京都</xsl:param>
    <xsl:variable name="choirs" select="c:choir[c:prefecture=$pref]"/>
    <xsl:if test="not(count($choirs)=0)">
      <h2><xsl:value-of select="$pref"/></h2>
      <ul>
        <xsl:apply-templates select="$choirs"/>
      </ul>
    </xsl:if>
  </xsl:template>

  <xsl:template match="c:choir">
    <li>
      <a>
        <xsl:attribute name="href">
          <xsl:value-of select="c:url"/>
        </xsl:attribute>
        <xsl:value-of select="c:name"/>
      </a>
      <xsl:text> [</xsl:text>
      <a>
	<xsl:attribute name="href">
	  <xsl:value-of select="
			concat('/choir/',substring(c:urn,0,3),
			'/',c:urn,'/',c:urn,'.html')"/>
	</xsl:attribute>
	<xsl:text>詳細</xsl:text>
      </a>
      <xsl:text>]</xsl:text>
      <xsl:if test="not(c:comment='')">
        <br/>
        <xsl:value-of select="c:comment"/>
      </xsl:if>
    </li>
  </xsl:template>

  <xsl:template match="c:choirIdRef">
    <xsl:variable name="url"
		  select="document(
		  concat($linkDbDir,'/',substring(@id,0,3),'/',
		  @id,'/',@id,'.xml'))"/>
    <xsl:message><xsl:value-of select="@id"/></xsl:message>
    <xsl:apply-templates select="$url"/>
  </xsl:template>

</xsl:stylesheet>
