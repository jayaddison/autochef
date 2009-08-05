<?xml version="1.0"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

  <xsl:strip-space elements="*" />

  <xsl:template match="recipes">
    <xml>
      <ingredients><xsl:call-template name="ingredients" /></ingredients>
      <translations><xsl:call-template name="translations" /></translations>
      <dependencies><xsl:call-template name="dependencies" /></dependencies>
    </xml>
  </xsl:template>

  <xsl:template name="ingredients">
    <xsl:for-each select="//recipe|//ingredient|//product">
      <xsl:element name="ingredient">
        <xsl:attribute name="ingredientid"><xsl:value-of select="generate-id()" /></xsl:attribute>
        <xsl:attribute name="duration"><xsl:value-of select="@duration" /></xsl:attribute>
      </xsl:element>
    </xsl:for-each>
  </xsl:template>

  <xsl:template name="translations">
    <xsl:for-each select="//locale">
      <xsl:element name="translation">
        <xsl:attribute name="ingredientid"><xsl:value-of select="generate-id(..)" /></xsl:attribute>
        <xsl:attribute name="languageid"><xsl:value-of select="@languageid" /></xsl:attribute>
        <xsl:element name="name"><xsl:value-of select="name/text()" /></xsl:element>
        <xsl:element name="instructions"><xsl:value-of select="instructions/text()" /></xsl:element>
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
        <xsl:attribute name="parentid"><xsl:value-of select="generate-id(../..)" /></xsl:attribute>
        <xsl:attribute name="ingredientid"><xsl:value-of select="generate-id()" /></xsl:attribute>
      </xsl:element>
    </xsl:for-each>
  </xsl:template>

</xsl:stylesheet>
