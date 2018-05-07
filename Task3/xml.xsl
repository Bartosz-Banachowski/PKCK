<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="2.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform"  xmlns:date="http://exslt.org/dates-and-times" extension-element-prefixes="date"  xmlns:fn="http://www.w3.org/2005/xpath-functions">
	<xsl:output method="xml" version="1.0" encoding="UTF-8" indent="yes"/>
	
	<xsl:template match="/dokument">
		<xsl:apply-templates/>
	</xsl:template>
	<xsl:template match="/">
		<xsl:element name="dokument">
			<xsl:apply-templates/>
			<Raport>
				<Ilość_wszystkich_rowerów>
					<xsl:value-of select="count(dokument/sklep_rowerowy/rodzaj/lista_rowerów/rower)"/>
				</Ilość_wszystkich_rowerów>
				
					<Ilość_Rowerów_EUR>
						<xsl:value-of select="count(/dokument/sklep_rowerowy/rodzaj/lista_rowerów/rower/cena[@waluta='EUR'])"/>
					</Ilość_Rowerów_EUR>
				
				<Cena_rowerów_euro>
					<xsl:value-of select="sum(//cena[@waluta='EUR'])"/>
				</Cena_rowerów_euro>
					
					<Średnia_cena_rowerów_EUR>
						<xsl:variable name="iloscRowerowEuro" select="count(//rower/cena[@waluta='EUR'])" />
						<xsl:variable name="cenaRowerówEuro" select="sum(//cena[@waluta='EUR'])" />
						<xsl:value-of select="round($cenaRowerówEuro div $iloscRowerowEuro)" />
					</Średnia_cena_rowerów_EUR>
					
					<Ilość_Rowerów_USD>
						<xsl:value-of select="count(/dokument/sklep_rowerowy/rodzaj/lista_rowerów/rower/cena[@waluta='USD'])"/>
					</Ilość_Rowerów_USD>					
					
				<Cena_rowerów_usd>
					<xsl:value-of select="sum(//cena[@waluta='USD'])"/>
				</Cena_rowerów_usd>
					
					<Średnia_cena_rowerów_usd>
						<xsl:variable name="iloscRowerowUSD" select="count(//rower/cena[@waluta='USD'])" />
						<xsl:variable name="cenaRowerówUSD" select="sum(//cena[@waluta='USD'])" />
						<xsl:value-of select="round($cenaRowerówUSD div $iloscRowerowUSD)" />
					</Średnia_cena_rowerów_usd>
				
				<Ilość_Rowerów_PLN>
						<xsl:value-of select="count(/dokument/sklep_rowerowy/rodzaj/lista_rowerów/rower/cena[@waluta='PLN'])"/>
					</Ilość_Rowerów_PLN>
				
				<Cena_rowerów_pln>
					<xsl:value-of select="sum(//cena[@waluta='PLN'])"/>
				</Cena_rowerów_pln>
					<Średnia_cena_rowerów_PLN>
						<xsl:variable name="iloscRowerowPLN" select="count(//rower/cena[@waluta='PLN'])" />
						<xsl:variable name="cenaRowerówPLN" select="sum(//cena[@waluta='PLN'])" />
						<xsl:value-of select="round($cenaRowerówPLN div $iloscRowerowPLN)" />
					</Średnia_cena_rowerów_PLN>
				
				<Ilość_producentów>
					<xsl:value-of select="count(dokument/sklep_rowerowy/producenci/pochodzenie)"/>
				</Ilość_producentów>
				<DataRaportu>
					<xsl:value-of select="current-dateTime()"/>
				</DataRaportu>
			</Raport>
		</xsl:element>
	</xsl:template>
	<!--Sekcja dotycząca autorów -->
	<xsl:template match="//autorzy">
		<xsl:element name="autorzy">
			<xsl:apply-templates select="autor"/>
		</xsl:element>
	</xsl:template>
	<xsl:template match="//autor">
		<xsl:element name="autor">
			<xsl:attribute name="Indeks"><xsl:value-of select="./@Indeks"/></xsl:attribute>
			<xsl:element name="imię">
				<xsl:value-of select="./imię"/>
			</xsl:element>
			<xsl:element name="nazwisko">
				<xsl:value-of select="./nazwisko"/>
			</xsl:element>
			<xsl:element name="email">
				<xsl:value-of select="./email"/>
			</xsl:element>
		</xsl:element>
	</xsl:template>
	<!--Sekcja dotycząca sklepu rowerowego -->
	<xsl:template match="//sklep_rowerowy">
		<xsl:element name="sklep_rowerowy">
			<xsl:apply-templates select="rodzaj"/>
			<xsl:apply-templates select="producenci"/>
			<xsl:apply-templates select="stopka"/>
		</xsl:element>
	</xsl:template>
	<!-- Sekcja Rodzaj zawiera w sobie opis i listę rowerów -->
	<xsl:template match="//rodzaj">
		<xsl:element name="rodzaj">
			<xsl:attribute name="Id"><xsl:value-of select="./@Id"/></xsl:attribute>
			<xsl:attribute name="nazwa"><xsl:value-of select="./@nazwa"/></xsl:attribute>
			<xsl:attribute name="liczbaRowerów">
				<xsl:if test="@Id = 'S'">
							<xsl:value-of select="count(/dokument/sklep_rowerowy/rodzaj[@Id='S']/lista_rowerów/rower)"/>
						</xsl:if>
						<xsl:if test="@Id = 'G'">
							<xsl:value-of select="count(/dokument/sklep_rowerowy/rodzaj[@Id='G']/lista_rowerów/rower)"/>
						</xsl:if>
						<xsl:if test="@Id = 'M'">
							<xsl:value-of select="count(/dokument/sklep_rowerowy/rodzaj[@Id='M']/lista_rowerów/rower)"/>
						</xsl:if>	
						<xsl:if test="@Id = 'E'">
							<xsl:value-of select="count(/dokument/sklep_rowerowy/rodzaj[@Id='E']/lista_rowerów/rower)"/>
						</xsl:if>
						<xsl:if test="@Id = 'Z'">
							<xsl:value-of select="count(/dokument/sklep_rowerowy/rodzaj[@Id='Z']/lista_rowerów/rower)"/>
						</xsl:if>	
			</xsl:attribute>
			<xsl:attribute name="średniaWagaRowerów">
				<xsl:if test="@Id = 'S'">
					<xsl:variable name="ilośćRowerów" select="count(/dokument/sklep_rowerowy/rodzaj[@Id='S']/lista_rowerów/rower)"/>
					<xsl:variable name="wagaRowerów" select="sum(/dokument/sklep_rowerowy/rodzaj[@Id='S']/lista_rowerów/rower/waga)"/>
					<xsl:value-of select="$wagaRowerów div $ilośćRowerów"/>
				</xsl:if>
				<xsl:if test="@Id = 'G'">
					<xsl:variable name="ilośćRowerów" select="count(/dokument/sklep_rowerowy/rodzaj[@Id='G']/lista_rowerów/rower)"/>
					<xsl:variable name="wagaRowerów" select="sum(/dokument/sklep_rowerowy/rodzaj[@Id='G']/lista_rowerów/rower/waga)"/>
					<xsl:value-of select="$wagaRowerów div $ilośćRowerów"/>
				</xsl:if>
				<xsl:if test="@Id = 'M'">
					<xsl:variable name="ilośćRowerów" select="count(/dokument/sklep_rowerowy/rodzaj[@Id='M']/lista_rowerów/rower)"/>
					<xsl:variable name="wagaRowerów" select="sum(/dokument/sklep_rowerowy/rodzaj[@Id='M']/lista_rowerów/rower/waga)"/>
					<xsl:value-of select="$wagaRowerów div $ilośćRowerów"/>
				</xsl:if>	
				<xsl:if test="@Id = 'E'">
					<xsl:variable name="ilośćRowerów" select="count(/dokument/sklep_rowerowy/rodzaj[@Id='E']/lista_rowerów/rower)"/>
					<xsl:variable name="wagaRowerów" select="sum(/dokument/sklep_rowerowy/rodzaj[@Id='E']/lista_rowerów/rower/waga)"/>
					<xsl:value-of select="$wagaRowerów div $ilośćRowerów"/>
				</xsl:if>
				<xsl:if test="@Id = 'Z'">
					<xsl:variable name="ilośćRowerów" select="count(/dokument/sklep_rowerowy/rodzaj[@Id='Z']/lista_rowerów/rower)"/>
					<xsl:variable name="wagaRowerów" select="sum(/dokument/sklep_rowerowy/rodzaj[@Id='Z']/lista_rowerów/rower/waga)"/>
					<xsl:value-of select="$wagaRowerów div $ilośćRowerów"/>
				</xsl:if>
			</xsl:attribute>
			<xsl:attribute name="maxWagaRowerów">		
				<xsl:if test="@Id = 'S'">
					<xsl:value-of select="max(/dokument/sklep_rowerowy/rodzaj[@Id='S']/lista_rowerów/rower/waga)"/>		
				</xsl:if>
				<xsl:if test="@Id = 'G'">
					<xsl:value-of select="max(/dokument/sklep_rowerowy/rodzaj[@Id='G']/lista_rowerów/rower/waga)"/>		
				</xsl:if>
				<xsl:if test="@Id = 'M'">
					<xsl:value-of select="max(/dokument/sklep_rowerowy/rodzaj[@Id='M']/lista_rowerów/rower/waga)"/>		
				</xsl:if>	
				<xsl:if test="@Id = 'E'">
					<xsl:value-of select="max(/dokument/sklep_rowerowy/rodzaj[@Id='E']/lista_rowerów/rower/waga)"/>		
				</xsl:if>
				<xsl:if test="@Id = 'Z'">
					<xsl:value-of select="max(/dokument/sklep_rowerowy/rodzaj[@Id='Z']/lista_rowerów/rower/waga)"/>		
				</xsl:if>
			</xsl:attribute>
			<xsl:attribute name="minWagaRowerów">
					<xsl:if test="@Id = 'S'">
					<xsl:value-of select="min(/dokument/sklep_rowerowy/rodzaj[@Id='S']/lista_rowerów/rower/waga)"/>		
				</xsl:if>
				<xsl:if test="@Id = 'G'">
					<xsl:value-of select="min(/dokument/sklep_rowerowy/rodzaj[@Id='G']/lista_rowerów/rower/waga)"/>		
				</xsl:if>
				<xsl:if test="@Id = 'M'">
					<xsl:value-of select="min(/dokument/sklep_rowerowy/rodzaj[@Id='M']/lista_rowerów/rower/waga)"/>		
				</xsl:if>	
				<xsl:if test="@Id = 'E'">
					<xsl:value-of select="min(/dokument/sklep_rowerowy/rodzaj[@Id='E']/lista_rowerów/rower/waga)"/>		
				</xsl:if>
				<xsl:if test="@Id = 'Z'">
					<xsl:value-of select="min(/dokument/sklep_rowerowy/rodzaj[@Id='Z']/lista_rowerów/rower/waga)"/>		
				</xsl:if>
			</xsl:attribute>
			<xsl:element name="opis">
				<xsl:value-of select="./opis"/>
			</xsl:element>

			
			<xsl:apply-templates select="lista_rowerów"/>
		</xsl:element>
	</xsl:template>

	
	
	
	

	<!-- Każda lista rowerów zawiera w sobie rower -->
	<xsl:template match="//lista_rowerów">
		<xsl:element name="lista_rowerów">
			<xsl:apply-templates select="rower"/>
		</xsl:element>
	</xsl:template>
	<!-- Każdy rower zawiera w sobie producenta, nazwę, wage, cenę oraz rok zaprojektowania -->
	<xsl:template match="//rower">
		<xsl:element name="rower">
			<xsl:attribute name="Id"><xsl:value-of select="./@Id"/></xsl:attribute>
			<xsl:attribute name="producent">
				<xsl:apply-templates select="producent"/>
			</xsl:attribute>
		<!--	<xsl:apply-templates select="producent"/> -->
			<xsl:element name="nazwa">
				<xsl:value-of select="./nazwa"/>
			</xsl:element>
			<xsl:element name="waga">
				<xsl:variable name="WagaWartość" select="./waga"/>
				<xsl:attribute name="jednostka"><xsl:value-of select="$WagaWartość/@jednostka"/></xsl:attribute>
				<xsl:value-of select="$WagaWartość"/>
			</xsl:element>
			<xsl:element name="cena">
				<xsl:variable name="CenaWartość" select="./cena"/>
				<xsl:attribute name="waluta"><xsl:value-of select="$CenaWartość/@waluta"/></xsl:attribute>
				<xsl:value-of select="$CenaWartość"/>
	
			</xsl:element>
			<xsl:apply-templates select="RokZaprojektowania"/>
			<xsl:element name="WiekRoweru">
				<xsl:variable name="dzisiejszaData" select="current-dateTime()"/>
				<xsl:variable name="dzisiejszyRok" select="fn:year-from-dateTime($dzisiejszaData)"/>
				<xsl:variable name="wiekRoweru" select="$dzisiejszyRok - ./RokZaprojektowania/@rok"/>
				<xsl:value-of select="$wiekRoweru"/>
			</xsl:element>
		</xsl:element>
	</xsl:template>
	
	<xsl:template match="//nazwa">
		<xsl:element name="nazwa">
			<xsl:value-of select="./nazwa"/>
		</xsl:element>
	</xsl:template>
	<xsl:template match="//cena">
		<xsl:element name="cena">
			<xsl:attribute name="waluta"><xsl:value-of select="./@waluta"/></xsl:attribute>
			<xsl:value-of select="./cena"/>
		</xsl:element>
	</xsl:template>
	<xsl:template match="//RokZaprojektowania">
		<xsl:element name="RokZaprojektowania">
			<xsl:attribute name="rok"><xsl:value-of select="./@rok"/></xsl:attribute>
		</xsl:element>
	</xsl:template>
	<xsl:template match="//producenci">
		<xsl:element name="producenci">
			<xsl:apply-templates select="pochodzenie"/>
		</xsl:element>
	</xsl:template>
	<xsl:template match="//pochodzenie">
		<xsl:element name="pochodzenie">
			<xsl:attribute name="Id"><xsl:value-of select="./@Id"/></xsl:attribute>
			<xsl:attribute name="kraj"><xsl:value-of select="./@kraj"/></xsl:attribute>
			<xsl:attribute name="firma"><xsl:value-of select="./@firma"/></xsl:attribute>
			<xsl:attribute name="iloscRowerow">
				<xsl:if test="@Id = 'kross'">
					<xsl:value-of select="count(/dokument/sklep_rowerowy/rodzaj/lista_rowerów/rower/producent[@idref='kross'])"/>
				</xsl:if>
				<xsl:if test="@Id = 'specialized'">
					<xsl:value-of select="count(/dokument/sklep_rowerowy/rodzaj/lista_rowerów/rower/producent[@idref='specialized'])"/>
				</xsl:if>
				<xsl:if test="@Id = 'trek'">
					<xsl:value-of select="count(/dokument/sklep_rowerowy/rodzaj/lista_rowerów/rower/producent[@idref='trek'])"/>
				</xsl:if>	
				<xsl:if test="@Id = 'legrand'">
					<xsl:value-of select="count(/dokument/sklep_rowerowy/rodzaj/lista_rowerów/rower/producent[@idref='legrand'])"/>
				</xsl:if>		
			</xsl:attribute>
		</xsl:element>
	</xsl:template>

			
	<xsl:key name="producentKEY" match="pochodzenie" use="@Id"/>
	<xsl:template match="@* | node()"/>
	
	<xsl:template match="producent">
		<xsl:copy>
			<xsl:value-of select="key('producentKEY', @idref)/@firma" />
		</xsl:copy>
	</xsl:template>
	
	<xsl:template match="//stopka">
		<xsl:element name="stopka">
			<xsl:attribute name="dataUtworzenia"><xsl:value-of select="./@dataUtworzenia"/></xsl:attribute>
			<xsl:attribute name="dataEdycji"><xsl:value-of select="./@dataEdycji"/></xsl:attribute>
		</xsl:element>
	</xsl:template>
</xsl:stylesheet>
