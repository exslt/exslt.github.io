copy ..\..\..\style\base.css .
saxon date.duration.xml ../../../style/function.xsl
wzzip -P -o date.duration.zip @date.duration.package.txt
wzzip -P -o date.duration.use-cases.zip @date.duration.use-cases.txt
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
cd duration
