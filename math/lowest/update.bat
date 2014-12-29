saxon math.lowest.xml ../../style/function.xsl
saxon math.lowest.xml ../../style/function.stylesheet.xsl
saxon math.lowest.xml ../../style/extension.package.xsl
saxon math.lowest.xml ../../style/extension.use-cases.xsl
wzzip -o math.lowest.zip @math.lowest.package.txt
wzzip -o math.lowest.use-cases.zip @math.lowest.use-cases.txt
cd ..
saxon math.xml ../style/module.xsl
saxon math.xml ../style/module.stylesheet.xsl
saxon math.xml ../style/module.package.xsl
wzzip -o math.zip @math.package.txt
cd ..
saxon modules.xml style/package.xsl
wzzip -P -o all-exslt.zip @package.txt