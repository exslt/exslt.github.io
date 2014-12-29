copy ..\style\base.css .
saxon dyn.xml ../style/module.xsl
cd functions
cd evaluate
copy ..\..\..\style\base.css .
saxon dyn.evaluate.xml ../../../style/function.xsl
wzzip -P -o dyn.evaluate.zip @dyn.evaluate.package.txt
wzzip -P -o dyn.evaluate.use-cases.zip @dyn.evaluate.use-cases.txt
cd ..
cd ..
cd functions
cd min
copy ..\..\..\style\base.css .
saxon dyn.min.xml ../../../style/function.xsl
wzzip -P -o dyn.min.zip @dyn.min.package.txt
wzzip -P -o dyn.min.use-cases.zip @dyn.min.use-cases.txt
cd ..
cd ..
cd functions
cd max
copy ..\..\..\style\base.css .
saxon dyn.max.xml ../../../style/function.xsl
wzzip -P -o dyn.max.zip @dyn.max.package.txt
wzzip -P -o dyn.max.use-cases.zip @dyn.max.use-cases.txt
cd ..
cd ..
cd functions
cd sum
copy ..\..\..\style\base.css .
saxon dyn.sum.xml ../../../style/function.xsl
wzzip -P -o dyn.sum.zip @dyn.sum.package.txt
wzzip -P -o dyn.sum.use-cases.zip @dyn.sum.use-cases.txt
cd ..
cd ..
cd functions
cd map
copy ..\..\..\style\base.css .
saxon dyn.map.xml ../../../style/function.xsl
wzzip -P -o dyn.map.zip @dyn.map.package.txt
wzzip -P -o dyn.map.use-cases.zip @dyn.map.use-cases.txt
cd ..
cd ..
cd functions
cd closure
copy ..\..\..\style\base.css .
saxon dyn.closure.xml ../../../style/function.xsl
wzzip -P -o dyn.closure.zip @dyn.closure.package.txt
wzzip -P -o dyn.closure.use-cases.zip @dyn.closure.use-cases.txt
cd ..
cd ..
wzzip -P -o dyn.zip @dyn.package.txt
cd ..
saxon modules.xml style/home.xsl
saxon modules.xml style/package.xsl
wzzip -P -o all-exslt.zip @package.txt
saxon modules.xml style/xml-package.xsl
wzzip -P -o exslt.zip @xml-package.txt
cd dyn
