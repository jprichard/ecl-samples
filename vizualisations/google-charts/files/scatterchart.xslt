<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
	<xsl:template match="Dataset[starts-with(@name,'ScatterChart')]" mode="generate_body">
		<h1><xsl:value-of select="translate(substring-after(@name, 'ScatterChart_'),'_',' ')"/></h1>
		<div style="height: 400px; width: 600px;">
			<xsl:attribute name="id"><xsl:value-of select="@name"/></xsl:attribute>
		</div>
	</xsl:template>
	<xsl:template match="Dataset[starts-with(@name,'ScatterChart')]" mode="generate_script">
			<xsl:text>
			google.setOnLoadCallback(draw</xsl:text><xsl:value-of select="@name"/><xsl:text>);
			function draw</xsl:text><xsl:value-of select="@name"/><xsl:text>() {
				var data = new google.visualization.DataTable(</xsl:text>
				<xsl:call-template name="outputJsonGoogleChartDataTable"/>
				<xsl:text>,
						0.6
					);
				var options = {title: '</xsl:text><xsl:value-of select="translate(substring-after(@name, 'ScatterChart_'), '_', ' ')"/><xsl:text>'};
				var scatterchart = new google.visualization.ScatterChart(document.getElementById('</xsl:text><xsl:value-of select="@name"/><xsl:text>'));
                google.visualization.events.addListener(scatterchart, 'select', select</xsl:text><xsl:value-of select="@name"/><xsl:text>Handler);    
				scatterchart.draw(data, options);
			}

            function select</xsl:text><xsl:value-of select="@name"/><xsl:text>Handler() {
               debugger;
               var selectedItem = chart.getSelection()[0];
               var value = data.getValue(selectedItem.row, 0);
               alert('The user selected ' + value);
            }

		  </xsl:text>
	</xsl:template>
</xsl:stylesheet>