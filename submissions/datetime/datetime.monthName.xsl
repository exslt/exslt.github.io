<?xml version="1.0" encoding="utf-8"?>
<stylesheet xmlns="http://www.w3.org/1999/XSL/Transform" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" 
xmlns:func="http://exslt.org/functions" 
xmlns:datetime="http://exslt.org/datetime" version="1.0" 
datetime:doc="http://www.exslt.org/datetime"
extension-element-prefixes="datetime">
	
<import href="datetime.monthName.msxslt.xsl"/> 
<func:script language="exslt:javascript" implements-prefix="datetime" src="datetime.monthName.js"/>
</stylesheet>