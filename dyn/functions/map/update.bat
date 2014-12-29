copy ..\..\..\style\base.css .
saxon dyn.map.xml ../../../style/function.xsl
wzzip -P -o dyn.map.zip @dyn.map.package.txt
wzzip -P -o dyn.map.use-cases.zip @dyn.map.use-cases.txt
cd ..
cd ..
saxon dyn.xml ../style/module.xsl
wzzip -P -o dyn.zip @dyn.package.txt
cd ..
saxon modules.xml style/package.xsl
wzzip -P -o all-exslt.zip @package.txt
saxon modules.xml style/xml-package.xsl
wzzip -P -o exslt.zip @xml-package.txt
cd dyn
cd functions
cd map
