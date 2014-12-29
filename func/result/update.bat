saxon func.result.xml ../../style/element.xsl
saxon func.result.xml ../../style/extension.package.xsl
saxon func.result.xml ../../style/extension.use-cases.xsl
wzzip -o func.result.zip @func.result.package.txt
wzzip -o func.result.use-cases.zip @func.result.use-cases.txt
cd ..
saxon func.xml ../style/module.xsl
saxon func.xml ../style/module.stylesheet.xsl
saxon func.xml ../style/module.package.xsl
wzzip -o func.zip @func.package.txt
cd ..
saxon modules.xml style/package.xsl
wzzip -P -o all-exslt.zip @package.txt