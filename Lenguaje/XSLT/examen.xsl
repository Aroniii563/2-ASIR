<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

    <xsl:output method="html"/>

    <xsl:template match="/">
    <html>
        <body>

<h1 > ACADEMIA DE BAILES </h1>

<h2>Listado de bailes: <xsl:value-of select="count(//nombre)"/></h2>

<table border="1px">

<tr style="background-color: green; color: white">
        <td ></td>
        <td>Nombre</td>

<td >Comienzo</td>

<td> Fin</td>

<td >Plazas</td>

<td >Profesores</td>

</tr>

<xsl:for-each select="/bailes/baile">

<xsl:sort select="nombre" order="ascending"/>

<tr>

<td style="background-color: green; color:white"><xsl:number value="position()" format="a)"/></td>

<td><xsl:value-of select="nombre"/></td>

<td><xsl:value-of select="comienzo"/></td>


<td><xsl:value-of select="fin"/></td>




<xsl:if test="plazas&lt;11">


<td style="background-color:red" >


<xsl:value-of select="plazas"/>


</td>

</xsl:if>






<xsl:if test="plazas&gt;10">


<td style="background-color:blue" >


<xsl:value-of select="plazas"/>


</td>

</xsl:if>


        <td>



<xsl:for-each select="profesor">
        <xsl:number format="1)"/>
        <xsl:value-of select="."/>
        <br>
        </br>





</xsl:for-each>



</td>

</tr>

</xsl:for-each>

</table>

<h2>Lista de precios y Periodos</h2>

<xsl:for-each select="/bailes/baile">
        <ul>
        <li>
        <xsl:value-of select="nombre"/>
        <span style="padding-left:5px"><xsl:value-of select="precio"/></span>
        <span style="padding-left:5px"><xsl:value-of select="precio/@moneda"/></span>
        <span style="padding-left:5px"><xsl:value-of select="precio/@cuota"/></span>
        </li>
        </ul>
        </xsl:for-each>
        </body>
    </html>
    </xsl:template>

</xsl:stylesheet>
