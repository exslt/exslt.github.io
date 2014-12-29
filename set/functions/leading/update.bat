copy ..\..\..\style\base.css .
saxon set.leading.xml ../../../style/function.xsl
wzzip -P -o set.leading.zip @set.leading.package.txt
wzzip -P -o set.leading.use-cases.zip @set.leading.use-cases.txt
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
cd leading
