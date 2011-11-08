<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
	<xsl:template match="Dataset[starts-with(@name,'Sparkline')]" mode="generate_body">
		<h1><xsl:value-of select="translate(substring-after(@name, 'Sparkline_'),'_',' ')"/></h1>
		<div style="height: 50px; width: 100px;">
			<xsl:attribute name="id"><xsl:value-of select="@name"/></xsl:attribute>
		</div>
	</xsl:template>
	<xsl:template match="Dataset[starts-with(@name,'Sparkline_')]" mode="generate_script">
			<xsl:text>
			google.setOnLoadCallback(draw</xsl:text><xsl:value-of select="@name"/><xsl:text>);
			function draw</xsl:text><xsl:value-of select="@name"/><xsl:text>() {
				var data = new google.visualization.DataTable(</xsl:text>
				<xsl:call-template name="outputJsonGoogleChartDataTable"/>
				<xsl:text>,
						0.6
					);

                  var options = { width: 100, height: 50};
                 
                  //options['title'] = '</xsl:text><xsl:value-of select="translate(substring-after(@name, 'Sparkline_'), '_', ' ')"/><xsl:text>';
				var chart = new google.visualization.ImageSparkLine(document.getElementById('</xsl:text><xsl:value-of select="@name"/><xsl:text>'));
				chart.draw(data, options);
			}
		  </xsl:text>
	</xsl:template>
</xsl:stylesheet>
