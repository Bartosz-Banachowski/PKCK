<?xml version="1.0" encoding="UTF-8" ?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns="http://www.w3.org/1999/xhtml" version="2.0">
<xsl:output method="xhtml"  encoding="UTF-8" indent="yes"
doctype-system="http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd"
doctype-public="-//W3C//DTD XHTML 1.0 Strict//EN" />

	<xsl:template match="/dokument">
		<html>
			<head>
				<title>Zad 3</title>
				<link rel="stylesheet" type="text/css" href="xhtmlcss.css" />
				<link href="https://fonts.googleapis.com/css?family=Lato" rel="stylesheet"/>
			</head>
			<body>
				<div id="container">
					<xsl:apply-templates/>
				</div>
			</body>
		</html>
	</xsl:template>

	<xsl:template match="autorzy">
<div id="autorzy">			
			<div class="autor">
				<h1> Zadanie 3 - dokument xhtml </h1>			
			</div>
		
			
			<div class="autor">
				<xsl:value-of select="autor[1]/imię"/> <br/>
				<xsl:value-of select="autor[1]/nazwisko"/> <br/>
				<xsl:value-of select="autor[1]/email"/> 
			</div>
			<div class="autor">
				<xsl:value-of select="autor[2]/imię"/> <br/>
				<xsl:value-of select="autor[2]/nazwisko"/> <br/>
				<xsl:value-of select="autor[2]/email"/> 
			</div>
			<div style="clear:both;"></div>
		</div>
	</xsl:template>

	<xsl:template match="sklep_rowerowy">
		<xsl:call-template name="WszystkieRowery"/>
		<xsl:call-template name="Rowery"/>
		<xsl:call-template name="RoweryKross"/>
		<xsl:call-template name="RowerySpecialized"/>
		<xsl:call-template name="RoweryTrek"/>
		<xsl:call-template name="RoweryLegrand"/>
		<xsl:call-template name="Producenci"/>
		<xsl:call-template name="RoweryEUR"/>
		<xsl:call-template name="RoweryUSD"/>
		<xsl:call-template name="RoweryPLN"/>
		<xsl:call-template name="Raport"/>
	</xsl:template>

	<xsl:template name="WszystkieRowery">
		<div id="wszystkieRowery">
			<h2>Rowery</h2>
			
			<table>
				
					<tr>
						<th>Rodzaj</th>
						<th>Ilość</th>
						<th>Średnia waga</th>
						<th>Maksymalna waga</th>
						<th>Minimalna waga</th>
					</tr>
					
					<xsl:for-each select="//rodzaj">
						<tr>
							<td>
								<xsl:value-of select="./@nazwa"/>
							</td>
							<td>
								<xsl:value-of select="@liczbaRowerów"/>
							</td>
							<td>
								<xsl:value-of select="@średniaWagaRowerów"/>
							</td>
							<td>
								<xsl:value-of select="@maxWagaRowerów"/>
							</td>
							<td>
								<xsl:value-of select="@minWagaRowerów"/>
							</td>
							
						</tr>
					</xsl:for-each>
					
				
			</table>
		</div>
	</xsl:template>
	
	<xsl:template name="Producenci">
		<div id="producenci">
			<h2>Producenci</h2>
			<table>
				<tbody>
					<tr>
						<th>Nazwa</th>
						<th>Ilość Rowerów</th>
						<th>Kraj</th>
						<th>Logo</th>
					</tr>
					<xsl:for-each select="//pochodzenie">
					<tr>
						<td>
							<xsl:value-of select="./@firma"/>
						</td>
						<td>
							<xsl:value-of select="./@iloscRowerow"/>
						</td>
						<td>
							<xsl:value-of select="./@kraj"/>
						</td>
						<td>
							<xsl:if test="@firma = 'Kross'">
								<img src="logo/kross.jpg" alt="error"/>
							</xsl:if>
							<xsl:if test="@firma = 'Specialized'">
								<img src="logo/specialized.jpg" alt="error"/>
							</xsl:if>
							<xsl:if test="@firma = 'Trek'">
								<img src="logo/trek.jpg" alt="error"/>
							</xsl:if>
							<xsl:if test="@firma = 'Legrand'">
								<img src="logo/legrand.png" alt="error"/>
							</xsl:if>
						</td>
					</tr>
					</xsl:for-each>
					
				</tbody>
			</table>
		</div>
	</xsl:template>

	<xsl:template name="Rowery">
		<div id="rowery">
			<h2>Sortowanie - przykład</h2>
			<table>
				<tbody>
					<tr>
						<th>Nazwa roweru</th>
						<th>cena > 3000</th>
					</tr>
					<xsl:for-each select="//rower">
						<xsl:if test="cena > 3000">
							<tr>
								<td>
									<xsl:value-of select="nazwa"/>
								</td>
								<td>		
									<xsl:value-of select="cena"/>
								</td>
							</tr>
						</xsl:if>
					</xsl:for-each>
				</tbody>
			</table>
		</div>
	</xsl:template>
	
	<xsl:template name="RoweryKross">
		<div id="roweryWedługProducentów">
			<h2>Rowery Kross</h2>
			<table>
				<tbody>
					<tr>
						<th>Nazwa</th>
						<th>Waga</th>
						<th>Cena</th>
						<th>Wiek</th>
					</tr>
					<xsl:for-each select="//rower">
						<xsl:if test="@producent = 'Kross'">
							<tr>
								<td>
									<xsl:value-of select="nazwa"/>
								</td>
								<td>
									<xsl:value-of select="concat(waga, ' ', waga/@jednostka)"/>
								</td>
								<td>
									<xsl:value-of select="concat(cena, ' ', cena/@waluta)"/>
								</td>
								<td>
									<xsl:value-of select="concat(WiekRoweru, ' ', 'lat')"/>
								</td>
							</tr>
						</xsl:if>
					</xsl:for-each>
				</tbody>
			</table>
		</div>
	</xsl:template>
	
	<xsl:template name="RowerySpecialized">
		<div id="roweryWedługProducentów">
			<h2>Rowery Specialized</h2>
			<table>
				<tbody>
					<tr>
						<th>Nazwa</th>
						<th>Waga</th>
						<th>Cena</th>
						<th>Wiek</th>
					</tr>
					<xsl:for-each select="//rower">
						<xsl:if test="@producent = 'Specialized'">
							<tr>
								<td>
									<xsl:value-of select="nazwa"/>
								</td>
								<td>
									<xsl:value-of select="concat(waga, ' ', waga/@jednostka)"/>
								</td>
								<td>
									<xsl:value-of select="concat(cena, ' ', cena/@waluta)"/>
								</td>
								<td>
									<xsl:value-of select="concat(WiekRoweru, ' ', 'lat')"/>
								</td>
							</tr>
						</xsl:if>
					</xsl:for-each>
				</tbody>
			</table>
		</div>
	</xsl:template>
	
	<xsl:template name="RoweryTrek">
		<div id="roweryWedługProducentów">
			<h2>Rowery Trek</h2>
			<table>
				<tbody>
					<tr>
						<th>Nazwa</th>
						<th>Waga</th>
						<th>Cena</th>
						<th>Wiek</th>
					</tr>
					<xsl:for-each select="//rower">
						<xsl:if test="@producent = 'Trek'">
							<tr>
								<td>
									<xsl:value-of select="nazwa"/>
								</td>
								<td>
									<xsl:value-of select="concat(waga, ' ', waga/@jednostka)"/>
								</td>
								<td>
									<xsl:value-of select="concat(cena, ' ', cena/@waluta)"/>
								</td>
								<td>
									<xsl:value-of select="concat(WiekRoweru, ' ', 'lat')"/>
								</td>
							</tr>
						</xsl:if>
					</xsl:for-each>
				</tbody>
			</table>
		</div>
	</xsl:template>
	
	<xsl:template name="RoweryLegrand">
		<div id="roweryWedługProducentów">
			<h2>Rowery Le Grand</h2>
			<table>
				<tbody>
					<tr>
						<th>Nazwa</th>
						<th>Waga</th>
						<th>Cena</th>
						<th>Wiek</th>
					</tr>
					<xsl:for-each select="//rower">
						<xsl:if test="@producent = 'Legrand'">
							<tr>
								<td>
									<xsl:value-of select="nazwa"/>
								</td>
								<td>
									<xsl:value-of select="concat(waga, ' ', waga/@jednostka)"/>
								</td>
								<td>
									<xsl:value-of select="concat(cena, ' ', cena/@waluta)"/>
								</td>
								<td>
									<xsl:value-of select="concat(WiekRoweru, ' ', 'lat')"/>
								</td>
							</tr>
						</xsl:if>
					</xsl:for-each>
				</tbody>
			</table>
		</div>
	</xsl:template>
	
		<xsl:template name="RoweryEUR">
			<div id="RoweryEUR">
			<h2>Rowery EUR</h2>
				<table>
					<tbody>
						<tr>
						<th>Ilość rowerów EUR</th>
						<th>Cena rowerów EUR</th>
						<th>Średnia cena rowerów EUR</th>
						</tr>
						<tr>
							<td><xsl:value-of select="/dokument/Raport/Ilość_Rowerów_EUR"/></td>
							<td><xsl:value-of select="/dokument/Raport/Cena_rowerów_euro"/></td>
							<td><xsl:value-of select="/dokument/Raport/Średnia_cena_rowerów_EUR"/></td>
						</tr>
					</tbody>
				</table>
			</div>
		</xsl:template>
		
		<xsl:template name="RoweryUSD">
			<div id="RoweryUSD">
			<h2>Rowery USD</h2>
				<table>
					<tbody>
						<tr>
						<th>Ilość rowerów USD</th>
						<th>Cena rowerów USD</th>
						<th>Średnia cena rowerów USD</th>
						</tr>
						<tr>
							<td><xsl:value-of select="/dokument/Raport/Ilość_Rowerów_USD"/></td>
							<td><xsl:value-of select="/dokument/Raport/Cena_rowerów_usd"/></td>
							<td><xsl:value-of select="/dokument/Raport/Średnia_cena_rowerów_usd"/></td>
						</tr>
					</tbody>
				</table>
			</div>
		</xsl:template>
		
		<xsl:template name="RoweryPLN">
			<div id="RoweryPLN">
			<h2>Rowery PLN</h2>
				<table>
					<tbody>
						<tr>
						<th>Ilość rowerów PLN</th>
						<th>Cena rowerów PLN</th>
						<th>Średnia cena rowerów PLN</th>
						</tr>
						<tr>
							<td><xsl:value-of select="/dokument/Raport/Ilość_Rowerów_PLN"/></td>
							<td><xsl:value-of select="/dokument/Raport/Cena_rowerów_pln"/></td>
							<td><xsl:value-of select="/dokument/Raport/Średnia_cena_rowerów_PLN"/></td>
						</tr>
					</tbody>
				</table>
			</div>
		</xsl:template>
	
	<xsl:template name="Raport">
		<div id="raport">
			<h2>Raport</h2>
			<table>
				<tbody>
					<tr>
						<th>Ilość wszystkich rowerów</th>
						<th>Ilość wszystkich producentów</th>
						<th>Data wygenerowania raportu</th>
					</tr>	
					<tr>
						<td><xsl:value-of select="/dokument/Raport/Ilość_wszystkich_rowerów"/></td>
						<td><xsl:value-of select="/dokument/Raport/Ilość_producentów"/></td>
						<td><xsl:value-of select="/dokument/Raport/DataRaportu"/></td>
					</tr>
				</tbody>
			</table>
		</div>
	</xsl:template>

</xsl:stylesheet>     