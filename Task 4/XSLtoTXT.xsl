<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0"
                xmlns:xsl="http://www.w3.org/1999/XSL/Transform" 
                xmlns:functx="http://www.functx.com">

    <xsl:import href="http://www.xsltfunctions.com/xsl/functx-1.0-nodoc-2007-01.xsl" />
	<xsl:output method="text" />

	<xsl:template match="text()">
		<xsl:if test="normalize-space(.)">
			<xsl:value-of select="concat(normalize-space(.), '')" />
		</xsl:if>
		<xsl:apply-templates />
	</xsl:template>

	<xsl:template match="/">
		<xsl:text>Dokument tekstowy&#xA;</xsl:text>
		<xsl:apply-templates />
	</xsl:template>
	
	<xsl:template match="sklep_rowerowy">
		<xsl:text>&#xA;</xsl:text>
		<xsl:text>SKLEP ROWEROWY:&#xA;</xsl:text>
		<xsl:apply-templates select="rodzaj" />
		<xsl:text>&#xA;</xsl:text>
		<xsl:apply-templates select="producenci"/>
		<xsl:apply-templates select="stopka"/>
	</xsl:template>
	
	<xsl:template match="rodzaj">
		<xsl:text>&#xA;</xsl:text>
		<xsl:text>Rodzaj:</xsl:text>
		<xsl:value-of select="concat('&#x9;',./@nazwa,'&#xA;')" />
		<xsl:text>&#xA;</xsl:text>
		
		<xsl:text>Opis:</xsl:text>
		<xsl:value-of select="concat('&#x9;',opis, '&#xA;')" />
		<xsl:text>&#xA;</xsl:text>
		
		<xsl:text>Liczba rowerów:</xsl:text>
		<xsl:value-of select="concat('&#x9;&#x9;&#x9;&#x9;',./@liczbaRowerów,'&#xA;')" />
		<xsl:text>&#xA;</xsl:text>
		
		<xsl:text>Średnia waga rowerów:</xsl:text>
		<xsl:value-of select="concat('&#x9;&#x9;',./@średniaWagaRowerów,'&#xA;')" />
		<xsl:text>&#xA;</xsl:text>
		
		<xsl:text>Maksymalna waga rowerów:</xsl:text>
		<xsl:value-of select="concat('&#x9;',./@maxWagaRowerów,'&#xA;')" />
		<xsl:text>&#xA;</xsl:text>
		
		<xsl:text>Minimalna waga rowerów:</xsl:text>
		<xsl:value-of select="concat('&#x9;&#x9;',./@minWagaRowerów,'&#xA;')" />
		<xsl:text>&#xA;</xsl:text>
		
		<xsl:apply-templates select="lista_rowerów" />
		
	</xsl:template>
	
	
	
	<xsl:template match="lista_rowerów">
	<xsl:text>&#x9;Rowery:&#xA;</xsl:text>
		<xsl:apply-templates select="rower"/>
	</xsl:template>
	
	<xsl:template match="rower">
	
		<xsl:text>&#xA;&#x9;&#x9;Id:&#x9;</xsl:text>
		<xsl:value-of select="concat(./@Id,'&#xA;')" />
		<xsl:text>&#xA;</xsl:text>
		
		<xsl:text>&#x9;&#x9;&#x9;Producent:</xsl:text>
		<xsl:value-of select="concat('&#x9;&#x9;&#x9;&#x9;',./@producent,'&#xA;')" />
		<xsl:text>&#xA;</xsl:text>
		
		<xsl:text>&#x9;&#x9;&#x9;Nazwa:</xsl:text>
		<xsl:value-of select="concat('&#x9;&#x9;&#x9;&#x9;&#x9;',nazwa,'&#xA;')" />
		<xsl:text>&#xA;</xsl:text>
		
			
		
		<xsl:text>&#x9;&#x9;&#x9;Waga:</xsl:text>
		<xsl:value-of select="concat('&#x9;&#x9;&#x9;&#x9;&#x9;',waga,' ')" />
		<xsl:apply-templates select="waga"/>
		<xsl:text>&#xA;</xsl:text>		
		
		<xsl:text>&#x9;&#x9;&#x9;Cena:</xsl:text>
		<xsl:value-of select="concat('&#x9;&#x9;&#x9;&#x9;&#x9;',cena,' ')" />
		<xsl:apply-templates select="cena"/>
		<xsl:text>&#xA;</xsl:text>
		
		<xsl:text>&#x9;&#x9;&#x9;Rok Zaprojektowania:</xsl:text>
		<xsl:apply-templates select="RokZaprojektowania"/>
		<xsl:text>&#xA;</xsl:text>
		
		<xsl:text>&#x9;&#x9;&#x9;Wiek roweru:</xsl:text>
		<xsl:value-of select="concat('&#x9;&#x9;&#x9;',WiekRoweru,' ')" />
		<xsl:text>&#xA;</xsl:text>
		
	</xsl:template>
	
	<xsl:template match="waga">
		<xsl:value-of select="./@jednostka" />
		<xsl:text>&#xA;</xsl:text>
	</xsl:template>
	
	<xsl:template match="cena">
		<xsl:value-of select="./@waluta" />
		<xsl:text>&#xA;</xsl:text>
	</xsl:template>
	
	<xsl:template match="RokZaprojektowania">
		<xsl:value-of select="concat('&#x9;',./@rok)" />
		<xsl:text>&#xA;</xsl:text>
	</xsl:template>
	
	<xsl:template match="autorzy">
	<xsl:text>&#xA;AUTORZY:&#xA;</xsl:text>
		<xsl:apply-templates select="autor" />
	</xsl:template>
	
	<xsl:template match="autor">
		<xsl:value-of select="concat('Imie: ',./imię,'&#xA;')" />
		<xsl:value-of select="concat('Nazwisko: ',./nazwisko, '&#xA;')" />
		<xsl:value-of select="concat('Email: ',./email,'&#xA;')" />
		<xsl:value-of select="concat('nr indeksu: ', ./@Indeks,'&#xA;')" />
		<xsl:text>&#xA;</xsl:text>
	</xsl:template>
	
	<xsl:template match="producenci">
		<xsl:apply-templates select="pochodzenie"/>
	</xsl:template>
	
	<xsl:template match="pochodzenie">
		<xsl:value-of select="concat('&#x9;Firma: ', ./@firma,'&#xA;')" />
		<xsl:value-of select="concat('&#x9;Ilość rowerów: ', ./@iloscRowerow,'&#xA;')" />
		<xsl:value-of select="concat('&#x9;Kraj: ', ./@kraj,'&#xA;')" />
		<xsl:text>&#xA;</xsl:text>
	</xsl:template>
	
	<xsl:template match="stopka">
		<xsl:value-of select="concat('Data utworzenia: ', ./@dataUtworzenia,'&#xA;')" />
		<xsl:value-of select="concat('Data edycji: ', ./@dataEdycji,'&#xA;')" />
	</xsl:template>
	
	<xsl:template match="Raport">
	<xsl:text>&#xA;&#xA;RAPORT:&#xA;</xsl:text>
		<xsl:value-of select="concat('&#x9;Ilość producentów: ',./Ilość_producentów,'&#xA;')"/>
		<xsl:value-of select="concat('&#x9;Ilość wszystkich rowerów: ', ./Ilość_wszystkich_rowerów,'&#xA;&#xA;')" />
	
		<xsl:value-of select="concat('&#x9;Ilość rowerów euro: ', ./Ilość_Rowerów_EUR,'&#xA;')" />
		<xsl:value-of select="concat('&#x9;Cena rowerów euro: ', ./Cena_rowerów_euro,' EUR','&#xA;')" />
		<xsl:value-of select="concat('&#x9;Srednia cena rowerów euro: ', ./Średnia_cena_rowerów_EUR,' EUR','&#xA;&#xA;')" />
		
		<xsl:value-of select="concat('&#x9;Ilość rowerów USD: ', ./Ilość_Rowerów_USD,'&#xA;')" />
		<xsl:value-of select="concat('&#x9;Cena rowerów USD: ', ./Cena_rowerów_USD,' USD','&#xA;')" />
		<xsl:value-of select="concat('&#x9;Srednia cena rowerów USD: ', ./Średnia_cena_rowerów_USD,' USD','&#xA;&#xA;')" />
		
		<xsl:value-of select="concat('&#x9;Ilość rowerów PLN: ', ./Ilość_Rowerów_PLN,'&#xA;')" />
		<xsl:value-of select="concat('&#x9;Cena rowerów PLN: ', ./Cena_rowerów_PLN,' PLN','&#xA;')" />
		<xsl:value-of select="concat('&#x9;Srednia cena rowerów PLN: ', ./Średnia_cena_rowerów_PLN,' PLN','&#xA;&#xA;')" />
		
		
		
		<xsl:value-of select="concat('&#x9;Data utworzenia raportu: ',./DataRaportu)"/>
	</xsl:template>
	</xsl:stylesheet>