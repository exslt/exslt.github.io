copy ..\..\..\style\base.css .
saxon date.month-in-year.xml ../../../style/function.xsl
wzzip -P -o date.month-in-year.zip @date.month-in-year.package.txt
wzzip -P -o date.month-in-year.use-cases.zip @date.month-in-year.use-cases.txt
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
cd month-in-year
