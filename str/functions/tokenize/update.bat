copy ..\..\..\style\base.css .
saxon str.tokenize.xml ../../../style/function.xsl
wzzip -P -o str.tokenize.zip @str.tokenize.package.txt
wzzip -P -o str.tokenize.use-cases.zip @str.tokenize.use-cases.txt
cd ..
cd ..
saxon str.xml ../style/module.xsl
wzzip -P -o str.zip @str.package.txt
cd ..
saxon modules.xml style/package.xsl
wzzip -P -o all-exslt.zip @package.txt
saxon modules.xml style/xml-package.xsl
wzzip -P -o exslt.zip @xml-package.txt
cd str
cd functions
cd tokenize
