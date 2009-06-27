<?xml version="1.0"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

  <xsl:strip-space elements="*" />

  <xsl:template match="recipes">
    <xml>
      <titles><xsl:call-template name="titles" /></titles>
      <instructions><xsl:call-template name="instructions" /></instructions>
      <dependencies><xsl:call-template name="dependencies" /></dependencies>
    </xml>
  </xsl:template>

  <xsl:template name="titles">
    <xsl:for-each select="//title">
      <xsl:element name="title">
        <xsl:attribute name="ingredientid"><xsl:value-of select="generate-id(../..)" /></xsl:attribute>
        <xsl:attribute name="languageid"><xsl:value-of select="../@languageid" /></xsl:attribute>
        <xsl:value-of select="text()" />
      </xsl:element>
    </xsl:for-each>
  </xsl:template>

  <xsl:template name="instructions">
    <xsl:for-each select="//instructions">
      <xsl:element name="instructions">
        <xsl:attribute name="ingredientid"><xsl:value-of select="generate-id(../..)" /></xsl:attribute>
        <xsl:attribute name="languageid"><xsl:value-of select="../@languageid" /></xsl:attribute>
        <xsl:value-of select="text()" />
      </xsl:element>
    </xsl:for-each>
  </xsl:template>

  <xsl:template name="dependencies">
    <xsl:for-each select="//recipe">
      <xsl:element name="dependency">
        <xsl:attribute name="ingredientid"><xsl:value-of select="generate-id()" /></xsl:attribute>
      </xsl:element>
    </xsl:for-each>
    <xsl:for-each select="//ingredient|//product">
      <xsl:element name="dependency">
        <xsl:attribute name="ingredientid"><xsl:value-of select="generate-id()" /></xsl:attribute>
        <xsl:attribute name="parentid"><xsl:value-of select="generate-id(../..)" /></xsl:attribute>
      </xsl:element>
    </xsl:for-each>
  </xsl:template>

</xsl:stylesheet>
