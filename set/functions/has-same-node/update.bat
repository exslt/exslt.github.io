copy ..\..\..\style\base.css .
saxon set.has-same-node.xml ../../../style/function.xsl
wzzip -P -o set.has-same-node.zip @set.has-same-node.package.txt
wzzip -P -o set.has-same-node.use-cases.zip @set.has-same-node.use-cases.txt
cd ..
cd ..
saxon set.xml ../style/module.xsl
wzzip -P -o set.zip @set.package.txt
cd ..
saxon modules.xml style/package.xsl
wzzip -P -o all-exslt.zip @package.txt
saxon modules.xml style/xml-package.xsl
wzzip -P -o exslt.zip @xml-package.txt
cd set
cd functions
cd has-same-node
