copy ..\..\..\style\base.css .
saxon exsl.object-type.xml ../../../style/function.xsl
wzzip -P -o exsl.object-type.zip @exsl.object-type.package.txt
wzzip -P -o exsl.object-type.use-cases.zip @exsl.object-type.use-cases.txt
cd ..
cd ..
saxon exsl.xml ../style/module.xsl
wzzip -P -o exsl.zip @exsl.package.txt
cd ..
saxon modules.xml style/package.xsl
wzzip -P -o all-exslt.zip @package.txt
saxon modules.xml style/xml-package.xsl
wzzip -P -o exslt.zip @xml-package.txt
cd exsl
cd functions
cd object-type
