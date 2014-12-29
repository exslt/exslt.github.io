copy ..\..\..\style\base.css .
saxon regexp.match.xml ../../../style/function.xsl
wzzip -P -o regexp.match.zip @regexp.match.package.txt
wzzip -P -o regexp.match.use-cases.zip @regexp.match.use-cases.txt
cd ..
cd ..
saxon regexp.xml ../style/module.xsl
wzzip -P -o regexp.zip @regexp.package.txt
cd ..
saxon modules.xml style/package.xsl
wzzip -P -o all-exslt.zip @package.txt
saxon modules.xml style/xml-package.xsl
wzzip -P -o exslt.zip @xml-package.txt
cd regexp
cd functions
cd match
