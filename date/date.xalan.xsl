<?xml version="1.0"?>
<?xml-stylesheet type="text/xsl" href="" ?>
<xsl:stylesheet version="1.0"
                xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
                xmlns:date="http://exslt.org/dates-and-times"
                xmlns:lxslt="http://xml.apache.org/xslt"
                extension-element-prefixes="date">

<xsl:template match="/">
  <xsl:message><xsl:value-of select="date:date-time()" /></xsl:message>
</xsl:template>

<lxslt:component prefix="date" functions="date-time">
<lxslt:script lang="javascript">
<![CDATA[
function dateTime(){//must be UTC/Z
	var oDate = new Date();
	return _formatDate(oDate, "xs:dateTime");
}

function _formatDate(oDate, format){
	if (oDate == Number.NaN)return Number.NaN;
	switch(format){
		case "xs:dateTime": //(CCYY-MM-DDThh:mm:ss)
			var tzo = oDate.getTimezoneOffset(); 
			return oDate.getFullYear() + "-" + pad(oDate.getMonth()+1) + "-" + pad(oDate.getDate()) + "T" +
				   pad(oDate.getHours()) + ":" + pad(oDate.getMinutes()) + ":" + pad(oDate.getSeconds()) + (tzo < 0?"-":"+") + pad(Math.abs(tzo/60)) + ":" + pad(tzo % 60);
			break;
		case "xs:date": //(CCYY-MM-DD) 
			return oDate.getFullYear() + "-" + pad(oDate.getMonth()+1) + "-" + pad(oDate.getDate());
			break;
		case "xs:time": //(hh:mm:ss)
			var tzo = oDate.getTimezoneOffset(); 
			return pad(oDate.getHours()) + ":" + pad(oDate.getMinutes()) + ":" + pad(oDate.getSeconds()) + (tzo < 0?"-":"+") + pad(Math.abs(tzo/60)) + ":" + pad(tzo % 60);
			break;
		case "xs:gYearMonth": //(CCYY-MM)
			return oDate.getFullYear() + "-" + pad(oDate.getMonth()+1);
			break;
		case "xs:gYear": //(CCYY)
			return oDate.getFullYear();
			break;
		case "xs:gMonthDay": //(--MM-DD)
			return pad(oDate.getMonth() + 1) + "-" + pad(oDate.getDate());
			break;
		case "xs:gMonth": //(--MM--)
			return pad(oDate.getMonth()+1);
			break;
		case "xs:gDay": //(---DD)
			return pad(oDate.getDate());
			break;
	}
	return false;
}

function pad(v){
	return (v<10?"0"+v:v);
}
]]>
</lxslt:script>
</lxslt:component>

</xsl:stylesheet>