copy ..\..\..\style\base.css .
saxon date.second-in-minute.xml ../../../style/function.xsl
wzzip -P -o date.second-in-minute.zip @date.second-in-minute.package.txt
wzzip -P -o date.second-in-minute.use-cases.zip @date.second-in-minute.use-cases.txt
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
cd second-in-minute
