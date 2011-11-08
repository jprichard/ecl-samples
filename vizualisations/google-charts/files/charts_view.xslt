<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
	<xsl:output method="html"/>
	<xsl:include href="json_chart_data.xslt"/>
	<xsl:include href="table.xslt"/>
    <xsl:include href="piechart.xslt"/>
    <xsl:include href="linechart.xslt"/>
    <xsl:include href="barchart.xslt"/>
    <xsl:include href="geochart.xslt"/>
    <xsl:include href="geomapchart.xslt"/>
    <xsl:include href="timelinechart.xslt"/>
    <xsl:include href="motionchart.xslt"/>
    <xsl:include href="sparklinechart.xslt"/>
    <xsl:include href="scatterchart.xslt"/>
    <xsl:template match="/">
		<xsl:apply-templates select="*/Results/Result"/>
	</xsl:template>
	<xsl:template match="Result">
		<html>
			<head>
				<meta http-equiv="content-type" content="text/html; charset=utf-8"/>
				<title>ECL Workunit Web View using Google Visualization API.                 </title>
				<script type="text/javascript" src="http://www.google.com/jsapi"> </script>
				<script type="text/javascript"><xsl:text>
					google.load('visualization', '1.0', {packages: ['corechart', 'geochart', 'annotatedtimeline', 'table', 'motionchart', 'ImageSparkLine']});
				</xsl:text>
				<xsl:apply-templates select="Dataset" mode="generate_script"/>
				</script>
			</head>
			<body>
				<xsl:apply-templates select="Dataset" mode="generate_body"/>
			</body>
		</html>
	</xsl:template>
</xsl:stylesheet>
