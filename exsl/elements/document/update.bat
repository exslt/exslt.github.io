copy ..\..\..\style\base.css .
saxon exsl.document.xml ../../../style/element.xsl
wzzip -P -o exsl.document.zip @exsl.document.package.txt
wzzip -P -o exsl.document.use-cases.zip @exsl.document.use-cases.txt
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
cd elements
cd document
