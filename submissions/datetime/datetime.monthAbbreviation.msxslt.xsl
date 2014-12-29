<?xml version='1.0'?>
<xsl:stylesheet version="1.0"
	xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
	xmlns:msxsl="urn:schemas-microsoft-com:xslt"
	xmlns:datetime="http://www.exslt.org/datetime"
	extension-element-prefixes="datetime">

<msxsl:script language="JavaScript" implements-prefix="datetime">
<![CDATA[
var gsLang = "en";
var gaLang = new Array();
// en 
gaLang["en"] = new Array();
gaLang["en"]["months"] = new Array("January", "February", "March", "April", "May", "June", "July", "August", "September", "October", "November", "December");
gaLang["en"]["shortMonths"] = new Array("Jan", "Feb", "Mar", "Apr", "May", "Jun", "Jul", "Aug", "Sep", "Oct", "Nov", "Dec");
gaLang["en"]["days"] = new Array("Sunday", "Monday", "Tuesday", "Wednesday", "Thursday", "Friday", "Saturday");
gaLang["en"]["shortDays"] = new Array("Sun", "Mon", "Tue", "Wed", "Thu", "Fri", "Sat");
// fr
gaLang["fr"] = new Array();
gaLang["fr"]["months"] = new Array("Janvier", "F&#x00E9;vrier", "Mars", "Avril", "Mai", "Juin", "Juillet", "Ao&#x00FB;t", "Septembre", "Octobre", "Novembre", "D&#x00E9;cembre");
gaLang["fr"]["shortMonths"] = new Array("Jan", "F&#x00E9;v", "Mars", "Avr", "Mai", "Juin", "Juil", "Ao&#x00FB;t", "Sept", "Oct", "Nov", "D&#x00E9;c");
gaLang["fr"]["days"] = new Array("Dimanche", "Lundi", "Mardi", "Mercredi", "Jeudi", "Vendredi", "Samedi");
gaLang["fr"]["shortDays"] = new Array("Dim", "Lun", "Mar", "Mer", "Jeu", "Ven", "Sam");



var gaMonthCnt = new Array(31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31);
var gaMonthCntL = new Array(31, 29, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31);
function _isLeap(y){return ( ((y%4==0)&(y%100!=0))|(y%400==0) );}
function _dayOfWeek(y,d){return ( ((y-1)+Math.floor((y-1)/4)-Math.floor((y-1)/100)+Math.floor((y-1)/400)+d)%7);}
function _dayInYear(y,m,d){return (m==0?d:eval( (_isLeap(y)?gaMonthCntL.slice(0,m).join("+"):gaMonthCnt.slice(0,m).join("+")) )+(d*1) );}

function formatDate(date, format, dateF, ctx){
	var oDate;
	var re;
	var retString = "";
	if ((oDate = _validDate(date, "xs:dateTime")) ||
		(oDate = _validDate(date, "xs:date")) ||
		(oDate = _validDate(date, "xs:time")) ||
		(oDate = _validDate(date, "xs:gYearMonth")) ||
		(oDate = _validDate(date, "xs:gYear")) ||
		(oDate = _validDate(date, "xs:gMonthDay")) ||
		(oDate = _validDate(date, "xs:gMonth")) ||
		(oDate = _validDate(date, "xs:gDay"))
		){
		for (var i=0; i < format.length;){
			var s = i;
			switch(format.substr(i, 1)){
				case "G"://        era designator          (Text)              AD
					while (format.substr(i, 1)=="G"){i++;}
					if (oDate.getFullYear() < 0){
						retString += "BC";
					}else{
						retString += "AD";
					}
					break;
				case "y"://        year                    (Number)            1996
					while (format.substr(i, 1)=="y"){i++;}
					if (i-s > 2){
						retString += oDate.getFullYear();
					}else{
						retString += oDate.getFullYear().toString().substring(4-(i-s));
					}
					break;
				case "M"://        month in year           (Text &amp; Number)     July &amp; 07
					while (format.substr(i, 1)=="M"){i++;}
					if (i-s <= 2){
						retString += pad(oDate.getMonth()+1);
					}else{
						retString += _monthName(oDate.getMonth(), dateF, ctx);
					}
					break;
				case "d"://        day in month            (Number)            10
					while (format.substr(i, 1)=="d"){i++;}
					retString += pad(oDate.getDate());
					break;
				case "h"://        hour in am/pm (1~12)    (Number)            12
					while (format.substr(i, 1)=="h"){i++;}
					if (oDate.getHours() > 12){
						retString += pad(oDate.getHours()-12);
					}else{
						retString += pad(oDate.getHours());
					}
					break;
				case "H"://        hour in day (0~23)      (Number)            0
					while (format.substr(i, 1)=="H"){i++;}
					retString += oDate.getHours();
					break;
				case "m"://        minute in hour          (Number)            30
					while (format.substr(i, 1)=="m"){i++;}
					retString += pad(oDate.getMinutes());
					break;
				case "s"://        second in minute        (Number)            55
					while (format.substr(i, 1)=="s"){i++;}
					retString += pad(oDate.getMinutes());
					break;
				case "S"://        millisecond             (Number)            978
					while (format.substr(i, 1)=="S"){i++;}
					retString += oDate.getMilliseconds();
					break;
				case "E"://        day in week             (Text)              Tuesday
					while (format.substr(i, 1)=="E"){i++;}
					retString += dayInWeek(oDate, dateF, ctx);
					break;
				case "D"://        day in year             (Number)            189
					while (format.substr(i, 1)=="D"){i++;}
					retString += _dayInYear(oDate.getFullYear(), oDate.getMonths(), oDate.getDate());
					break;
				case "F"://        day of week in month    (Number)            2 (2nd Wed in July)
					while (format.substr(i, 1)=="F"){i++;}
					retString += dayOfWeekInMonth(oDate, dateF, ctx);
					break;
				case "w"://        week in year            (Number)            27
					while (format.substr(i, 1)=="w"){i++;}
					retString += weekInYear(oDate, dateF, ctx);
					break;
				case "W"://        week in month           (Number)            2
					while (format.substr(i, 1)=="W"){i++;}
					retString += weekInMonth(oDate, dateF, ctx);
					break;
				case "a"://        am/pm marker            (Text)              PM
					while (format.substr(i, 1)=="a"){i++;}
					if (oDate.getHours() > 12 ){
						retString += "PM"
					}else{
						retString += "AM"
					}
					break;
				case "k"://        hour in day (1~24)      (Number)            24
					while (format.substr(i, 1)=="k"){i++;}
					retString += oDate.getHours();
					break;
				case "K"://        hour in am/pm (0~11)    (Number)            0
					while (format.substr(i, 1)=="K"){i++;}
					if (oDate.getHours() > 12){
						retString += oDate.getHours()-12;
					}else{
						retString += oDate.getHours();
					}
					break;
				case "z"://        time zone               (Text)              Pacific Standard Time
				
				
				
					while (format.substr(i, 1)=="z"){i++;}
					var tzo = oDate.getTimezoneOffset();
					retString += (tzo < 0?"-":"+") + pad(Math.abs(tzo / 60)) + ":" + pad(tzo % 60);
 					break;
 				case "'"://        escape for text         (Delimiter)
 					if (format.substr(i+1, 1) == "'"){
 						i++;
 						while (format.substr(i, 1)=="'"){i++;}
 						retString += "'";
 					}else{
 						i++;
 						while (format.substr(i, 1)!="'"){retString += format.substr(i, 1);i++;}
 						i++;
 					}
 					break;
				default:
					retString += format.substr(i, 1);
					i++;
					break;
			}
		}
	}
	return retString;
}
function parseDate(date, inFormat, dfName, ctx){//0001
	var oDate;
	if (inFormat == ""){
		if ((oDate = _validDate(date, "xs:dateTime")) ||
			(oDate = _validDate(date, "xs:date")) ||
			(oDate = _validDate(date, "xs:time")) ||
			(oDate = _validDate(date, "xs:gYearMonth")) ||
			(oDate = _validDate(date, "xs:gYear")) ||
			(oDate = _validDate(date, "xs:gMonthDay")) ||
			(oDate = _validDate(date, "xs:gMonth")) ||
			(oDate = _validDate(date, "xs:gDay"))
			){
			return _formatDate(oDate, "xs:dateTime");
		}
	}else{
		if (oDate = _validDate(date, inFormat)){
			return _formatDate(oDate, "xs:dateTime", dfName, ctx);
		}
	}
}

function dateTime(){//must be UTC/Z
	var oDate = new Date();
	return _formatDate(oDate, "xs:dateTime");
}

function date(){//
	if (arguments.length > 0){
		var oDate;
		if (oDate = _validDate(arguments[0], "xs:dateTime"))
			return _formatDate(oDate, "xs:date");
	}else
		return _formatDate(new Date(), "xs:date");
	return '';
}

function time(){//
	if (arguments.length > 0){
		var oDate;
		if (oDate = _validDate(arguments[0], "xs:dateTime"))
			return _formatDate(oDate, "xs:time");
	}else
		return _formatDate(new Date(), "xs:time");
	return '';
}

function year(){//
	if (arguments.length > 0){
		var oDate;
		if ((oDate = _validDate(arguments[0], "xs:dateTime")) ||
			(oDate = _validDate(arguments[0], "xs:date")) ||
			(oDate = _validDate(arguments[0], "xs:gYearMonth")) ||
			(oDate = _validDate(arguments[0], "xs:gYear"))
		    )
			return _formatDate(oDate, "xs:gYear");
	}else
		return _formatDate(new Date(), "xs:gYear");
	return '';
}

function leapYear(){
	if (arguments.length > 0){
		var oDate;
		if ((oDate = _validDate(arguments[0], "xs:dateTime")) ||
			(oDate = _validDate(arguments[0], "xs:date")) ||
			(oDate = _validDate(arguments[0], "xs:gYearMonth")) ||
			(oDate = _validDate(arguments[0], "xs:gYear"))
		    )
			return _isLeap(oDate.getFullYear);
	}else
		return _isLeap(new Date().getFullYear());
	return '';
}

function monthInYear(){//
	if (arguments.length > 0){
		var oDate;
		if ((oDate = _validDate(arguments[0], "xs:dateTime")) ||
			(oDate = _validDate(arguments[0], "xs:date")) ||
			(oDate = _validDate(arguments[0], "xs:gYearMonth")) ||
			(oDate = _validDate(arguments[0], "xs:gYear"))
		    )
			return _formatDate(oDate, "xs:gMonth");
	}else
		return _formatDate(new Date(), "xs:gMonth");
	return '';
}

function monthName(){//
	if (arguments.length > 0){
		var oDate;
		if ((oDate = _validDate(arguments[0], "xs:dateTime")) ||
			(oDate = _validDate(arguments[0], "xs:date")) ||
			(oDate = _validDate(arguments[0], "xs:gYearMonth")) ||
			(oDate = _validDate(arguments[0], "xs:gYear"))
		    )
			return _monthName(_formatDate(oDate, "xs:gMonth"), arguments[1], arguments[1]);
	}else
		return _monthName(_formatDate(new Date(), "xs:gMonth"), arguments[1],  arguments[2]);
	return '';
}
function _monthName(num, dfName, ctx){//
	if (ctx != null){
		var nodes = ctx.nextNode.selectNodes(
			"//*[local-name()='date-format' and namespace-uri()='http://exslt.org/dates-and-times' and @name='" + dfName +"' ]" +
			"/*[local-name()='months' and namespace-uri()='http://exslt.org/dates-and-times']" +
			"/*[local-name()='month' and namespace-uri()='http://exslt.org/dates-and-times']/text()");
		if (nodes != null)
			return nodes[num].nodeValue;
		else
			return '';
		return month[num-1];
	}else
		return gaLang[gsLang]["months"][num-1];
}
function monthAbbreviation(){//
	if (arguments.length > 0){
		var oDate;
		if ((oDate = _validDate(arguments[0], "xs:dateTime")) ||
			(oDate = _validDate(arguments[0], "xs:date")) ||
			(oDate = _validDate(arguments[0], "xs:gYearMonth")) ||
			(oDate = _validDate(arguments[0], "xs:gYear"))
		    )
			return _monthAbbreviation(_formatDate(oDate, "xs:gMonth"), arguments[1], arguments[2]);
	}else
		return _monthAbbreviation(_formatDate(new Date(), "xs:gMonth"), arguments[1], arguments[2]);
	return '';
}
function _monthAbbreviation(num, dfName, ctx){//
	if (ctx != null){
		var nodes = ctx.nextNode.selectNodes(
			"//*[local-name()='date-format' and namespace-uri()='http://exslt.org/dates-and-times' and @name='" + dfName +"' ]" +
			"/*[local-name()='months' and namespace-uri()='http://exslt.org/dates-and-times']" +
			"/*[local-name()='month' and namespace-uri()='http://exslt.org/dates-and-times']/@abbr");
		if (nodes != null)
			return nodes[num].nodeValue;
		else
			return '';
	}else{ //we could try local
		return gaLang[gsLang]["shortMonths"][num-1];
	}
}
function weekInYear(){
	if (arguments.length > 0){
		var oDate;
		if ((oDate = _validDate(arguments[0], "xs:dateTime")) ||
			(oDate = _validDate(arguments[0], "xs:date"))
			)
			return _weekInYear(oDate, arguments[1], arguments[2]);
	}else 
		return _weekInYear(new Date());
	return '';
}
function _weekInYear(oDate, dfName, ctx){
	var fdow = 0;
	if (ctx != null){
		var nodes = ctx.nextNode.selectSingleNode(
			"//*[local-name()='date-format' and namespace-uri()='http://exslt.org/dates-and-times' and @name='" + dfName +"' ]" +
			"/@first-day-of-week");
		if (nodes != null)
			fdow = nodes.nodeValue;
		return Math.ceil(_dayInYear(oDate.getFullYear(), oDate.getMonth(), oDate.getDate()-fdow) / 7);
	}else
		return Math.ceil(_dayInYear(oDate.getFullYear(), oDate.getMonth(), oDate.getDate()) / 7);
}

function weekInMonth(){
	if (arguments.length > 0){
		var oDate;
		if ((oDate = _validDate(arguments[0], "xs:dateTime")) ||
			(oDate = _validDate(arguments[0], "xs:date"))
			)
			return _weekInMonth(oDate, arguments[1], arguments[2]);
	}else
		return _weekInMonth(new Date(), arguments[1], arguments[2]);
	return '';	
}
function _weekInMonth(oDate, dfName, ctx){
	var fdow = 0;
	if (ctx != null){
		var nodes = ctx.nextNode.selectSingleNode(
			"//*[local-name()='date-format' and namespace-uri()='http://exslt.org/dates-and-times' and @name='" + dfName +"' ]" +
			"/@first-day-of-week");
		if (nodes != null)
			fdow = nodes.nodeValue;
	}
	var f = new Date(oDate);
	f.setDate(1)
	var fd = f.getDay()-1;
	var dt = oDate.getDate() + fd - fdow;
	return Math.floor((dt)/7)+1;
}
function dayInYear(){
	if (arguments.length > 0){
		var oDate;
		if ((oDate = _validDate(arguments[0], "xs:dateTime")) ||
			(oDate = _validDate(arguments[0], "xs:date"))
			)
			return _formatDate(oDate, "xs:gDay");
	}else{
		var oDate = new Date()
		return _dayInYear(oDate.getFullYear(), oDate.getMonth(), oDate.getDate());
	}
	return '';
}

function dayInMonth(){//
	if (arguments.length > 0){
		var oDate;
		if ((oDate = _validDate(arguments[0], "xs:dateTime")) ||
			(oDate = _validDate(arguments[0], "xs:date")) ||
			(oDate = _validDate(arguments[0], "xs:gYearMonth")) ||
			(oDate = _validDate(arguments[0], "xs:gDay"))
		    )
			return _formatDate(oDate, "xs:gDay");
	}else
		return _formatDate(new Date(), "xs:gDay");
	return '';
}

function dayOfWeekInMonth(){
	if (arguments.length > 0){
		var oDate;
		if ((oDate = _validDate(arguments[0], "xs:dateTime")) ||
			(oDate = _validDate(arguments[0], "xs:date"))
			)
			return _dayOfWeekInMonth(oDate, arguments[1], arguments[2]);
	}else
		return _dayOfWeekInMonth(new Date(), arguments[1], arguments[2]);
	return '';	
}
function _dayOfWeekInMonth(oDate, dateF, ctx){
	var fdow = 0;
	if (ctx != null){
		var nodes = ctx.nextNode.selectSingleNode(
			"//*[local-name()='date-format' and namespace-uri()='http://exslt.org/dates-and-times' and @name='" + dfName +"' ]" +
			"/@first-day-of-week");
		if (nodes != null)
			fdow = nodes.nodeValue;
	}
	if (fdow > (oDate.getDay()-1))
		return Math.floor((oDate.getDate())/7);
	else
		return Math.floor((oDate.getDate())/7) + 1;
}
function dayInWeek(){//
	if (arguments.length > 0){
		var oDate;
		if ((oDate = _validDate(arguments[0], "xs:dateTime")) ||
		    (oDate = _validDate(arguments[0], "xs:date"))
		   )
			return pad(oDate.getDay());
	}else
		return pad(new Date().getDay());
	return '';
}

function dayName(){

	if (arguments.length > 0){
		var oDate;
		if ((oDate = _validDate(arguments[0], "xs:dateTime")) ||
		    (oDate = _validDate(arguments[0], "xs:date"))
		   )
			return _dayName(oDate.getDay(), arguments[1], arguments[2]);
	}else
		return _dayName(new Date().getDay(), arguments[1], arguments[2]);
	return '';
}







function _dayName(num, dfName, ctx){
	if (ctx != null){
		var nodes = ctx.nextNode.selectNodes(
			"//*[local-name()='date-format' and namespace-uri()='http://exslt.org/dates-and-times' and @name='" + dfName +"' ]" +
			"/*[local-name()='days' and namespace-uri()='http://exslt.org/dates-and-times']" +
			"/*[local-name()='day' and namespace-uri()='http://exslt.org/dates-and-times']/text()");
		if (nodes != null)
			return nodes[num-1].nodeValue;
		else
			return '';
	}else
		return gaLang[gsLang]["days"][num];
}

function dayAbbreviation(){
	if (arguments.length > 0){
		var oDate;
		if ((oDate = _validDate(arguments[0], "xs:dateTime")) ||
		    (oDate = _validDate(arguments[0], "xs:date"))
		   )
			return _dayAbbreviation(oDate.getDay(), arguments[1], arguments[2]);
	}else
		return _dayAbbreviation(new Date().getDay(), arguments[1], arguments[2]);
	return '';
}

function _dayAbbreviation(num, dfName, ctx){
	if (ctx != null){
		var nodes = ctx.nextNode.selectNodes(
			"//*[local-name()='date-format' and namespace-uri()='http://exslt.org/dates-and-times' and @name='" + dfName +"' ]" +
			"/*[local-name()='days' and namespace-uri()='http://exslt.org/dates-and-times']" +
			"/*[local-name()='day' and namespace-uri()='http://exslt.org/dates-and-times']/@abbr");
		if (nodes != null)
			return nodes[num-1].nodeValue;
		else
			return '';
	}else{ //we could try local
		return gaLang[gsLang]["shortDays"][num];
	}
}

function hourInDay(){//
	if (arguments.length > 0){
		var oDate;
		if ((oDate = _validDate(arguments[0], "xs:dateTime")) ||
		    (oDate = _validDate(arguments[0], "xs:time"))
		   )
			return pad(oDate.getHours);
	}else
		return pad(new Date().getHours());
	return '';
}

function minuteInHour(){//
	if (arguments.length > 0){
		var oDate;
		if ((oDate = _validDate(arguments[0], "xs:dateTime")) ||
		    (oDate = _validDate(arguments[0], "xs:time"))
		   )
			return pad(oDate.getMinutes);
	}else
		return pad(new Date().getMinutes());
	return '';
}

function secondInMinute(){//
	if (arguments.length > 0){
		var oDate;
		if ((oDate = _validDate(arguments[0], "xs:dateTime")) ||
		    (oDate = _validDate(arguments[0], "xs:time"))
		   )
			return pad(oDate.getSeconds);
	}else
		return pad(new Date().getSeconds());
	return '';
}

function difference(){
	if (((d1 = _validDate(arguments[0], "xs:dateTime")) ||
		 (d1 = _validDate(arguments[0], "xs:date")) ||
		 (d1 = _validDate(arguments[0], "xs:gYearMonth")) ||
		 (d1 = _validDate(arguments[0], "xs:gYear"))
		) &&
		((d2 = _validDate(arguments[1], "xs:dateTime")) ||
		 (d2 = _validDate(arguments[1], "xs:date")) ||
		 (d2 = _validDate(arguments[1], "xs:gYearMonth")) ||
		 (d2 = _validDate(arguments[1], "xs:gYear"))
		 )
		){
		var diffMil = d1.valueOf() - d2.valueOf();
		return _formatDuration(diffMil);
	}
	return Number.NaN;
}

function add(){//
	var d1,d2;
	if (((d1 = _validDate(arguments[0], "xs:dateTime")) ||
		 (d1 = _validDate(arguments[0], "xs:date")) ||
		 (d1 = _validDate(arguments[0], "xs:gYearMonth")) ||
		 (d1 = _validDate(arguments[0], "xs:gYear"))
		) && 
		(d2 = _validDuration(arguments[1]))){
		return _formatDate(d2.addDate(d1), "xs:dateTime");
	}
	return Number.NaN;
}

function addDuration(duration1, duration2){
	if ((d1 = _validDuration(duration1)) && (d2 = _validDuration(duration2))){
		return _formatDuration(d1.addDuration(d2));
	}
	return Number.NaN;
}

function sum(){

}

function seconds(){//
	if (arguments.length > 0){
		var oDate;
		if ((oDate = _validDate(arguments[0], "xs:dateTime")) ||
			(oDate = _validDate(arguments[0], "xs:date")) ||
			(oDate = _validDate(arguments[0], "xs:gYearMonth")) ||
			(oDate = _validDate(arguments[0], "xs:gYear"))
			)
			return oDate.valueOf()/1000;
		else 
			if (oDate = _validDuration(arguments[0]))
				return oDate.Seconds();
		return Number.NaN;
	}else
		return new Date().valueOf()/1000;//current local date/time
}

function duration(){
	var oDate;
	if (arguments.length > 0){
		if (oDate = _validDuration(arguments[0]))
			return _formatDuration(oDate);
		else
			return '';
	}else
		return _formatDuration(seconds() * 1000);
}

function _validDate(date, format){
	var parts;
	var oDate = new Date(-62135596800000); // Mon Jan 1 00:00:00 UTC 1
	switch(format){
		case "xs:dateTime": //(CCYY-MM-DDThh:mm:ss)
			var re = new RegExp("([0-9]{4})-([0-9]{2})-([0-9]{2})(T([0-9]{2})(:([0-9]{2})(:([0-9]{2}))?)?)?(Z)?([\+\-][0-9]{2}:[0-9]{2})?");
			if (parts=re.exec(date)){
				if (parts[10] == "Z"){
					oDate.setFullYear(parts[1], parts[2]-1, parts[3]);
					oDate.setHours(parts[5], parts[7], parts[9]);
					oDate.setMinutes(oDate.getMinutes()-oDate.getTimezoneOffset())
					return oDate;
				}else{
					oDate.setFullYear(parts[1], parts[2]-1, parts[3]);
					oDate.setHours(parts[5], parts[7], parts[9]);
					return oDate;
				}
			}
			break;
		case "xs:date": //(CCYY-MM-DD) 
			var re = new RegExp("([0-9]{4})-([0-9]{2})-([0-9]{2})");
			if (parts=re.exec(date)){
				oDate.setFullYear(parts[1], parts[2]-1, parts[3]);
				return oDate;
			}
			break;
		case "xs:time": //(hh:mm:ss)
			var re = new RegExp("([0-9]{2})(:([0-9]{2})(:([0-9]{2}))?)?(Z)?");
			if (parts=re.exec(date)){
				if (parts[9] == "Z"){
					oDate.setHours(parts[1], parts[3], parts[5]);
					oDate.setMinutes(oDate.getMinutes()+oDate.getTimezoneOffset())
					return oDate;
				}else{
					oDate.setHours(parts[1], parts[3], parts[5]);
					return oDate;
				}
			}
			break;
		case "xs:gYearMonth": //(CCYY-MM)
			var re = new RegExp("([0-9]{4})-([0-9]{2})");
			if (parts=re.exec(date)){
				oDate.setFullYear(parts[1], parts[2]-1);
				return oDate;
			}
			break;
		case "xs:gYear": //(CCYY)
			var re = new RegExp("([0-9]{4})");
			if (parts=re.exec(date)){
				oDate.setFullYear(parts[1]);
				return oDate;
			}
			break;
		case "xs:gMonthDay": //(--MM-DD)
			var re = new RegExp("--([0-9]{2})-([0-9]{2})");
			if (parts=re.exec(date)){
				oDate.setMonth(parts[1]-1, parts[2]);
				return oDate;
			}
			break;
		case "xs:gMonth": //(--MM--)
			var re = new RegExp("--([0-9]{2})--");
			if (parts=re.exec(date)){
				oDate.setMonth(parts[1]-1);
				return oDate;
			}
			break;
		case "xs:gDay": //(---DD)
			var re = new RegExp("--([0-9]{2})");
			if (parts=re.exec(date)){
				oDate.setDate(parts[1]);
				return oDate;
			}
			break;
		default:
			// format string 
			var Z = "";
			for (var i=0,j=0; i < format.length & oDate.toString() != "NaN";){
				var s = j;
				switch(format.substr(i, 1)){
					case "G"://        era designator          (Text)              AD
						while (format.substr(i, 1)=="G"){i++;j++;}
						j++;
						if (date.substr(s,j-s) == "BC" || date.substr(s,j-s) == "bc"){
							oDate.setFullYear(-oDate.getFullYear);
						}
						break;
					case "y"://        year                    (Number)            1996
						while (format.substr(i, 1)=="y"){i++;j++;}
						oDate.setYear(date.substr(s,j-s));
						break;
					case "M"://        month in year           (Text &amp; Number)     July &amp; 07
						while (format.substr(i, 1)=="M"){i++;j++;}
						if (i-s <= 2){
							oDate.setMonth(date.substr(s,j-s)-1);
						}else{
							oDate.setMonth(_monthNumber(date.substr(s,j-s)));
						}
						break;
					case "d"://        day in month            (Number)            10
						while (format.substr(i, 1)=="d"){i++;j++;}
						oDate.setDate(date.substr(s,j-s));
						break;
					case "h"://        hour in am/pm (1~12)    (Number)            12
						while (format.substr(i, 1)=="h"){i++;j++;}
						oDate.setHours(date.substr(s,j-s));
						break;
					case "H"://        hour in day (0~23)      (Number)            0
						while (format.substr(i, 1)=="H"){i++;j++;}
						oDate.setHours(date.substr(s,j-s));
						break;
					case "m"://        minute in hour          (Number)            30
						while (format.substr(i, 1)=="m"){i++;j++;}
						oDate.setMinutes(date.substr(s,j-s));
						break;
					case "s"://        second in minute        (Number)            55
						while (format.substr(i, 1)=="s"){i++;j++;}
						oDate.setSeconds(date.substr(s,j-s));
						break;
					case "S"://        millisecond             (Number)            978
						while (format.substr(i, 1)=="S"){i++;j++;}
						oDate.setMilliseconds(date.substr(s,j-s));
						break;
					case "E"://        day in week             (Text)              Tuesday
						while (format.substr(i, 1)=="E"){i++;j++;}
						while (format.substr(i+1, 1)!=date.substr(j, 1)){j++;}
						break;
					case "D"://        day in year             (Number)            189
						while (format.substr(i, 1)=="D"){i++;j++;}
						while (format.substr(i+1, 1)!=date.substr(j, 1)){j++;}
						break;
					case "F"://        day of week in month    (Number)            2 (2nd Wed in July)
						while (format.substr(i, 1)=="F"){i++;j++;}
						break;
					case "w"://        week in year            (Number)            27
						while (format.substr(i, 1)=="w"){i++;j++;}
						while (format.substr(i+1, 1)!=date.substr(j, 1)){j++;}
						break;
					case "W"://        week in month           (Number)            2
						while (format.substr(i, 1)=="W"){i++;j++;}
						while (format.substr(i+1, 1)!=date.substr(j, 1)){j++;}
						break;
					case "a"://        am/pm marker            (Text)              PM
						while (format.substr(i, 1)=="a"){i++;j++;}
						j++;
						if (date.substr(s,j-s) == "PM" || date.substr(s,j-s) == "pm")
							oDate.setHours(oDate.getHours()+12);
						break;
					case "k"://        hour in day (1~24)      (Number)            24
						while (format.substr(i, 1)=="k"){i++;j++;}
						oDate.setHours(date.substr(s,j-s));
						break;
					case "K"://        hour in am/pm (0~11)    (Number)            0
						while (format.substr(i, 1)=="K"){i++;j++;}
						oDate.setHours(date.substr(s,j-s));
						break;
					case "z"://        time zone               (Text)              Pacific Standard Time
						while (format.substr(i, 1)=="z"){i++;j++;}
						while (format.substr(i+1, 1)!=date.substr(j, 1)){j++;}
						//oDate.setMinutes(oDate.getMinutes() - oDate.getTimezoneOffset());
						Z = date.substr(s,j-s);
 						break;
 					case "'"://        escape for text         (Delimiter)
 						if (format.substr(i+1, 1) == "'"){
 							i+=2;
 						}else{
 							i++;
 							while (format.substr(i, 1)!="'"){i++;j++;}
 							i++;
 						}
 						break;
					default:
						if (format.substr(i, 1) != date.substr(j, 1)){
							return false;
						}
						i++;j++;
						break;
				}
			}
			if (oDate.toString() != "NaN"){
				if (Z != ""){
					var re = new RegExp("([\+\-][0-9]{2})?:([0-9]{2})?");
					if (parts=re.exec(Z)){
						// check GMT/BST
						var tzo = parts[1]*60 + parts[2];
						//if (tzo != new Date().getTimezoneOffset()){
						//	oDate.setMinutes(oDate.getMinutes() - (oDate.getTimezoneOffset() - tzo))
						//}
					}
				}
				return oDate;
			}
			break;
	}
	return false;
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
			return pad(oDate.getHours()) + ":" + pad(oDate.getMinutes()) + ":" + pad(oDate.getSeconds()) + (tzo < 0?" -":" +") + pad(Math.abs(tzo/60)) + ":" + pad(tzo % 60);
			break;
		case "xs:gYearMonth": //(CCYY-MM)
			return oDate.getFullYear() + "-" + pad(oDate.getMonth()+1);
			break;
		case "xs:gYear": //(CCYY)
			return oDate.getFullYear();
			break;
		case "xs:gMonthDay": //(--MM-DD)
			return pad(oDate.getMonth()) + "-" + pad(oDate.getDate());
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

function _validDuration(d){
	var parts,parts1,re = new RegExp("([\+\-])?P(([0-9]+)Y)?(([0-9]+)M)?(([0-9]+)D)?(T(([0-9]+)H)?(([0-9]+)M)?((([0-9]+)(\.([0-9]+))?)S)?)?");
	if (parts = re.exec(d)){
		if (/T$/.exec(d))
			return Number.NaN;
		return new Duration(parts[1], parts[3], parts[5], parts[7], parts[10], parts[12], parts[15], parts[17]);
	}
	return Number.NaN;
}
function Duration(pm, years, months, days, hours, minutes, seconds, fraction){
	this.pm = pm;
	this.years = years*1;
	this.months = months*1;
	this.days = days*1;
	this.hours = hours*1;
	this.minutes = minutes*1;
	this.seconds = seconds*1;
	this.fraction = fraction*1;
	this.addDate = function(d){d.setFullYear(eval(this.pm+this.years)+d.getFullYear(),eval(this.pm+this.months)+d.getMonth(),eval(this.pm+this.days)+d.getDate());d.setHours(eval(this.pm+this.hours)+d.getHours(),eval(this.pm+this.minutes)+d.getMinutes(),eval(this.pm+this.seconds)+d.getSeconds());d.setMilliseconds(eval(this.pm+this.fraction*100));return d;}
	this.addDuration = function(d){this.years += eval(d.pm+d.years);this.months += eval(d.pm+d.months);this.days += eval(d.pm+d.days);this.hours += eval(d.pm+d.hours);this.minutes += eval(d.pm+d.minutes);this.seconds += eval(d.pm+d.seconds);this.fraction += eval(d.pm+d.fraction);return this;}
	this.Seconds = function(){if (this.years || this.months)return Number.NaN;return this.days*giDayMill + this.hours*giHourMill + this.minutes*giMinMill + this.seconds*giSecMill;}
}
var giYearMill = 31536000000;
var giMonthMill = 2592000000;
var giDayMill = 86400000;
var giHourMill = 3600000;
var giMinMill = 60000;
var giSecMill = 1000;
function _formatDuration(du){
	var pm = du.pm;
	var y = du.years;
	var m = du.months;
	var d = du.days;
	var h = du.hours;
	var n = du.minutes;
	var s = du.seconds;
	var l = du.milliseconds;
	
	return pm + "P" + 
			(y!=0?y + "Y":'') + 
			(m!=0?m + "M":'') + 
			(d!=0?d + "D":'') + 
			(h+n+s+l!=0?"T":'') +
			(h!=0?h + "H":'') + 
			(n!=0?n + "M":'') + 
			(s!=0&&l!=0?s:s + "S") +
			(l!=0?"."+l+"S":'');
}

]]>
</msxsl:script>

</xsl:stylesheet>