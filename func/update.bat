copy ..\style\base.css .
saxon func.xml ../style/module.xsl
cd elements
cd function
copy ..\..\..\style\base.css .
saxon func.function.xml ../../../style/element.xsl
wzzip -P -o func.function.zip @func.function.package.txt
wzzip -P -o func.function.use-cases.zip @func.function.use-cases.txt
cd ..
cd ..
cd elements
cd result
copy ..\..\..\style\base.css .
saxon func.result.xml ../../../style/element.xsl
wzzip -P -o func.result.zip @func.result.package.txt
wzzip -P -o func.result.use-cases.zip @func.result.use-cases.txt
cd ..
cd ..
cd elements
cd script
copy ..\..\..\style\base.css .
saxon func.script.xml ../../../style/element.xsl
wzzip -P -o func.script.zip @func.script.package.txt
wzzip -P -o func.script.use-cases.zip @func.script.use-cases.txt
cd ..
cd ..
wzzip -P -o func.zip @func.package.txt
cd ..
saxon modules.xml style/home.xsl
saxon modules.xml style/package.xsl
wzzip -P -o all-exslt.zip @package.txt
saxon modules.xml style/xml-package.xsl
wzzip -P -o exslt.zip @xml-package.txt
cd func
