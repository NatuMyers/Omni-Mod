<?xml version="1.0"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

	<xsl:template match="//icon">
		<xsl:choose>
		<xsl:when test="string-length(@type)=0">TEXT</xsl:when>
		<xsl:otherwise>
		<xsl:value-of select="@type"/>
		</xsl:otherwise>
		</xsl:choose>
		<xsl:choose>
		<xsl:when test="string-length(.)=0">Clear</xsl:when>
		<xsl:otherwise>
		<xsl:value-of select="."/>
		</xsl:otherwise>
		</xsl:choose>
	</xsl:template>

	<xsl:template match="//die">
		<xsl:choose>
		<xsl:when test="string-length(@rate)=0">0</xsl:when>
		<xsl:otherwise>
		<xsl:value-of select="@rate"/>
		</xsl:otherwise>
		</xsl:choose>
		<xsl:choose>
		<xsl:when test="string-length(.)=0">Clear</xsl:when>
		<xsl:otherwise>
		<xsl:value-of select="."/>
		</xsl:otherwise>
		</xsl:choose>
	</xsl:template>

	<xsl:template match="//interaction">
		<xsl:text>
INTERACTION </xsl:text>
		<xsl:value-of select="../@name"/>
		<xsl:text> </xsl:text>
		<xsl:choose>
		<xsl:when test="string-length(@partner)=0">Clear</xsl:when>
		<xsl:otherwise>
		<xsl:value-of select="@partner"/>
		</xsl:otherwise>
		</xsl:choose>
		<xsl:text> </xsl:text>
		<xsl:choose>
		<xsl:when test="string-length(this)=0">Clear</xsl:when>
		<xsl:otherwise>
		<xsl:value-of select="this"/>
		</xsl:otherwise>
		</xsl:choose>
		<xsl:text> </xsl:text>
		<xsl:choose>
		<xsl:when test="string-length(other)=0">Clear</xsl:when>
		<xsl:otherwise>
		<xsl:value-of select="other"/>
		</xsl:otherwise>
		</xsl:choose>
		<xsl:text> </xsl:text>
		<xsl:choose>
		<xsl:when test="string-length(@rate)=0">0</xsl:when>
		<xsl:otherwise>
		<xsl:value-of select="@rate"/>
		</xsl:otherwise>
		</xsl:choose>
		<xsl:choose>
		<xsl:when test="string-length(@except)>0">
			<xsl:text> </xsl:text>
			<xsl:value-of select="@except"/>
		</xsl:when>
		</xsl:choose>
	</xsl:template>

	<xsl:template match="//element">
<xsl:text>
ELEMENT </xsl:text>
		<xsl:choose>
		<xsl:when test="string-length(@group)=0">None</xsl:when>
		<xsl:otherwise>
		<xsl:value-of select="@group"/>
		</xsl:otherwise>
		</xsl:choose>
		<xsl:text> </xsl:text>
		<xsl:choose>
		<xsl:when test="string-length(@name)=0">Clear</xsl:when>
		<xsl:otherwise>
		<xsl:value-of select="@name"/>
		</xsl:otherwise>
		</xsl:choose>
		<xsl:text> </xsl:text>
		<xsl:choose>
		<xsl:when test="string-length(@color)>0"><xsl:value-of select="@color"/><xsl:text> </xsl:text></xsl:when>
		</xsl:choose>
		<xsl:choose>
		<xsl:when test="string-length(@red)>0"><xsl:value-of select="@red"/><xsl:text> </xsl:text></xsl:when>
		</xsl:choose>
		<xsl:choose>
		<xsl:when test="string-length(@color)+string-length(@red)=0">0 </xsl:when>
		</xsl:choose>
		<xsl:choose>
		<xsl:when test="string-length(@green)>0"><xsl:value-of select="@green"/><xsl:text> </xsl:text></xsl:when>
		</xsl:choose>
		<xsl:choose>
		<xsl:when test="string-length(@color)+string-length(@green)=0">0 </xsl:when>
		</xsl:choose>
		<xsl:choose>
		<xsl:when test="string-length(@blue)>0"><xsl:value-of select="@blue"/><xsl:text> </xsl:text></xsl:when>
		</xsl:choose>
		<xsl:choose>
		<xsl:when test="string-length(@color)+string-length(@blue)=0">0 </xsl:when>
		</xsl:choose>
		<xsl:choose>
		<xsl:when test="string-length(@weight)=0">0</xsl:when>
		<xsl:otherwise>
		<xsl:value-of select="@weight"/>
		</xsl:otherwise>
		</xsl:choose>
		<xsl:text> </xsl:text>
		<xsl:choose>
		<xsl:when test="string-length(@spray)=0">1</xsl:when>
		<xsl:otherwise>
		<xsl:value-of select="@spray"/>
		</xsl:otherwise>
		</xsl:choose>
		<xsl:text> </xsl:text>
		<xsl:choose>
		<xsl:when test="string-length(@slide)=0">1</xsl:when>
		<xsl:otherwise>
		<xsl:value-of select="@slide"/>
		</xsl:otherwise>
		</xsl:choose>
		<xsl:text> </xsl:text>
		<xsl:choose>
		<xsl:when test="string-length(@viscousity)=0">1</xsl:when>
		<xsl:otherwise>
		<xsl:value-of select="@viscousity"/>
		</xsl:otherwise>
		</xsl:choose>
		<xsl:text> </xsl:text>
		<xsl:choose>
		<xsl:when test="string-length(die)=0">0 Clear</xsl:when>
		<xsl:otherwise>
		<xsl:apply-templates select="die"/>
		</xsl:otherwise>
		</xsl:choose>
		<xsl:text> </xsl:text>
		<xsl:choose>
		<xsl:when test="string-length(@menuorder)=0">0</xsl:when>
		<xsl:otherwise>
		<xsl:value-of select="@menuorder"/>
		</xsl:otherwise>
		</xsl:choose>
		<xsl:text> </xsl:text>
		<xsl:choose>
		<xsl:when test="string-length(icon)=0">TEXT Clear</xsl:when>
		<xsl:otherwise>
		<xsl:apply-templates select="icon"/>
		</xsl:otherwise>
		</xsl:choose>
		<xsl:apply-templates select="interaction"/>
	</xsl:template>

	<xsl:template match="//group">
<xsl:text>
GROUP </xsl:text>
		<xsl:choose>
		<xsl:when test="string-length(@name)=0">Clear</xsl:when>
		<xsl:otherwise>
		<xsl:value-of select="@name"/>
		</xsl:otherwise>
		</xsl:choose>
		<xsl:text> </xsl:text>
		<xsl:choose>
		<xsl:when test="string-length(@menuorder)=0">0</xsl:when>
		<xsl:otherwise>
		<xsl:value-of select="@menuorder"/>
		</xsl:otherwise>
		</xsl:choose>
		<xsl:text> </xsl:text>
		<xsl:choose>
		<xsl:when test="string-length(icon)=0">TEXT Clear</xsl:when>
		<xsl:otherwise>
		<xsl:apply-templates select="icon"/>
		</xsl:otherwise>
		</xsl:choose>
	</xsl:template>
	
	<xsl:template match="//trigger">
TRIGGER <xsl:value-of select="@name"/><xsl:text> {</xsl:text>
		<xsl:apply-templates select="element"/>
	<xsl:text>
}</xsl:text>
	</xsl:template>

	<xsl:template match="//raw">
<![CDATA[
]]><xsl:value-of select="."/>
	</xsl:template>

	<xsl:template match="//draw">
DRAW <xsl:choose>
		<xsl:when test="string-length(../@elementid)>0">
		<xsl:value-of select="@elementid"/>
		</xsl:when>
		</xsl:choose>
		<xsl:choose>
		<xsl:when test="string-length(@element)>0">ELEMENT:<xsl:value-of select="@element"/></xsl:when>
		</xsl:choose>
		<xsl:choose>
		<xsl:when test="string-length(@elementid)+string-length(@element)=0">0</xsl:when>
		</xsl:choose>		
		<xsl:apply-templates/>
	</xsl:template>

	<xsl:template match="//circle">
		<xsl:text> CIRCLE </xsl:text>
		<xsl:choose>
		<xsl:when test="string-length(@x)=0">0</xsl:when>
		<xsl:otherwise>
		<xsl:value-of select="@x"/>
		</xsl:otherwise>
		</xsl:choose>
		<xsl:text> </xsl:text>
		<xsl:choose>
		<xsl:when test="string-length(@y)=0">0</xsl:when>
		<xsl:otherwise>
		<xsl:value-of select="@x"/>
		</xsl:otherwise>
		</xsl:choose>
		<xsl:text> </xsl:text>
		<xsl:choose>
		<xsl:when test="string-length(@r)=0">0</xsl:when>
		<xsl:otherwise>
		<xsl:value-of select="@r"/>
		</xsl:otherwise>
		</xsl:choose>
	</xsl:template>

	<xsl:template match="//filledcircle">
		<xsl:text> FILLEDCIRCLE </xsl:text>
		<xsl:choose>
		<xsl:when test="string-length(@x)=0">0</xsl:when>
		<xsl:otherwise>
		<xsl:value-of select="@x"/>
		</xsl:otherwise>
		</xsl:choose>
		<xsl:text> </xsl:text>
		<xsl:choose>
		<xsl:when test="string-length(@y)=0">0</xsl:when>
		<xsl:otherwise>
		<xsl:value-of select="@x"/>
		</xsl:otherwise>
		</xsl:choose>
		<xsl:text> </xsl:text>
		<xsl:choose>
		<xsl:when test="string-length(@r)=0">0</xsl:when>
		<xsl:otherwise>
		<xsl:value-of select="@r"/>
		</xsl:otherwise>
		</xsl:choose>
	</xsl:template>

	<xsl:template match="//point">
		<xsl:text> POINT </xsl:text>
		<xsl:choose>
		<xsl:when test="string-length(@x)=0">0</xsl:when>
		<xsl:otherwise>
		<xsl:value-of select="@x"/>
		</xsl:otherwise>
		</xsl:choose>
		<xsl:text> </xsl:text>
		<xsl:choose>
		<xsl:when test="string-length(@y)=0">0</xsl:when>
		<xsl:otherwise>
		<xsl:value-of select="@x"/>
		</xsl:otherwise>
		</xsl:choose>
	</xsl:template>

</xsl:stylesheet>
