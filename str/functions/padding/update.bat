copy ..\..\..\style\base.css .
saxon str.padding.xml ../../../style/function.xsl
wzzip -P -o str.padding.zip @str.padding.package.txt
wzzip -P -o str.padding.use-cases.zip @str.padding.use-cases.txt
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
cd padding
