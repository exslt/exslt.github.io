copy ..\style\base.css .
saxon math.xml ../style/module.xsl
cd functions
cd min
copy ..\..\..\style\base.css .
saxon math.min.xml ../../../style/function.xsl
wzzip -P -o math.min.zip @math.min.package.txt
wzzip -P -o math.min.use-cases.zip @math.min.use-cases.txt
cd ..
cd ..
cd functions
cd max
copy ..\..\..\style\base.css .
saxon math.max.xml ../../../style/function.xsl
wzzip -P -o math.max.zip @math.max.package.txt
wzzip -P -o math.max.use-cases.zip @math.max.use-cases.txt
cd ..
cd ..
cd functions
cd highest
copy ..\..\..\style\base.css .
saxon math.highest.xml ../../../style/function.xsl
wzzip -P -o math.highest.zip @math.highest.package.txt
wzzip -P -o math.highest.use-cases.zip @math.highest.use-cases.txt
cd ..
cd ..
cd functions
cd lowest
copy ..\..\..\style\base.css .
saxon math.lowest.xml ../../../style/function.xsl
wzzip -P -o math.lowest.zip @math.lowest.package.txt
wzzip -P -o math.lowest.use-cases.zip @math.lowest.use-cases.txt
cd ..
cd ..
cd functions
cd abs
copy ..\..\..\style\base.css .
saxon math.abs.xml ../../../style/function.xsl
wzzip -P -o math.abs.zip @math.abs.package.txt
wzzip -P -o math.abs.use-cases.zip @math.abs.use-cases.txt
cd ..
cd ..
cd functions
cd sqrt
copy ..\..\..\style\base.css .
saxon math.sqrt.xml ../../../style/function.xsl
wzzip -P -o math.sqrt.zip @math.sqrt.package.txt
wzzip -P -o math.sqrt.use-cases.zip @math.sqrt.use-cases.txt
cd ..
cd ..
cd functions
cd power
copy ..\..\..\style\base.css .
saxon math.power.xml ../../../style/function.xsl
wzzip -P -o math.power.zip @math.power.package.txt
wzzip -P -o math.power.use-cases.zip @math.power.use-cases.txt
cd ..
cd ..
cd functions
cd constant
copy ..\..\..\style\base.css .
saxon math.constant.xml ../../../style/function.xsl
wzzip -P -o math.constant.zip @math.constant.package.txt
wzzip -P -o math.constant.use-cases.zip @math.constant.use-cases.txt
cd ..
cd ..
cd functions
cd log
copy ..\..\..\style\base.css .
saxon math.log.xml ../../../style/function.xsl
wzzip -P -o math.log.zip @math.log.package.txt
wzzip -P -o math.log.use-cases.zip @math.log.use-cases.txt
cd ..
cd ..
cd functions
cd random
copy ..\..\..\style\base.css .
saxon math.random.xml ../../../style/function.xsl
wzzip -P -o math.random.zip @math.random.package.txt
wzzip -P -o math.random.use-cases.zip @math.random.use-cases.txt
cd ..
cd ..
cd functions
cd sin
copy ..\..\..\style\base.css .
saxon math.sin.xml ../../../style/function.xsl
wzzip -P -o math.sin.zip @math.sin.package.txt
wzzip -P -o math.sin.use-cases.zip @math.sin.use-cases.txt
cd ..
cd ..
cd functions
cd cos
copy ..\..\..\style\base.css .
saxon math.cos.xml ../../../style/function.xsl
wzzip -P -o math.cos.zip @math.cos.package.txt
wzzip -P -o math.cos.use-cases.zip @math.cos.use-cases.txt
cd ..
cd ..
cd functions
cd tan
copy ..\..\..\style\base.css .
saxon math.tan.xml ../../../style/function.xsl
wzzip -P -o math.tan.zip @math.tan.package.txt
wzzip -P -o math.tan.use-cases.zip @math.tan.use-cases.txt
cd ..
cd ..
cd functions
cd asin
copy ..\..\..\style\base.css .
saxon math.asin.xml ../../../style/function.xsl
wzzip -P -o math.asin.zip @math.asin.package.txt
wzzip -P -o math.asin.use-cases.zip @math.asin.use-cases.txt
cd ..
cd ..
cd functions
cd acos
copy ..\..\..\style\base.css .
saxon math.acos.xml ../../../style/function.xsl
wzzip -P -o math.acos.zip @math.acos.package.txt
wzzip -P -o math.acos.use-cases.zip @math.acos.use-cases.txt
cd ..
cd ..
cd functions
cd atan
copy ..\..\..\style\base.css .
saxon math.atan.xml ../../../style/function.xsl
wzzip -P -o math.atan.zip @math.atan.package.txt
wzzip -P -o math.atan.use-cases.zip @math.atan.use-cases.txt
cd ..
cd ..
cd functions
cd atan2
copy ..\..\..\style\base.css .
saxon math.atan2.xml ../../../style/function.xsl
wzzip -P -o math.atan2.zip @math.atan2.package.txt
wzzip -P -o math.atan2.use-cases.zip @math.atan2.use-cases.txt
cd ..
cd ..
cd functions
cd exp
copy ..\..\..\style\base.css .
saxon math.exp.xml ../../../style/function.xsl
wzzip -P -o math.exp.zip @math.exp.package.txt
wzzip -P -o math.exp.use-cases.zip @math.exp.use-cases.txt
cd ..
cd ..
wzzip -P -o math.zip @math.package.txt
cd ..
saxon modules.xml style/home.xsl
saxon modules.xml style/package.xsl
wzzip -P -o all-exslt.zip @package.txt
saxon modules.xml style/xml-package.xsl
wzzip -P -o exslt.zip @xml-package.txt
cd math
