copy ..\..\..\style\base.css .
saxon date.hour-in-day.xml ../../../style/function.xsl
wzzip -P -o date.hour-in-day.zip @date.hour-in-day.package.txt
wzzip -P -o date.hour-in-day.use-cases.zip @date.hour-in-day.use-cases.txt
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
cd hour-in-day
