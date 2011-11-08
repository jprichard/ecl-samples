<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
	<xsl:template match="Dataset[starts-with(@name,'BarChart')]" mode="generate_body">
		<h1><xsl:value-of select="translate(substring-after(@name, 'BarChart_'),'_',' ')"/></h1>
		<div style="height: 400px; width: 600px;">
			<xsl:attribute name="id"><xsl:value-of select="@name"/></xsl:attribute>
		</div>
	</xsl:template>
	<xsl:template match="Dataset[starts-with(@name,'BarChart')]" mode="generate_script">
			<xsl:text>
			google.setOnLoadCallback(draw</xsl:text><xsl:value-of select="@name"/><xsl:text>);
			function draw</xsl:text><xsl:value-of select="@name"/><xsl:text>() {
				var data = new google.visualization.DataTable(</xsl:text>
				<xsl:call-template name="outputJsonGoogleChartDataTable"/>
				<xsl:text>,
						0.6
					);
				var options = {is3D: true};
				var barchart = new google.visualization.BarChart(document.getElementById('</xsl:text><xsl:value-of select="@name"/><xsl:text>'));
				barchart.draw(data, options);
			}
		  </xsl:text>
	</xsl:template>
</xsl:stylesheet>