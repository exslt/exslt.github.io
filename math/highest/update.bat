saxon math.highest.xml ../../style/function.xsl
saxon math.highest.xml ../../style/function.stylesheet.xsl
saxon math.highest.xml ../../style/extension.package.xsl
saxon math.highest.xml ../../style/extension.use-cases.xsl
wzzip -o math.highest.zip @math.highest.package.txt
wzzip -o math.highest.use-cases.zip @math.highest.use-cases.txt
cd ..
saxon math.xml ../style/module.xsl
saxon math.xml ../style/module.stylesheet.xsl
saxon math.xml ../style/module.package.xsl
wzzip -o math.zip @math.package.txt
cd ..
saxon modules.xml style/package.xsl
wzzip -P -o all-exslt.zip @package.txt