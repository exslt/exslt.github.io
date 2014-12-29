copy ..\..\..\style\base.css .
saxon dyn.max.xml ../../../style/function.xsl
wzzip -P -o dyn.max.zip @dyn.max.package.txt
wzzip -P -o dyn.max.use-cases.zip @dyn.max.use-cases.txt
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
cd max
