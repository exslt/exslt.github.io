copy ..\style\base.css .
saxon exsl.xml ../style/module.xsl
cd functions
cd node-set
copy ..\..\..\style\base.css .
saxon exsl.node-set.xml ../../../style/function.xsl
wzzip -P -o exsl.node-set.zip @exsl.node-set.package.txt
wzzip -P -o exsl.node-set.use-cases.zip @exsl.node-set.use-cases.txt
cd ..
cd ..
cd functions
cd object-type
copy ..\..\..\style\base.css .
saxon exsl.object-type.xml ../../../style/function.xsl
wzzip -P -o exsl.object-type.zip @exsl.object-type.package.txt
wzzip -P -o exsl.object-type.use-cases.zip @exsl.object-type.use-cases.txt
cd ..
cd ..
cd elements
cd document
copy ..\..\..\style\base.css .
saxon exsl.document.xml ../../../style/element.xsl
wzzip -P -o exsl.document.zip @exsl.document.package.txt
wzzip -P -o exsl.document.use-cases.zip @exsl.document.use-cases.txt
cd ..
cd ..
wzzip -P -o exsl.zip @exsl.package.txt
cd ..
saxon modules.xml style/home.xsl
saxon modules.xml style/package.xsl
wzzip -P -o all-exslt.zip @package.txt
saxon modules.xml style/xml-package.xsl
wzzip -P -o exslt.zip @xml-package.txt
cd exsl
