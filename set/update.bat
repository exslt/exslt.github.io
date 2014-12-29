copy ..\style\base.css .
saxon set.xml ../style/module.xsl
cd functions
cd difference
copy ..\..\..\style\base.css .
saxon set.difference.xml ../../../style/function.xsl
wzzip -P -o set.difference.zip @set.difference.package.txt
wzzip -P -o set.difference.use-cases.zip @set.difference.use-cases.txt
cd ..
cd ..
cd functions
cd intersection
copy ..\..\..\style\base.css .
saxon set.intersection.xml ../../../style/function.xsl
wzzip -P -o set.intersection.zip @set.intersection.package.txt
wzzip -P -o set.intersection.use-cases.zip @set.intersection.use-cases.txt
cd ..
cd ..
cd functions
cd distinct
copy ..\..\..\style\base.css .
saxon set.distinct.xml ../../../style/function.xsl
wzzip -P -o set.distinct.zip @set.distinct.package.txt
wzzip -P -o set.distinct.use-cases.zip @set.distinct.use-cases.txt
cd ..
cd ..
cd functions
cd has-same-node
copy ..\..\..\style\base.css .
saxon set.has-same-node.xml ../../../style/function.xsl
wzzip -P -o set.has-same-node.zip @set.has-same-node.package.txt
wzzip -P -o set.has-same-node.use-cases.zip @set.has-same-node.use-cases.txt
cd ..
cd ..
cd functions
cd leading
copy ..\..\..\style\base.css .
saxon set.leading.xml ../../../style/function.xsl
wzzip -P -o set.leading.zip @set.leading.package.txt
wzzip -P -o set.leading.use-cases.zip @set.leading.use-cases.txt
cd ..
cd ..
cd functions
cd trailing
copy ..\..\..\style\base.css .
saxon set.trailing.xml ../../../style/function.xsl
wzzip -P -o set.trailing.zip @set.trailing.package.txt
wzzip -P -o set.trailing.use-cases.zip @set.trailing.use-cases.txt
cd ..
cd ..
wzzip -P -o set.zip @set.package.txt
cd ..
saxon modules.xml style/home.xsl
saxon modules.xml style/package.xsl
wzzip -P -o all-exslt.zip @package.txt
saxon modules.xml style/xml-package.xsl
wzzip -P -o exslt.zip @xml-package.txt
cd set
