<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
		version="1.0"
		xmlns:p="http://www.chorusroom.org/piece"
		xmlns:c="http://www.chorusroom.org/xml"
		xmlns:h="http://www.w3.org/TR/xhtml1/strict"
		exclude-result-prefixes="h c p">
  <xsl:output method="html" encoding="utf-8" omit-xml-declaration="yes"
	      indent="yes"/>
  <xsl:template match="/">
    <xsl:apply-templates select="c:result"/>
  </xsl:template>
  <xsl:template match="c:result">
    <h1><xsl:value-of select="c:competitionName"/></h1>
    <dl>
      <dt>開催日</dt>
      <dd>
	<xsl:choose>
	  <xsl:when test="c:date">
	    <xsl:value-of select="c:date"/>
	    <xsl:if test="c:date/@dayOfWeek">
	      <xsl:text>(</xsl:text>
	      <xsl:value-of select="c:date/@dayOfWeek"/>
	      <xsl:text>)</xsl:text>
	    </xsl:if>
	  </xsl:when>
	  <xsl:otherwise>
	    <xsl:text>登録データなし</xsl:text>
	  </xsl:otherwise>
	</xsl:choose>
      </dd>
      <dt>開催場所</dt>
      <dd>
	<xsl:choose>
	  <xsl:when test="c:hall">
	    <xsl:value-of select="c:hall"/>
	  </xsl:when>
	  <xsl:otherwise>
	    <xsl:text>登録データなし</xsl:text>
	  </xsl:otherwise>
	</xsl:choose>
      </dd>
      <dt>審査員</dt>
      <xsl:choose>
	<xsl:when test="c:referee">
	  <xsl:for-each select="c:referee">
	    <dd>
	      <xsl:value-of select="."/>
	      <xsl:if test="@job">
		<xsl:text> (</xsl:text>
		<xsl:value-of select="@job"/>
		<xsl:text>)</xsl:text>
	      </xsl:if>
	    </dd>
	  </xsl:for-each>
	</xsl:when>
	<xsl:otherwise>
	  <dd>
	    <xsl:text>登録データなし</xsl:text>
	  </dd>
	</xsl:otherwise>
      </xsl:choose>
    </dl>
    <xsl:apply-templates select="c:notice"/>
    <xsl:apply-templates select="c:section"/>
  </xsl:template>
  <xsl:template match="c:notice">
    <xsl:apply-templates select="*"/>
  </xsl:template>
  <xsl:template match="c:section">
    <h2><xsl:value-of select="c:sectionName"/></h2>
    <xsl:apply-templates select="c:choir"/>
  </xsl:template>
  <xsl:template match="c:choir">
    <div class="choir">
      <xsl:if test="c:playingOrder">
	<xsl:number value="c:playingOrder" format="1. "/>
      </xsl:if>
      <span class="choir-name"><xsl:value-of select="c:name"/></span>
      <xsl:if test="c:type|c:number|c:prefecture|c:players">
	<xsl:text>(</xsl:text>
	<xsl:for-each select="c:type|c:number|c:prefecture|c:players">
	  <xsl:apply-templates select="."/>
	  <xsl:if test="position()!=last()">
	    <xsl:text>, </xsl:text>
	  </xsl:if>
	</xsl:for-each>
	<xsl:text>)</xsl:text>
      </xsl:if>
      <xsl:if test="c:prize[.!='']|c:special-prize">
	<div class="prize">
	  <xsl:for-each select="c:prize[.!='']|c:special-prize">
	    <xsl:value-of select="."/>
	    <xsl:if test="position()!=last()">
	      <xsl:text>, </xsl:text>
	    </xsl:if>
	  </xsl:for-each>
	</div>
      </xsl:if>
      <xsl:if test="c:note">
	<div class="note">
	  <xsl:apply-templates select="c:note/node()"/>
	</div>
      </xsl:if>
      <xsl:if test="c:assignedNumber|c:freeNumber">
	<ul>
	  <xsl:for-each select="c:assignedNumber|c:freeNumber">
	    <li>
	      <xsl:apply-templates select="."/>
	    </li>
	  </xsl:for-each>
	</ul>
      </xsl:if>
    </div>
  </xsl:template>
  <xsl:template match="c:type|c:prefecture">
    <xsl:value-of select="."/>
  </xsl:template>
  <xsl:template match="c:number">
    <xsl:number value="." format="1"/>
    <xsl:text>名</xsl:text>
  </xsl:template>
  <xsl:template match="c:players">
    <xsl:choose>
      <xsl:when test="@list">
	<xsl:apply-templates select="c:conductor" mode="list"/>
	<xsl:if test="c:piano|c:accompaniment">
	  <xsl:text>, </xsl:text>
	</xsl:if>
	<xsl:apply-templates select="c:piano" mode="list"/>
	<xsl:if test="c:accompaniment">
	  <xsl:text>, </xsl:text>
	</xsl:if>
	<xsl:apply-templates select="c:accompaniment" mode="list"/>
      </xsl:when>
      <xsl:otherwise>
	<xsl:apply-templates select="node()"/>
      </xsl:otherwise>
    </xsl:choose>
  </xsl:template>
  <xsl:template match="c:conductor|c:piano|c:accompaniment">
    <xsl:value-of select="."/>
    <xsl:if test="@note">
      <xsl:text> (</xsl:text>
      <xsl:value-of select="@note"/>
      <xsl:text>)</xsl:text>
    </xsl:if>
  </xsl:template>
  <xsl:template match="c:conductor" mode="list">
    <xsl:if test="position()=1">
      <xsl:text>指揮: </xsl:text>
    </xsl:if>
    <xsl:value-of select="."/>
    <xsl:if test="@note">
      <xsl:text> (</xsl:text>
      <xsl:value-of select="@note"/>
      <xsl:text>)</xsl:text>
    </xsl:if>
    <xsl:if test="position()!=last()">
      <xsl:text>・</xsl:text>
    </xsl:if>
  </xsl:template>
  <xsl:template match="c:piano" mode="list">
    <xsl:if test="position()=1">
      <xsl:text>ピアノ: </xsl:text>
    </xsl:if>
    <xsl:value-of select="."/>
    <xsl:if test="@note">
      <xsl:text> (</xsl:text>
      <xsl:value-of select="@note"/>
      <xsl:text>)</xsl:text>
    </xsl:if>
    <xsl:if test="position()!=last()">
      <xsl:text>・</xsl:text>
    </xsl:if>
  </xsl:template>
  <xsl:template match="c:accompaniment">
    <xsl:value-of select="@kind"/>
    <xsl:text>: </xsl:text>
    <xsl:value-of select="."/>
    <xsl:if test="@note">
      <xsl:text> (</xsl:text>
      <xsl:value-of select="@note"/>
      <xsl:text>)</xsl:text>
    </xsl:if>
    <xsl:if test="position()!=last()">
      <xsl:text>・</xsl:text>
    </xsl:if>
  </xsl:template>
  <xsl:template match="c:assignedNumber">
    <xsl:text>[課題曲] </xsl:text>
    <xsl:value-of select="node()"/>
  </xsl:template>
  <xsl:template match="c:freeNumber">
    <xsl:apply-templates select="node()"/>
  </xsl:template>
  <!-- piece -->
  <xsl:template match="p:arrangedBy|p:composedBy|p:originatedFrom|p:translatedBy|p:wordsBy">
    <xsl:value-of select="node()"/>
  </xsl:template>
  <xsl:template match="p:suiteTitle|p:title">
    <xsl:text>「</xsl:text>
    <xsl:value-of select="node()"/>
    <xsl:text>」</xsl:text>
  </xsl:template>
  <!-- XHTML elements -->
  <xsl:template match="h:*">
    <xsl:copy/>
  </xsl:template>
</xsl:stylesheet>
