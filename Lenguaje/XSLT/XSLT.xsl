<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

	<xsl:output method="html"/>
	
	<xsl:template match="/">
	<html>
		<body>
		
	<h1>Hay <xsl:value-of select="count(//baile)"/> bailes</h1>
		
	<img width="40px">
		
		<xsl:attribute name="src">
		
			<xsl:value-of select="//logo"/>
		
		</xsl:attribute>
		
	</img>
		
	<table>
		
		<tr>
		
		<xsl:if test="position() mod 2 = 1">
		
			<xsl:attribute name="bgcolor">blue</xsl:attribute>
		
		</xsl:if>
		
		<xsl:if test="position() mod 2 = 0">
		
			<xsl:attribute name="bgcolor">green</xsl:attribute>
		
		</xsl:if>
		
			<th>Codigo</th>
		
			<th>Nombre</th>
		
			<th>Plazas</th>
		
			<th>Profesor</th>
		
			<th>Rentabilidad</th>
		
		</tr>
		
		<xsl:for-each select="//baile">
		
		<xsl:sort select="precio" data-type="text" order="ascending"/>
		
			<tr>
		
				<xsl:if test="precio &gt; 50">
		
					<xsl:attribute name="bgcolor">purple</xsl:attribute>
		
				</xsl:if>
		
				<xsl:if test="precio &lt; 50">
		
					<xsl:attribute name="bgcolor">rose</xsl:attribute>
		
				</xsl:if>
		
				<td>
		
					<xsl:value-of select="@id"/>
		
				</td>
		
				<td>
		
					<xsl:value-of select="nombre"/>
		
				</td>
		
				<td>
		
					<xsl:value-of select="plazas"/>
		
				</td>
		
				<td>
		
					<xsl:value-of select="profesor"/>
		
				</td>
		
				<td>
		
					<xsl:choose>
		
						<xsl:when test="precio &gt; 50">No rentable</xsl:when>
		
						<xsl:when test="precio &lt; 50">Rentable</xsl:when>
		
					</xsl:choose>
		
				</td>
		
			</tr>
		
		</xsl:for-each>
		
	</table>
		</body>
	</html>
	</xsl:template>

</xsl:stylesheet>
