saxon func.function.xml ../../style/element.xsl
saxon func.function.xml ../../style/extension.package.xsl
saxon func.function.xml ../../style/extension.use-cases.xsl
wzzip -o func.function.zip @func.function.package.txt
wzzip -o func.function.use-cases.zip @func.function.use-cases.txt
cd ..
saxon func.xml ../style/module.xsl
saxon func.xml ../style/module.stylesheet.xsl
saxon func.xml ../style/module.package.xsl
wzzip -o func.zip @func.package.txt
cd ..
saxon modules.xml style/package.xsl
wzzip -P -o all-exslt.zip @package.txt