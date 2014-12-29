copy ..\..\..\style\base.css .
saxon regexp.test.xml ../../../style/function.xsl
wzzip -P -o regexp.test.zip @regexp.test.package.txt
wzzip -P -o regexp.test.use-cases.zip @regexp.test.use-cases.txt
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
cd test
