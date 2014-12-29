copy ..\style\base.css .
saxon regexp.xml ../style/module.xsl
cd functions
cd test
copy ..\..\..\style\base.css .
saxon regexp.test.xml ../../../style/function.xsl
wzzip -P -o regexp.test.zip @regexp.test.package.txt
wzzip -P -o regexp.test.use-cases.zip @regexp.test.use-cases.txt
cd ..
cd ..
cd functions
cd match
copy ..\..\..\style\base.css .
saxon regexp.match.xml ../../../style/function.xsl
wzzip -P -o regexp.match.zip @regexp.match.package.txt
wzzip -P -o regexp.match.use-cases.zip @regexp.match.use-cases.txt
cd ..
cd ..
cd functions
cd replace
copy ..\..\..\style\base.css .
saxon regexp.replace.xml ../../../style/function.xsl
wzzip -P -o regexp.replace.zip @regexp.replace.package.txt
wzzip -P -o regexp.replace.use-cases.zip @regexp.replace.use-cases.txt
cd ..
cd ..
wzzip -P -o regexp.zip @regexp.package.txt
cd ..
saxon modules.xml style/home.xsl
saxon modules.xml style/package.xsl
wzzip -P -o all-exslt.zip @package.txt
saxon modules.xml style/xml-package.xsl
wzzip -P -o exslt.zip @xml-package.txt
cd regexp
