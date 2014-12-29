saxon math.min.xml ../../style/function.xsl
saxon math.min.xml ../../style/function.stylesheet.xsl
saxon math.min.xml ../../style/extension.package.xsl
saxon math.min.xml ../../style/extension.use-cases.xsl
wzzip -o math.min.zip @math.min.package.txt
wzzip -o math.min.use-cases.zip @math.min.use-cases.txt
cd ..
saxon math.xml ../style/module.xsl
saxon math.xml ../style/module.stylesheet.xsl
saxon math.xml ../style/module.package.xsl
wzzip -o math.zip @math.package.txt
cd ..
saxon modules.xml style/package.xsl
wzzip -P -o all-exslt.zip @package.txt