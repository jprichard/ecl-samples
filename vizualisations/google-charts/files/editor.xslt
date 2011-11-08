<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
	<xsl:template match="Dataset" mode="generate_body">
		<h1><xsl:value-of select="translate(@name, '_',' ')"/></h1>
		<div style="height: 400px; width: 600px;">
			<xsl:attribute name="id"><xsl:value-of select="@name"/></xsl:attribute>
		</div>
	</xsl:template>
	<xsl:template match="Dataset" mode="generate_script">
			<xsl:text>
			google.setOnLoadCallback(load</xsl:text><xsl:value-of select="@name"/><xsl:text>);
			var chartEditor = null;
			function load</xsl:text><xsl:value-of select="@name"/><xsl:text>() {
				var data = new google.visualization.DataTable(</xsl:text>
				<xsl:call-template name="outputJsonGoogleChartDataTable"/>
				<xsl:text>,
						0.6
					);
				var options = {};
			// Create the chart to edit.
			var wrapper = new google.visualization.ChartWrapper({
			   'chartType':'PieChart',
			   'options': {}
			   });
				wrapper.setDataTable(data);
				chartEditor = new google.visualization.ChartEditor();
				google.visualization.events.addListener(chartEditor, 'ok', redraw</xsl:text><xsl:value-of select="@name"/><xsl:text>);
				chartEditor.openDialog(wrapper, {});
			}
			function redraw</xsl:text><xsl:value-of select="@name"/><xsl:text>(){
				chartEditor.getChartWrapper().draw(document.getElementById('</xsl:text><xsl:value-of select="@name"/><xsl:text>'));
			 }
		  </xsl:text>
	</xsl:template>
</xsl:stylesheet>
