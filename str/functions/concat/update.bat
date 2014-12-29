copy ..\..\..\style\base.css .
saxon str.concat.xml ../../../style/function.xsl
wzzip -P -o str.concat.zip @str.concat.package.txt
wzzip -P -o str.concat.use-cases.zip @str.concat.use-cases.txt
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
cd concat
