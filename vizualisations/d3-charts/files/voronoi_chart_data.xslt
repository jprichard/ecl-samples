<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:xs="http://www.w3.org/2001/XMLSchema">
	<xsl:template name="outputJsonGoogleChartDataTable">
		<xsl:variable name="dsname" select="@name"/>
		<xsl:variable name="dataset" select="/*/Results/Result/XmlSchema[@name=$dsname]/xs:schema/xs:element[@name='Dataset']"/>
		<xsl:variable name="record" select="$dataset/xs:complexType/xs:sequence/xs:element/xs:complexType/xs:sequence"/>
		<xsl:text> {
						cols: [</xsl:text>
			<xsl:for-each select="$record/xs:element">
				<xsl:if test="position()>1">,</xsl:if><xsl:text>
							{id:'</xsl:text><xsl:value-of select="@name"/><xsl:text>', label: '</xsl:text><xsl:value-of select="@name"/><xsl:text>', type: '</xsl:text>
				<xsl:choose>
					<xsl:when test="contains(@name, 'date_')"><xsl:text>date</xsl:text></xsl:when>
					<xsl:when test="contains(@type, 'string')"><xsl:text>string</xsl:text></xsl:when>
					<xsl:otherwise><xsl:text>number</xsl:text></xsl:otherwise>
				</xsl:choose>
				<xsl:text>'}</xsl:text>
			</xsl:for-each
							<xsl:text>],
						rows: [</xsl:text>
						   <xsl:for-each select="Row">
							   <xsl:if test="position()=1">,</xsl:if>
							   <xsl:text>
							{c:[</xsl:text>
							   <xsl:for-each select="*">
									 <xsl:variable name="elname" select="local-name()"/>
									 <xsl:variable name="isString" select="contains($record/xs:element[@name=$elname]/@type, 'string')"/>
									 <xsl:variable name="isDate" select="contains($record/xs:element[@name=$elname]/@name, 'date_')"/>
									<xsl:if test="position()>1"><xsl:text>,</xsl:text></xsl:if>
                                   <xsl:choose>
                                       <xsl:when test="$isDate">
                                           <xsl:text>{v: new Date(</xsl:text><xsl:value-of select="substring(., 1, 4)"/><xsl:text>,</xsl:text><xsl:value-of select="substring(., 5, 2)"/><xsl:text>,</xsl:text><xsl:value-of select="substring(., 7, 2)"/><xsl:text>)}</xsl:text>
                                       </xsl:when>
                                       <xsl:when test="$isString">
                                           <xsl:text> {v: '</xsl:text><xsl:value-of select="."/>'<xsl:text>}</xsl:text>
                                       </xsl:when>
                                       <xsl:otherwise>
                                           <xsl:text> {v: </xsl:text><xsl:value-of select="."/><xsl:text>}</xsl:text>
                                       </xsl:otherwise>                                       
                                   </xsl:choose>
							   </xsl:for-each>
							   <xsl:text>]}</xsl:text>
						   </xsl:for-each>
						<xsl:text> 
						]
				}</xsl:text>
	</xsl:template>
</xsl:stylesheet>
