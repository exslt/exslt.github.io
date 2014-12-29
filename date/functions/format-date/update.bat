copy ..\..\..\style\base.css .
saxon date.format-date.xml ../../../style/function.xsl
wzzip -P -o date.format-date.zip @date.format-date.package.txt
wzzip -P -o date.format-date.use-cases.zip @date.format-date.use-cases.txt
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
cd functions
cd format-date
