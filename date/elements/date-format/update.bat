copy ..\..\..\style\base.css .
saxon date.date-format.xml ../../../style/element.xsl
wzzip -P -o date.date-format.zip @date.date-format.package.txt
wzzip -P -o date.date-format.use-cases.zip @date.date-format.use-cases.txt
cd ..
cd ..
saxon date.xml ../style/module.xsl
wzzip -P -o date.zip @date.package.txt
cd ..
saxon modules.xml style/package.xsl
wzzip -P -o all-exslt.zip @package.txt
saxon modules.xml style/xml-package.xsl
wzzip -P -o exslt.zip @xml-package.txt
cd date
cd elements
cd date-format
