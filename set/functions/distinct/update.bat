copy ..\..\..\style\base.css .
saxon set.distinct.xml ../../../style/function.xsl
wzzip -P -o set.distinct.zip @set.distinct.package.txt
wzzip -P -o set.distinct.use-cases.zip @set.distinct.use-cases.txt
cd ..
cd ..
saxon set.xml ../style/module.xsl
wzzip -P -o set.zip @set.package.txt
cd ..
saxon modules.xml style/package.xsl
wzzip -P -o all-exslt.zip @package.txt
saxon modules.xml style/xml-package.xsl
wzzip -P -o exslt.zip @xml-package.txt
cd set
cd functions
cd distinct
