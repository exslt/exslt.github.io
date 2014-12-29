copy ..\..\..\style\base.css .
saxon dyn.closure.xml ../../../style/function.xsl
wzzip -P -o dyn.closure.zip @dyn.closure.package.txt
wzzip -P -o dyn.closure.use-cases.zip @dyn.closure.use-cases.txt
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
cd closure
