copy ..\..\..\style\base.css .
saxon exsl.node-set.xml ../../../style/function.xsl
wzzip -P -o exsl.node-set.zip @exsl.node-set.package.txt
wzzip -P -o exsl.node-set.use-cases.zip @exsl.node-set.use-cases.txt
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
cd node-set
