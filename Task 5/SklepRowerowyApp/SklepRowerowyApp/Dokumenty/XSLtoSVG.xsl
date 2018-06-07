<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" 
    xmlns:svg="http://www.w3.org/2000/svg" xmlns="http://www.w3.org/2000/svg" version="2.0"
    xmlns:xlink="http://www.w3.org/1999/xlink">
    
    <xsl:output method="xml" media-type="image/svg" encoding="utf-8"  doctype-public="-//W3C//DTD SVG 1.1//EN"
        doctype-system="http://www.w3.org/TR/2001/REC-SVG-20010904/DTD/svg10.dtd"/>
    
	<xsl:template match="/">
		<svg:svg width="800" height="600">
			<svg:desc>Sklep rowerowy</svg:desc>
            <svg:title>Tytuł</svg:title>
            <defs>
                <linearGradient id="grad1">
                    <stop offset="0%" style="stop-color:rgb(128,128,128);" />
                    <stop offset="40%" style="stop-color:rgb(143,188,143);" />                    
                    <stop offset="100%" style="stop-color:rgb(192,192,192);" />                    
                </linearGradient>
            </defs>

            <svg:rect x="3" y="3" width="794" height="594" fill="url(#grad1)" stroke="black" stroke-width="3"/> 
            
			<svg:text x="50%" y="30" font-size="18" fill="black" font-weight="bold" text-anchor="middle">
                Sklep rowerowy
            </svg:text>
            
			
            
            <script type="text/ecmascript"> 
                <![CDATA[
                    function onMouseOverEvent(evt) {
                        var autorzy = document.getElementById("autorID");
                        autorzy.setAttribute("visibility", "visible");
                    }]]>
            </script>

            <script type="text/ecmascript">
                <![CDATA[
                    function onMouseOutEvent(evt) {
                        var autorzy = document.getElementById("autorID");
                        autorzy.setAttribute("visibility", "hidden");
                        
                    }]]>
            </script>
            
            <xsl:apply-templates />
            <xsl:call-template name="Raport"/>
		</svg:svg>
	</xsl:template>
    
		<xsl:template match="autorzy">

		<a xlink:href="testStrona.xhtml" target="_blank">
                <svg:g class="btn" cursor="pointer">
                    <svg:rect x="18" y="18" width="73" height="20" fill="rgb(112,128,144)" stroke="black"/>
                    <svg:text x="25" y="33" fill="white" font-size="16">XHTML</svg:text>
                </svg:g>
            </a>
		
		<svg:g id="authors" width="100" height="20" onmouseover="onMouseOverEvent(evt)" onmouseout="onMouseOutEvent(evt)">
            <svg:rect x="18" y="59" width="73" height="20" fill="rgb(112,128,144)" stroke="black"/>
            <svg:text x="25" y="74" fill="white" font-size="16" >Autorzy:</svg:text>
        </svg:g>
      
			<svg:rect x="18" y="100" width="73" height="20" fill="rgb(112,128,144)" stroke="black"/>
            <svg:text id="start" x="22" y="115" fill="white" font-size="16" cursor="pointer" >Statystyki</svg:text>
        
			<svg:g id="autorID" visibility="hidden">
            <svg:rect x="100" y="59" width="487" height="20" fill="rgb(112,128,144)" stroke="black"/>
            <xsl:apply-templates/>
        </svg:g>
        
		</xsl:template>
		
		<xsl:template match="autor">
        <xsl:element name="svg:text">
            <xsl:attribute name="x">
                    <xsl:variable name="długość" select="(position()-2)*(string-length(concat(imię,' ',nazwisko,' | ',./@Indeks)))"/>
                    <xsl:value-of select="(4.5*$długość)+120"/> 
            </xsl:attribute>
            <xsl:attribute name="y">
                <xsl:text>74</xsl:text>
            </xsl:attribute>
            <xsl:attribute name="fill">
                <xsl:text>white</xsl:text>
            </xsl:attribute>
            <xsl:attribute name="font-size">
                <xsl:text>16</xsl:text>
            </xsl:attribute>
            <xsl:value-of select="concat(imię,' ',nazwisko,' | ',./@Indeks)"/>
        </xsl:element>
        
        
    </xsl:template>
    
		<xsl:template name="Raport">
			<svg:g id="rect" width="600" height="200">
				<svg:rect x="100" y="100" width="600" height="200" fill="rgb(112,128,144)" stroke="black"/>
					<line x1="115" y1="124" x2="692" y2="124" style="stroke:rgb(0,0,0);stroke-width:1" />
					<line x1="115" y1="136" x2="692" y2="136" style="stroke:rgb(0,0,0);stroke-width:1" />
					<line x1="115" y1="148" x2="692" y2="148" style="stroke:rgb(0,0,0);stroke-width:1" />
					<line x1="115" y1="160" x2="692" y2="160" style="stroke:rgb(0,0,0);stroke-width:1" />
					<line x1="115" y1="172" x2="692" y2="172" style="stroke:rgb(0,0,0);stroke-width:1" />
					<line x1="115" y1="184" x2="692" y2="184" style="stroke:rgb(0,0,0);stroke-width:1" />
					<line x1="115" y1="196" x2="692" y2="196" style="stroke:rgb(0,0,0);stroke-width:1" />
					<line x1="115" y1="210" x2="692" y2="210" style="stroke:rgb(0,0,0);stroke-width:1" />
					<line x1="115" y1="222" x2="692" y2="222" style="stroke:rgb(0,0,0);stroke-width:1" />
					<line x1="115" y1="234" x2="692" y2="234" style="stroke:rgb(0,0,0);stroke-width:1" />
					<line x1="115" y1="246" x2="692" y2="246" style="stroke:rgb(0,0,0);stroke-width:1" />
					<line x1="115" y1="258" x2="692" y2="258" style="stroke:rgb(0,0,0);stroke-width:1" />
					<line x1="115" y1="270" x2="692" y2="270" style="stroke:rgb(0,0,0);stroke-width:1" />
			</svg:g>
			
		<xsl:variable name="ileRowerow" select="//Ilość_wszystkich_rowerów"/>
		<xsl:variable name="endpoint1" select="270 - ($ileRowerow*6)"/>
			
		<svg:line x1="165" y1="270" x2="165" y2="270" stroke="yellow" stroke-width="15" >
		<svg:animate attributeName="y2" attributeType="XML" begin="start.click" dur="4s" fill="freeze" from="270" to="{$endpoint1}"/>
		</svg:line>
		
		<xsl:variable name="ileRowerowEUR" select="//Ilość_Rowerów_EUR"/>
		<xsl:variable name="endpoint2" select="270 - ($ileRowerowEUR*6)"/>
			
		<svg:line x1="270" y1="270" x2="270" y2="270" stroke="yellow" stroke-width="15" >
		<svg:animate attributeName="y2" attributeType="XML" begin="start.click" dur="4s" fill="freeze" from="270" to="{$endpoint2}"/>
		</svg:line>
		
		<xsl:variable name="ileRowerowUSD" select="//Ilość_Rowerów_USD"/>
		<xsl:variable name="endpoint3" select="270 - ($ileRowerowUSD*6)"/>
			
		<svg:line x1="405" y1="270" x2="405" y2="270" stroke="yellow" stroke-width="15" >
		<svg:animate attributeName="y2" attributeType="XML" begin="start.click" dur="4s" fill="freeze" from="270" to="{$endpoint3}"/>
		</svg:line>
		
		<xsl:variable name="ileRowerowPLN" select="//Ilość_Rowerów_PLN"/>
		<xsl:variable name="endpoint4" select="270 - ($ileRowerowPLN*6)"/>
			
		<svg:line x1="535" y1="270" x2="535" y2="270" stroke="yellow" stroke-width="15" >
		<svg:animate attributeName="y2" attributeType="XML" begin="start.click" dur="4s" fill="freeze" from="270" to="{$endpoint4}"/>
		</svg:line>
		
		<xsl:variable name="ileProducentow" select="//Ilość_producentów"/>
		<xsl:variable name="endpoint5" select="270 - ($ileProducentow*6)"/>
			
		<svg:line x1="655" y1="270" x2="655" y2="270" stroke="yellow" stroke-width="15" >
		<svg:animate attributeName="y2" attributeType="XML" begin="start.click" dur="4s" fill="freeze" from="270" to="{$endpoint5}"/>
		</svg:line>
		
		<svg:text x="50%" y="118" font-size="16" fill="white" font-weight="bold" text-anchor="middle">Statystyki</svg:text>
        <svg:text x="115" y="290" font-size="16" fill="white" font-weight="bold">Ilość rowerów</svg:text>
        <svg:text x="235" y="290" font-size="16" fill="white" font-weight="bold">Rowery EUR</svg:text>
        <svg:text x="355" y="290" font-size="16" fill="white" font-weight="bold">Rowery USD</svg:text>
        <svg:text x="485" y="290" font-size="16" fill="white" font-weight="bold">Rowery PLN</svg:text>
        <svg:text x="615" y="290" font-size="16" fill="white" font-weight="bold">Producenci</svg:text>
		
		<svg:g id="rect2" width="600" height="200" >
				<svg:rect x="100" y="350" width="600" height="200" fill="rgb(112,128,144)" stroke="black"/>
					<line x1="115" y1="374" x2="692" y2="374" style="stroke:rgb(0,0,0);stroke-width:1" />
					<line x1="115" y1="386" x2="692" y2="386" style="stroke:rgb(0,0,0);stroke-width:1" />
					<line x1="115" y1="398" x2="692" y2="398" style="stroke:rgb(0,0,0);stroke-width:1" />
					<line x1="115" y1="410" x2="692" y2="410" style="stroke:rgb(0,0,0);stroke-width:1" />
					<line x1="115" y1="422" x2="692" y2="422" style="stroke:rgb(0,0,0);stroke-width:1" />
					<line x1="115" y1="434" x2="692" y2="434" style="stroke:rgb(0,0,0);stroke-width:1" />
					<line x1="115" y1="446" x2="692" y2="446" style="stroke:rgb(0,0,0);stroke-width:1" />
					<line x1="115" y1="458" x2="692" y2="458" style="stroke:rgb(0,0,0);stroke-width:1" />
					<line x1="115" y1="470" x2="692" y2="470" style="stroke:rgb(0,0,0);stroke-width:1" />
					<line x1="115" y1="482" x2="692" y2="482" style="stroke:rgb(0,0,0);stroke-width:1" />
					<line x1="115" y1="494" x2="692" y2="494" style="stroke:rgb(0,0,0);stroke-width:1" />
					<line x1="115" y1="506" x2="692" y2="506" style="stroke:rgb(0,0,0);stroke-width:1" />
					<line x1="115" y1="518" x2="692" y2="518" style="stroke:rgb(0,0,0);stroke-width:1" />
			</svg:g>
			
			<svg:text x="50%" y="368" font-size="16" fill="white" font-weight="bold" text-anchor="middle">Rowery górskie - waga</svg:text>
			<svg:text x="115" y="540" font-size="16" fill="white" font-weight="bold"><xsl:value-of select="/dokument/sklep_rowerowy/rodzaj[@Id='G']/lista_rowerów/rower[@Id='G01']/nazwa" /></svg:text>
			<svg:text x="255" y="540" font-size="16" fill="white" font-weight="bold"><xsl:value-of select="/dokument/sklep_rowerowy/rodzaj[@Id='G']/lista_rowerów/rower[@Id='G02']/nazwa" /></svg:text>
			<svg:text x="440" y="540" font-size="16" fill="white" font-weight="bold"><xsl:value-of select="/dokument/sklep_rowerowy/rodzaj[@Id='G']/lista_rowerów/rower[@Id='G03']/nazwa" /></svg:text>
			<svg:text x="610" y="540" font-size="16" fill="white" font-weight="bold"><xsl:value-of select="/dokument/sklep_rowerowy/rodzaj[@Id='G']/lista_rowerów/rower[@Id='G04']/nazwa" /></svg:text>
			
			<xsl:variable name="waga1" select="/dokument/sklep_rowerowy/rodzaj[@Id='G']/lista_rowerów/rower[@Id='G01']/waga"/>
			<xsl:variable name="result1" select="518 - ($waga1*10)"/>
				
			<svg:line x1="150" y1="518" x2="150" y2="518" stroke="yellow" stroke-width="15" >
			<svg:animate attributeName="y2" attributeType="XML" begin="start.click" dur="4s" fill="freeze" from="518" to="{$result1}"/>
			</svg:line>
			
			
			<xsl:variable name="waga2" select="/dokument/sklep_rowerowy/rodzaj[@Id='G']/lista_rowerów/rower[@Id='G02']/waga"/>
			<xsl:variable name="result2" select="518 - ($waga2*10)"/>
				
			<svg:line x1="315" y1="518" x2="315" y2="518" stroke="yellow" stroke-width="15" >
			<svg:animate attributeName="y2" attributeType="XML" begin="start.click" dur="4s" fill="freeze" from="518" to="{$result2}"/>
			</svg:line>
			
			
			<xsl:variable name="waga3" select="/dokument/sklep_rowerowy/rodzaj[@Id='G']/lista_rowerów/rower[@Id='G03']/waga"/>
			<xsl:variable name="result3" select="518 - ($waga3*10)"/>
				
			<svg:line x1="480" y1="518" x2="480" y2="518" stroke="yellow" stroke-width="15" >
			<svg:animate attributeName="y2" attributeType="XML" begin="start.click" dur="4s" fill="freeze" from="518" to="{$result3}"/>
			</svg:line>
			
			
			<xsl:variable name="waga4" select="/dokument/sklep_rowerowy/rodzaj[@Id='G']/lista_rowerów/rower[@Id='G04']/waga"/>
			<xsl:variable name="result4" select="518 - ($waga4*10)"/>
				
			<svg:line x1="642" y1="518" x2="642" y2="518" stroke="yellow" stroke-width="15" >
			<svg:animate attributeName="y2" attributeType="XML" begin="start.click" dur="4s" fill="freeze" from="518" to="{$result4}"/>
			</svg:line>
			
			<svg:g id="numbamumba" visibility="hidden">
			<xsl:variable name="liczba1" select="$result1 - 8"/>
				<svg:text x="130" y="{$liczba1}" fill="white" font-size="16">
				<xsl:value-of select="concat(/dokument/sklep_rowerowy/rodzaj[@Id='G']/lista_rowerów/rower[@Id='G01']/waga,' ','kg')"/>
<svg:animate id="anim1" attributeName="visibility" begin="start.click"
 from="hidden" to="visible" dur="8s" fill="freeze"/>				
				</svg:text>
				
				<xsl:variable name="liczba2" select="$result2 - 8"/>
				<svg:text x="295" y="{$liczba2}" fill="white" font-size="16">
				<xsl:value-of select="concat(/dokument/sklep_rowerowy/rodzaj[@Id='G']/lista_rowerów/rower[@Id='G02']/waga,' ','kg')"/>
<svg:animate id="anim1" attributeName="visibility" begin="start.click"
 from="hidden" to="visible" dur="8s" fill="freeze"/>				
				</svg:text>
				
				<xsl:variable name="liczba3" select="$result3 - 8"/>
				<svg:text x="460" y="{$liczba3}" fill="white" font-size="16">
				<xsl:value-of select="concat(/dokument/sklep_rowerowy/rodzaj[@Id='G']/lista_rowerów/rower[@Id='G03']/waga,' ','kg')"/>
<svg:animate id="anim1" attributeName="visibility" begin="start.click"
 from="hidden" to="visible" dur="8s" fill="freeze"/>				
				</svg:text>
				
				<xsl:variable name="liczba4" select="$result4 - 8"/>
				<svg:text x="622" y="{$liczba4}" fill="white" font-size="16">
				<xsl:value-of select="concat(/dokument/sklep_rowerowy/rodzaj[@Id='G']/lista_rowerów/rower[@Id='G04']/waga,' ','kg')"/>
<svg:animate id="anim1" attributeName="visibility" begin="start.click"
 from="hidden" to="visible" dur="8s" fill="freeze"/>				
				</svg:text>
			</svg:g>
			
		</xsl:template>
    
</xsl:stylesheet>