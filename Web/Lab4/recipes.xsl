<?xml version="1.0"?>

<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

  <xsl:template match="/">

    <html>
      <head>
        <title>Lab 4</title>
        <link rel="stylesheet" href="css/bootstrap.min.css" type="text/css"/>

      </head>
      <body>
        <h2 class="text-muted text-center">Recipies</h2>
        <table class="table table-light table table-bordered table-hover table-sm">
          <thead class="thead-dark">
          <tr>
            <th scope="col">Name</th>
            <th scope="col">Preparation time</th>
            <th scope="col">Cooking time</th>
            <th scope="col">Ingredients</th>
            <th scope="col">Steps</th>
          </tr>
        </thead>
          <xsl:for-each select="recipes/recipe">
            <xsl:sort select="prep-time" order="descending"/>
            <xsl:sort select="cooking-time" order="descending"/>
            <tr class="table-danger">
              <td><xsl:value-of select="name"/></td>
              <td><xsl:value-of select="prep-time"/></td>
              <td><xsl:value-of select="cooking-time"/></td>
              <xsl:apply-templates select="ingredients"/>
              <xsl:apply-templates select="steps"/>
            </tr>
          </xsl:for-each>
        </table>
      </body>
    </html>
  </xsl:template>

    <xsl:template match="ingredients">
    <td>
      <xsl:for-each select="ingredient">
        <xsl:value-of select="."/>
        <br/>
      </xsl:for-each>
    </td>
    </xsl:template>

    <xsl:template match="steps">
    <td>
      <xsl:for-each select="step">
        <xsl:value-of select="."/>
        <br/>
      </xsl:for-each>
    </td>
    </xsl:template>


</xsl:stylesheet>
