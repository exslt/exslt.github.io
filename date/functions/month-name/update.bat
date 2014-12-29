copy ..\..\..\style\base.css .
saxon date.month-name.xml ../../../style/function.xsl
wzzip -P -o date.month-name.zip @date.month-name.package.txt
wzzip -P -o date.month-name.use-cases.zip @date.month-name.use-cases.txt
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
cd month-name
