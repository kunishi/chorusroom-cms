<?xml version="1.0" encoding="UTF-8" ?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0"
    xmlns="http://www.w3.org/1999/xhtml" xmlns:c="http://www.chorusroom.org/xml" exclude-result-prefixes="c">
    <xsl:output encoding="utf-8" method="xml" indent="yes"
        doctype-public="-//W3C//DTD XHTML Strict 1.0//EN" doctype-system="http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd"/>
    <xsl:template match="/">
        <xsl:variable name="competition-name" select="//c:competition-name"/>
        <html xml:lang="ja" lang="ja">
            <head>
                <title>
                    <xsl:value-of select="$competition-name"/>
                    <xsl:text>: 採点表</xsl:text>
                </title>
            </head>
            <body>
                <h1>
                    <xsl:value-of select="$competition-name"/>
                    <xsl:text>: 採点表</xsl:text>
                </h1>
                <xsl:apply-templates select="//c:section[c:choir/c:scores]"/>
            </body>
        </html>
    </xsl:template>
    <xsl:template match="c:section">
        <xsl:apply-templates select="c:section-name"/>
        <table class="ajclresult" border="1">
            <thead>
                <tr>
                    <th rowspan="1" colspan="1"/>
                    <xsl:apply-templates select="../c:referee"/>
                    <th rowspan="1" colspan="1">
                        <xsl:text>総合評価</xsl:text>
                    </th>
                    <th rowspan="1" colspan="1">
                        <xsl:text>備考</xsl:text>
                    </th>
                </tr>
            </thead>
            <tbody>
                <xsl:apply-templates select="c:choir">
                    <xsl:sort order="ascending" data-type="number" select="@playing-order"/>
                </xsl:apply-templates>
            </tbody>
        </table>
    </xsl:template>
    <xsl:template match="c:section-name">
        <h2>
            <xsl:apply-templates/>
        </h2>
    </xsl:template>
    <xsl:template match="c:referee">
        <th rowspan="1" colspan="1">
            <xsl:value-of select="@shortname"/>
        </th>
    </xsl:template>
    <xsl:template match="c:choir">
        <tr>
            <xsl:choose>
                <xsl:when test="c:prize[@nickname='gold']">
                    <xsl:attribute name="bgcolor">#ffff99</xsl:attribute>
                </xsl:when>
                <xsl:when test="c:prize[@nickname='silver']">
                    <xsl:attribute name="bgcolor">silver</xsl:attribute>
                </xsl:when>
                <xsl:when test="c:prize[@nickname='blonze']">
                    <xsl:attribute name="bgcolor">#ffcc99</xsl:attribute>
                </xsl:when>
            </xsl:choose>
            <td rowspan="1" colspan="1">
                <xsl:apply-templates select="@playing-order"/>
                <xsl:apply-templates select="c:choir-name"/>
            </td>
            <xsl:apply-templates select="c:scores"/>
        </tr>
    </xsl:template>
    <xsl:template match="@playing-order">
        <xsl:value-of select="."/>
        <xsl:text>. </xsl:text>
    </xsl:template>
    <xsl:template match="c:scores">
        <!-- c:result/c:section/c:choir/c:scores, c:result:c:referee -->
        <xsl:variable name="current-node" select="."/>
        <xsl:for-each select="../../../c:referee">
            <xsl:apply-templates select="$current-node/c:score[@referee=current()/@shortname]"/>
        </xsl:for-each>
        <xsl:apply-templates select="c:total-score"/>
        <xsl:apply-templates select="c:score-note"/>
    </xsl:template>
    <xsl:template match="c:score">
        <td rowspan="1" colspan="1" align="right">
            <xsl:apply-templates/>
        </td>
    </xsl:template>
    <xsl:template match="c:total-score">
        <td rowspan="1" colspan="1" align="right">
            <xsl:apply-templates/>
        </td>
    </xsl:template>
    <xsl:template match="c:score-note">
        <td rowspan="1" colspan="1">
            <xsl:for-each select="./node()[.!='']|../../c:prize[@nickname!='none']|../../c:special-prize|../../@representative[.='true']|../../@seed[.='true']">
                <xsl:apply-templates select="."/>
                <xsl:if test="not(position()=last())">
                    <xsl:text>、</xsl:text>
                </xsl:if>
            </xsl:for-each>
        </td>
    </xsl:template>
    <xsl:template match="c:prize">
        <xsl:apply-templates/>
    </xsl:template>
    <xsl:template match="c:special-prize">
        <xsl:apply-templates/>
    </xsl:template>
    <xsl:template match="@representative">
        <xsl:if test=".='true'">
            <xsl:text>代表</xsl:text>
        </xsl:if>
    </xsl:template>
    <xsl:template match="@seed">
        <xsl:if test=".='true'">
            <xsl:text>シード</xsl:text>
        </xsl:if>
    </xsl:template>
</xsl:stylesheet>
