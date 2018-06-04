<?xml version="1.0" encoding="UTF-8"?>

<xsl:stylesheet version="1.0" 
                xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
                xmlns:fo="http://www.w3.org/1999/XSL/Format">

    <xsl:output method="xml" 
                encoding="utf-8"/>

	<xsl:template match="/">
		<fo:root>
			<fo:layout-master-set>
				<fo:simple-page-master master-name="SklepRowerowy"
				page-height="29cm"
				page-width="21cm"
				margin-top="2cm"
				margin-bottom="1cm"
				margin-left="2cm"
				margin-right="2cm">
					<fo:region-body margin="2cm"/>
					<fo:region-before extent="2" />
					<fo:region-after extent="2" />
					<fo:region-start extent="2" />
				</fo:simple-page-master>
			</fo:layout-master-set>
			
			<fo:page-sequence master-reference="SklepRowerowy">
				<fo:static-content flow-name="xsl-region-before">
					<fo:block text-align="center" font-family="Arial" font-size="12px">
						<xsl:text>Sklep rowerowy</xsl:text>
					</fo:block>
				</fo:static-content>
				
				<fo:static-content flow-name="xsl-region-after">
				  <fo:block text-align="center" font-family="monospace"  font-size="10px">
					<xsl:text>[&#x20;Strona&#x20;</xsl:text>
					<fo:page-number />
					<xsl:text>&#x20;&#x20;|&#x20;</xsl:text>
					<xsl:value-of select="substring(//dokument/Raport/DataRaportu,1,10)"/>
							 <xsl:text>&#xD;&#xA;</xsl:text>
							 <xsl:value-of select="substring(//dokument/Raport/DataRaportu,12,5)"/>
						 <xsl:text>&#x20;]</xsl:text>
				  </fo:block>
				
				</fo:static-content>
        
				<fo:flow flow-name="xsl-region-body"> 
				  <xsl:apply-templates/> 
				</fo:flow>
			</fo:page-sequence>
		</fo:root>
	</xsl:template>
	
	<xsl:template match="autorzy">
    <fo:block font-size="15px" text-align="center" font-family="Segoe UI" margin="15">
      <fo:block>
        <xsl:apply-templates />
      </fo:block>
    </fo:block>
  </xsl:template>
  
  <xsl:template match="autor">
    <fo:block font-size="12px" text-align="left" font-family="Segoe UI"> 
      <fo:block>
        <fo:block margin-left="5mm">
          <xsl:value-of select="imię"/> 
          <xsl:text>&#xD;&#xA;</xsl:text>
          <xsl:value-of select="nazwisko"/>
          <xsl:text>&#xD;&#xA;</xsl:text>
          <xsl:value-of select="płeć"/>
          <xsl:text>&#xD;&#xA;</xsl:text>
          <xsl:text>&#xA;</xsl:text>
          <xsl:value-of select="./@Indeks"/>
          <xsl:text>&#xA;</xsl:text>
        </fo:block>
      </fo:block>
    </fo:block>
  </xsl:template>
  
  <xsl:template match="sklep_rowerowy">
	  <fo:block font-size="12px" text-align="left" font-family="Arial">
		  <fo:block text-align="center" margin="20" font-weight="bold">
			  <xsl:text>Rowery</xsl:text>
			  <xsl:text>&#xD;&#xA;</xsl:text>
		  </fo:block>
		  <fo:block>
			  <fo:table border="solid black" width="100%">
				  <fo:table-header>
							<fo:table-row>
								<fo:table-cell border="solid black">
									<fo:block font-weight="bold" text-align="center">Rodzaj</fo:block>
								</fo:table-cell>
								<fo:table-cell border="solid black">
									<fo:block font-weight="bold" text-align="center">Ilość</fo:block>
								</fo:table-cell>
								<fo:table-cell border="solid black">
									<fo:block font-weight="bold" text-align="center">Średnia waga</fo:block>
								</fo:table-cell>
								<fo:table-cell border="solid black">
									<fo:block font-weight="bold" text-align="center">Maksymalna waga</fo:block>
								</fo:table-cell>
								<fo:table-cell border="solid black">
									<fo:block font-weight="bold" text-align="center">Minimalna waga</fo:block>
								</fo:table-cell>
							</fo:table-row>
						</fo:table-header>
						
						<fo:table-body>
							<xsl:for-each select="//rodzaj">
								<fo:table-row>
									<fo:table-cell border="solid black">
										<fo:block text-align="center">
											<xsl:value-of select="@nazwa"/>
										</fo:block>
									</fo:table-cell>
									<fo:table-cell border="solid black">
										<fo:block text-align="center">
											<xsl:value-of select="@liczbaRowerów"/>
										</fo:block>
									</fo:table-cell>
									<fo:table-cell border="solid black">
										<fo:block text-align="center">
											<xsl:value-of select="@średniaWagaRowerów"/>
										</fo:block>
									</fo:table-cell>
									<fo:table-cell border="solid black">
										<fo:block text-align="center">
											<xsl:value-of select="@maxWagaRowerów"/>
										</fo:block>
									</fo:table-cell>
									<fo:table-cell border="solid black">
										<fo:block text-align="center">
											<xsl:value-of select="@minWagaRowerów"/>
										</fo:block>
									</fo:table-cell>
								</fo:table-row>
							</xsl:for-each>
						</fo:table-body>
			  </fo:table>
		  </fo:block>
	  </fo:block>
	  
	<xsl:text>&#xD;&#xA;&#xA;</xsl:text>
	
	<fo:block font-size="12px" text-align="left" font-family="Segoe UI">
		<fo:block text-align="center" margin="20" font-weight="bold" space-before="45pt">
			<xsl:text>Producenci</xsl:text>
			<xsl:text>&#xD;&#xA;</xsl:text>
		</fo:block>
	<fo:table border="solid black" width="100%">
		<fo:table-header>
			<fo:table-row>
				<fo:table-cell>
					<fo:block font-weight="bold" text-align="center">Nazwa</fo:block>
				</fo:table-cell>
				<fo:table-cell>
					<fo:block font-weight="bold" text-align="center">Ilość rowerów</fo:block>
				</fo:table-cell>
				<fo:table-cell>
					<fo:block font-weight="bold" text-align="center">Kraj</fo:block>
				</fo:table-cell>
			</fo:table-row>
		</fo:table-header>
		
		<fo:table-body>
			<xsl:for-each select="//pochodzenie">
				<fo:table-row>
					<fo:table-cell>
						<fo:block text-align="center">
							<xsl:value-of select="@firma"/>
						</fo:block>
					</fo:table-cell>
					<fo:table-cell>
						<fo:block text-align="center">
							<xsl:value-of select="@iloscRowerow"/>
						</fo:block>
					</fo:table-cell>
					<fo:table-cell>
						<fo:block text-align="center">
							<xsl:value-of select="@kraj"/>
							</fo:block>
						</fo:table-cell>
					</fo:table-row>
				</xsl:for-each>
			</fo:table-body>
		</fo:table>
	</fo:block>
	
	<xsl:text>&#xD;&#xA;&#xA;</xsl:text>
	
	<fo:block font-size="12px" text-align="left" font-family="Amaranth">
      <fo:block text-align="center" margin="10" font-weight="bold" >
        <xsl:text>&#160;</xsl:text>
        <xsl:text>Sortowanie</xsl:text>
        <xsl:text>&#xD;&#xA;</xsl:text> 
      </fo:block>
       <fo:block>
		   <fo:table border="dotted black" width="100%">
				<fo:table-header>
					<fo:table-row>
						<fo:table-cell border="dotted black">
							<fo:block font-weight="bold" text-align="center">Nazwa roweru</fo:block>
						</fo:table-cell>
						<fo:table-cell border="dotted black">
							<fo:block font-weight="bold" text-align="center">cena > 3000</fo:block>
						</fo:table-cell>
					</fo:table-row>
				</fo:table-header>
						
				<fo:table-body>
					<xsl:for-each select="//rower">
						<xsl:if test="cena > 3000">
							<fo:table-row>
								<fo:table-cell>
									<fo:block text-align="center">
										<xsl:value-of select="nazwa"/>
									</fo:block>
								</fo:table-cell>
								<fo:table-cell>
									<fo:block text-align="center">
										<xsl:value-of select="cena"/>
									</fo:block>
								</fo:table-cell>
							</fo:table-row>
						</xsl:if>
					</xsl:for-each>
				</fo:table-body>
			</fo:table>
       </fo:block>
	</fo:block>
	
	<xsl:text>&#xD;&#xA;&#xA;</xsl:text>
	
	<fo:block font-size="8px" text-align="center" font-family="Antic" margin-left="1.5cm" margin-right="1.5cm">
		<fo:block text-align="center" margin="20" font-weight="bold" space-before="105pt">
			<xsl:text>Rowery Kross</xsl:text>
			<xsl:text>&#xD;&#xA;</xsl:text>
		</fo:block>
		<fo:block>
			<fo:table border="dashed black">
				<fo:table-header>
					<fo:table-row>
						<fo:table-cell>
							<fo:block font-weight="bold" text-align="center">Nazwa</fo:block>
						</fo:table-cell>
						<fo:table-cell>
							<fo:block font-weight="bold" text-align="center">Waga</fo:block>
						</fo:table-cell>
						<fo:table-cell>
							<fo:block font-weight="bold" text-align="center">Cena</fo:block>
						</fo:table-cell>
						<fo:table-cell>
							<fo:block font-weight="bold" text-align="center">Wiek</fo:block>
						</fo:table-cell>
					</fo:table-row>
				</fo:table-header>
				<fo:table-body>
					<xsl:for-each select="//rower">
						<xsl:if test="@producent = 'Kross'">
							<fo:table-row>
								<fo:table-cell border="dashed black">
									<fo:block text-align="center"><xsl:value-of select="nazwa"/></fo:block>
								</fo:table-cell>
								<fo:table-cell border="dashed black">
									<fo:block text-align="center"><xsl:value-of select="concat(waga, ' ', waga/@jednostka)"/></fo:block>
								</fo:table-cell>
								<fo:table-cell border="dashed black">
									<fo:block text-align="center"><xsl:value-of select="concat(cena, ' ', cena/@waluta)"/></fo:block>
								</fo:table-cell>
								<fo:table-cell border="dashed black">
									<fo:block text-align="center"><xsl:value-of select="concat(WiekRoweru, ' ', 'lat')"/></fo:block>
								</fo:table-cell>
							</fo:table-row>
						</xsl:if>
					</xsl:for-each>
				</fo:table-body>
			</fo:table>
		</fo:block>
	</fo:block>
	
	<xsl:text>&#xD;&#xA;&#xA;</xsl:text>
	
	<fo:block font-size="8px" text-align="left" font-family="Helvetica" margin-left="1.5cm" margin-right="1.5cm">
		<fo:block text-align="left" margin="20" font-weight="bold" space-before="105pt">
			<xsl:text>Rowery Specialized</xsl:text>
			<xsl:text>&#xD;&#xA;</xsl:text>
		</fo:block>
		<fo:block>
			<fo:table border="solid black">
				<fo:table-header>
					<fo:table-row>
						<fo:table-cell border="solid black">
							<fo:block font-weight="bold" >Nazwa</fo:block>
						</fo:table-cell>
						<fo:table-cell border="solid black">
							<fo:block font-weight="bold" >Waga</fo:block>
						</fo:table-cell>
						<fo:table-cell border="solid black">
							<fo:block font-weight="bold" >Cena</fo:block>
						</fo:table-cell>
						<fo:table-cell border="solid black">
							<fo:block font-weight="bold">Wiek</fo:block>
						</fo:table-cell>
					</fo:table-row>
				</fo:table-header>
				<fo:table-body>
					<xsl:for-each select="//rower">
						<xsl:if test="@producent = 'Specialized'">
							<fo:table-row>
								<fo:table-cell border="solid black" text-align="right">
									<fo:block text-align="center"><xsl:value-of select="nazwa"/></fo:block>
								</fo:table-cell>
								<fo:table-cell border="solid black" text-align="right">
									<fo:block text-align="center"><xsl:value-of select="concat(waga, ' ', waga/@jednostka)"/></fo:block>
								</fo:table-cell>
								<fo:table-cell border="solid black" text-align="right">
									<fo:block text-align="center"><xsl:value-of select="concat(cena, ' ', cena/@waluta)"/></fo:block>
								</fo:table-cell>
								<fo:table-cell border="solid black" text-align="right">
									<fo:block text-align="center"><xsl:value-of select="concat(WiekRoweru, ' ', 'lat')"/></fo:block>
								</fo:table-cell>
							</fo:table-row>
						</xsl:if>
					</xsl:for-each>
				</fo:table-body>
			</fo:table>
		</fo:block>
	</fo:block>
	
	<xsl:text>&#xD;&#xA;&#xA;</xsl:text>
	
	<fo:block font-size="8px" text-align="left" font-family="Helvetica" margin-left="1.5cm" margin-right="1.5cm">
		<fo:block text-align="center" margin="20" font-weight="bold" space-before="105pt">
			<xsl:text>Rowery Trek</xsl:text>
			<xsl:text>&#xD;&#xA;</xsl:text>
		</fo:block>
		<fo:block>
			<fo:table border="solid black">
				<fo:table-header>
					<fo:table-row>
						<fo:table-cell border="solid black">
							<fo:block font-weight="bold" text-align="center">Nazwa</fo:block>
						</fo:table-cell>
						<fo:table-cell border="solid black">
							<fo:block font-weight="bold" text-align="center">Waga</fo:block>
						</fo:table-cell>
						<fo:table-cell border="solid black">
							<fo:block font-weight="bold" text-align="center">Cena</fo:block>
						</fo:table-cell>
						<fo:table-cell border="solid black">
							<fo:block font-weight="bold" text-align="center">Wiek</fo:block>
						</fo:table-cell>
					</fo:table-row>
				</fo:table-header>
				<fo:table-body>
					<xsl:for-each select="//rower">
						<xsl:if test="@producent = 'Trek'">
							<fo:table-row>
								<fo:table-cell border="solid black">
									<fo:block text-align="center"><xsl:value-of select="nazwa"/></fo:block>
								</fo:table-cell>
								<fo:table-cell border="solid black">
									<fo:block text-align="center"><xsl:value-of select="concat(waga, ' ', waga/@jednostka)"/></fo:block>
								</fo:table-cell>
								<fo:table-cell border="solid black">
									<fo:block text-align="center"><xsl:value-of select="concat(cena, ' ', cena/@waluta)"/></fo:block>
								</fo:table-cell>
								<fo:table-cell border="solid black">
									<fo:block text-align="center"><xsl:value-of select="concat(WiekRoweru, ' ', 'lat')"/></fo:block>
								</fo:table-cell>
							</fo:table-row>
						</xsl:if>
					</xsl:for-each>
				</fo:table-body>
			</fo:table>
		</fo:block>
	</fo:block>
	
	<xsl:text>&#xD;&#xA;&#xA;</xsl:text>
	
	<fo:block font-size="8px" text-align="left" font-family="Helvetica" margin-left="1.5cm" margin-right="1.5cm">
		<fo:block text-align="center" margin="20" font-weight="bold" space-before="105pt">
			<xsl:text>Rowery Legrand</xsl:text>
			<xsl:text>&#xD;&#xA;</xsl:text>
		</fo:block>
		<fo:block>
			<fo:table border="solid black">
				<fo:table-header>
					<fo:table-row>
						<fo:table-cell border="solid black">
							<fo:block font-weight="bold" text-align="center">Nazwa</fo:block>
						</fo:table-cell>
						<fo:table-cell border="solid black">
							<fo:block font-weight="bold" text-align="center">Waga</fo:block>
						</fo:table-cell>
						<fo:table-cell border="solid black">
							<fo:block font-weight="bold" text-align="center">Cena</fo:block>
						</fo:table-cell>
						<fo:table-cell border="solid black">
							<fo:block font-weight="bold" text-align="center">Wiek</fo:block>
						</fo:table-cell>
					</fo:table-row>
				</fo:table-header>
				<fo:table-body>
					<xsl:for-each select="//rower">
						<xsl:if test="@producent = 'Legrand'">
							<fo:table-row>
								<fo:table-cell border="solid black">
									<fo:block text-align="center"><xsl:value-of select="nazwa"/></fo:block>
								</fo:table-cell>
								<fo:table-cell border="solid black">
									<fo:block text-align="center"><xsl:value-of select="concat(waga, ' ', waga/@jednostka)"/></fo:block>
								</fo:table-cell>
								<fo:table-cell border="solid black">
									<fo:block text-align="center"><xsl:value-of select="concat(cena, ' ', cena/@waluta)"/></fo:block>
								</fo:table-cell>
								<fo:table-cell border="solid black">
									<fo:block text-align="center"><xsl:value-of select="concat(WiekRoweru, ' ', 'lat')"/></fo:block>
								</fo:table-cell>
							</fo:table-row>
						</xsl:if>
					</xsl:for-each>
				</fo:table-body>
			</fo:table>
		</fo:block>
	</fo:block>
	
	<xsl:text>&#xD;&#xA;&#xA;</xsl:text>
	
	<fo:block font-size="8px" text-align="left" font-family="Times" margin-left="1.5cm" margin-right="1.5cm">
		<fo:block text-align="center" margin="20" font-weight="bold" space-before="105pt">
			<xsl:text>Rowery EUR</xsl:text>
			<xsl:text>&#xD;&#xA;</xsl:text> 
		</fo:block>
		<fo:block>
			<fo:table border="solid black" width="100%">
				<fo:table-header>
					<fo:table-row>
						<fo:table-cell border="solid black">
							<fo:block font-weight="bold" text-align="center">Ilość rowerów EUR</fo:block>
						</fo:table-cell>
						<fo:table-cell border="solid black">
							<fo:block font-weight="bold" text-align="center">Cena rowerów EUR</fo:block>
						</fo:table-cell>
						<fo:table-cell border="solid black">
							<fo:block font-weight="bold" text-align="center">Średnia cena rowerów EUR</fo:block>
						</fo:table-cell>
					</fo:table-row>
				</fo:table-header>
				<fo:table-body>
					<xsl:for-each select="//Raport">
						<fo:table-row>
							<fo:table-cell>
								<fo:block text-align="center"><xsl:value-of select="Ilość_Rowerów_EUR"/></fo:block>
							</fo:table-cell>
							<fo:table-cell>
								<fo:block text-align="center"><xsl:value-of select="Cena_rowerów_euro"/></fo:block>
							</fo:table-cell>
							<fo:table-cell>
								<fo:block text-align="center"><xsl:value-of select="Średnia_cena_rowerów_EUR"/></fo:block>
							</fo:table-cell>
						</fo:table-row>
					</xsl:for-each>
				</fo:table-body>
			</fo:table>
		</fo:block>
	</fo:block>
	
	<xsl:text>&#xD;&#xA;&#xA;</xsl:text>
	
	<fo:block font-size="8px" text-align="left" font-family="Pragmatica" margin-left="1.5cm" margin-right="1.5cm">
		<fo:block text-align="center" margin="20" font-weight="bold" space-before="105pt">
			<xsl:text>Rowery USD</xsl:text>
			<xsl:text>&#xD;&#xA;</xsl:text> 
		</fo:block>
		<fo:block>
			<fo:table border="solid black" width="100%">
				<fo:table-header>
					<fo:table-row>
						<fo:table-cell border="solid black">
							<fo:block font-weight="bold" text-align="center">Ilość rowerów USD</fo:block>
						</fo:table-cell>
						<fo:table-cell border="solid black">
							<fo:block font-weight="bold" text-align="center">Cena rowerów USD</fo:block>
						</fo:table-cell>
						<fo:table-cell border="solid black">
							<fo:block font-weight="bold" text-align="center">Średnia cena rowerów USD</fo:block>
						</fo:table-cell>
					</fo:table-row>
				</fo:table-header>
				<fo:table-body>
					<xsl:for-each select="//Raport">
						<fo:table-row>
							<fo:table-cell>
								<fo:block text-align="center"><xsl:value-of select="Ilość_Rowerów_USD"/></fo:block>
							</fo:table-cell>
							<fo:table-cell>
								<fo:block text-align="center"><xsl:value-of select="Cena_rowerów_usd"/></fo:block>
							</fo:table-cell>
							<fo:table-cell>
								<fo:block text-align="center"><xsl:value-of select="Średnia_cena_rowerów_usd"/></fo:block>
							</fo:table-cell>
						</fo:table-row>
					</xsl:for-each>
				</fo:table-body>
			</fo:table>
		</fo:block>
	</fo:block>
	
	<xsl:text>&#xD;&#xA;&#xA;</xsl:text>
	
	<fo:block font-size="8px" text-align="left" font-family="Helvetica" margin-left="1.5cm" margin-right="1.5cm">
		<fo:block text-align="center" margin="20" font-weight="bold" space-before="105pt">
			<xsl:text>Rowery PLN</xsl:text>
			<xsl:text>&#xD;&#xA;</xsl:text> 
		</fo:block>
		<fo:block>
			<fo:table border="solid black" width="100%">
				<fo:table-header>
					<fo:table-row>
						<fo:table-cell border="solid black">
							<fo:block font-weight="bold" text-align="center">Ilość rowerów PLN</fo:block>
						</fo:table-cell>
						<fo:table-cell border="solid black">
							<fo:block font-weight="bold" text-align="center">Cena rowerów PLN</fo:block>
						</fo:table-cell>
						<fo:table-cell border="solid black">
							<fo:block font-weight="bold" text-align="center">Średnia cena rowerów PLN</fo:block>
						</fo:table-cell>
					</fo:table-row>
				</fo:table-header>
				<fo:table-body>
					<xsl:for-each select="//Raport">
						<fo:table-row>
							<fo:table-cell>
								<fo:block text-align="center"><xsl:value-of select="Ilość_Rowerów_PLN"/></fo:block>
							</fo:table-cell>
							<fo:table-cell>
								<fo:block text-align="center"><xsl:value-of select="Cena_rowerów_pln"/></fo:block>
							</fo:table-cell>
							<fo:table-cell>
								<fo:block text-align="center"><xsl:value-of select="Średnia_cena_rowerów_PLN"/></fo:block>
							</fo:table-cell>
						</fo:table-row>
					</xsl:for-each>
				</fo:table-body>
			</fo:table>
		</fo:block>
	</fo:block>

  
 	<xsl:text>&#xD;&#xA;&#xA;</xsl:text>

	<fo:block font-size="8px" text-align="left" font-family="Helvetica" margin-left="1.5cm" margin-right="1.5cm">
		 <fo:block text-align="center" margin="20" font-weight="bold" space-before="105pt">
			<xsl:text>Raport</xsl:text>
			<fo:table border="solid black" width="100%">
				<fo:table-header>
            <fo:table-row>
              <fo:table-cell border="solid black">
                <fo:block font-weight="bold" text-align="center">Ilość wszystkich rowerów</fo:block>
              </fo:table-cell>
              <fo:table-cell border="solid black">
                <fo:block font-weight="bold" text-align="center">Ilość wszystkich producentów</fo:block>
              </fo:table-cell>
            </fo:table-row>
          </fo:table-header>
          <fo:table-body>
			<fo:table-row>
					<fo:table-cell border="solid black">
						<fo:block text-align="center"><xsl:value-of select="//Ilość_wszystkich_rowerów"/></fo:block>
					</fo:table-cell>
					<fo:table-cell border="solid black">
						<fo:block text-align="center"><xsl:value-of select="//Ilość_producentów"/></fo:block>
					</fo:table-cell>
				</fo:table-row>
			</fo:table-body>
			</fo:table>
			</fo:block>
	</fo:block>
	  </xsl:template>
</xsl:stylesheet>