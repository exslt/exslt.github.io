saxon math.max.xml ../../style/function.xsl
saxon math.max.xml ../../style/function.stylesheet.xsl
saxon math.max.xml ../../style/extension.package.xsl
saxon math.max.xml ../../style/extension.use-cases.xsl
wzzip -o math.max.zip @math.max.package.txt
wzzip -o math.max.use-cases.zip @math.max.use-cases.txt
cd ..
saxon math.xml ../style/module.xsl
saxon math.xml ../style/module.stylesheet.xsl
saxon math.xml ../style/module.package.xsl
wzzip -o math.zip @math.package.txt
cd ..
saxon modules.xml style/package.xsl
wzzip -P -o all-exslt.zip @package.txt