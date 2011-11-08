<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
	<xsl:template match="Dataset[starts-with(@name,'GeomapChart')]" mode="generate_body">
		<h1><xsl:value-of select="translate(substring-after(@name, 'GeomapChart_'),'_',' ')"/></h1>
		<div style="height: 400px; width: 600px;">
			<xsl:attribute name="id"><xsl:value-of select="@name"/></xsl:attribute>
		</div>
	</xsl:template>
	<xsl:template match="Dataset[starts-with(@name,'GeomapChart')]" mode="generate_script">
			<xsl:text>
			google.setOnLoadCallback(draw</xsl:text><xsl:value-of select="@name"/><xsl:text>);
			function draw</xsl:text><xsl:value-of select="@name"/><xsl:text>() {
				var data = new google.visualization.DataTable(</xsl:text>
				<xsl:call-template name="outputJsonGoogleChartDataTable"/>
				<xsl:text>,
						0.6
					);

                  var options = {};
                  options['region'] = 'US';
                  options['colors'] = [0xE0FFD4, 0xA5EF63, 0x50AA00, 0x267114]; 
                  options['width'] = 800;
                  options['height'] = 500;
                  options['title'] = '</xsl:text><xsl:value-of select="translate(substring-after(@name, 'GeomapChart_'), '_', ' ')"/><xsl:text>';

				var geomap = new google.visualization.GeoMap(document.getElementById('</xsl:text><xsl:value-of select="@name"/><xsl:text>'));
				geomap.draw(data, options);
			}
		  </xsl:text>
	</xsl:template>
</xsl:stylesheet>
