copy ..\..\..\style\base.css .
saxon str.encode-uri.xml ../../../style/function.xsl
wzzip -P -o str.encode-uri.zip @str.encode-uri.package.txt
wzzip -P -o str.encode-uri.use-cases.zip @str.encode-uri.use-cases.txt
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
cd encode-uri
