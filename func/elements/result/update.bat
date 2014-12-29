copy ..\..\..\style\base.css .
saxon func.result.xml ../../../style/element.xsl
wzzip -P -o func.result.zip @func.result.package.txt
wzzip -P -o func.result.use-cases.zip @func.result.use-cases.txt
cd ..
cd ..
saxon func.xml ../style/module.xsl
wzzip -P -o func.zip @func.package.txt
cd ..
saxon modules.xml style/package.xsl
wzzip -P -o all-exslt.zip @package.txt
saxon modules.xml style/xml-package.xsl
wzzip -P -o exslt.zip @xml-package.txt
cd func
cd elements
cd result
