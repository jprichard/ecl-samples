<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
	<xsl:output method="html"/>
    <xsl:include href="json_chart_data.xslt"/>
    <xsl:include href="table.xslt"/>
    <xsl:include href="stream.xslt"/>
    <xsl:include href="voronoi.xslt"/>
    <xsl:template match="/">
		<xsl:apply-templates select="*/Results/Result"/>
	</xsl:template>
	<xsl:template match="Result">
		<html>
            <head>
                <meta http-equiv="content-type" content="text/html;charset=utf-8" />
                    <title>d3 ECL Workunit Visualisation.</title>
                    <script type="text/javascript" src="http://mbostock.github.com/d3/d3.js?2.4.6"></script>
                    <style type="text/css">
                    </style>
                    <script type="text/javascript">
                        <xsl:text>
                            @import url("http://mbostock.github.com/d3/style.css?1.10.0");
                            @import url("http://mbostock.github.com/d3/syntax.css?1.6.0");
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
