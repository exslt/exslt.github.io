copy ..\style\base.css .
saxon str.xml ../style/module.xsl
cd functions
cd tokenize
copy ..\..\..\style\base.css .
saxon str.tokenize.xml ../../../style/function.xsl
wzzip -P -o str.tokenize.zip @str.tokenize.package.txt
wzzip -P -o str.tokenize.use-cases.zip @str.tokenize.use-cases.txt
cd ..
cd ..
cd functions
cd replace
copy ..\..\..\style\base.css .
saxon str.replace.xml ../../../style/function.xsl
wzzip -P -o str.replace.zip @str.replace.package.txt
wzzip -P -o str.replace.use-cases.zip @str.replace.use-cases.txt
cd ..
cd ..
cd functions
cd padding
copy ..\..\..\style\base.css .
saxon str.padding.xml ../../../style/function.xsl
wzzip -P -o str.padding.zip @str.padding.package.txt
wzzip -P -o str.padding.use-cases.zip @str.padding.use-cases.txt
cd ..
cd ..
cd functions
cd align
copy ..\..\..\style\base.css .
saxon str.align.xml ../../../style/function.xsl
wzzip -P -o str.align.zip @str.align.package.txt
wzzip -P -o str.align.use-cases.zip @str.align.use-cases.txt
cd ..
cd ..
cd functions
cd encode-uri
copy ..\..\..\style\base.css .
saxon str.encode-uri.xml ../../../style/function.xsl
wzzip -P -o str.encode-uri.zip @str.encode-uri.package.txt
wzzip -P -o str.encode-uri.use-cases.zip @str.encode-uri.use-cases.txt
cd ..
cd ..
cd functions
cd decode-uri
copy ..\..\..\style\base.css .
saxon str.decode-uri.xml ../../../style/function.xsl
wzzip -P -o str.decode-uri.zip @str.decode-uri.package.txt
wzzip -P -o str.decode-uri.use-cases.zip @str.decode-uri.use-cases.txt
cd ..
cd ..
cd functions
cd concat
copy ..\..\..\style\base.css .
saxon str.concat.xml ../../../style/function.xsl
wzzip -P -o str.concat.zip @str.concat.package.txt
wzzip -P -o str.concat.use-cases.zip @str.concat.use-cases.txt
cd ..
cd ..
cd functions
cd split
copy ..\..\..\style\base.css .
saxon str.split.xml ../../../style/function.xsl
wzzip -P -o str.split.zip @str.split.package.txt
wzzip -P -o str.split.use-cases.zip @str.split.use-cases.txt
cd ..
cd ..
wzzip -P -o str.zip @str.package.txt
cd ..
saxon modules.xml style/home.xsl
saxon modules.xml style/package.xsl
wzzip -P -o all-exslt.zip @package.txt
saxon modules.xml style/xml-package.xsl
wzzip -P -o exslt.zip @xml-package.txt
cd str
