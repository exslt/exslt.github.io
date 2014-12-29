copy ..\..\..\style\base.css .
saxon dyn.evaluate.xml ../../../style/function.xsl
wzzip -P -o dyn.evaluate.zip @dyn.evaluate.package.txt
wzzip -P -o dyn.evaluate.use-cases.zip @dyn.evaluate.use-cases.txt
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
cd evaluate
