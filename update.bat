cd exsl
copy ..\style\base.css .
saxon exsl.xml ../style/module.xsl
cd functions
cd node-set
copy ..\..\..\style\base.css .
saxon exsl.node-set.xml ../../../style/function.xsl
wzzip -P -o exsl.node-set.zip @exsl.node-set.package.txt
wzzip -P -o exsl.node-set.use-cases.zip @exsl.node-set.use-cases.txt
cd ..
cd ..
cd functions
cd object-type
copy ..\..\..\style\base.css .
saxon exsl.object-type.xml ../../../style/function.xsl
wzzip -P -o exsl.object-type.zip @exsl.object-type.package.txt
wzzip -P -o exsl.object-type.use-cases.zip @exsl.object-type.use-cases.txt
cd ..
cd ..
cd elements
cd document
copy ..\..\..\style\base.css .
saxon exsl.document.xml ../../../style/element.xsl
wzzip -P -o exsl.document.zip @exsl.document.package.txt
wzzip -P -o exsl.document.use-cases.zip @exsl.document.use-cases.txt
cd ..
cd ..
wzzip -P -o exsl.zip @exsl.package.txt
cd ..
cd math
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
cd set
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
cd func
copy ..\style\base.css .
saxon func.xml ../style/module.xsl
cd elements
cd function
copy ..\..\..\style\base.css .
saxon func.function.xml ../../../style/element.xsl
wzzip -P -o func.function.zip @func.function.package.txt
wzzip -P -o func.function.use-cases.zip @func.function.use-cases.txt
cd ..
cd ..
cd elements
cd result
copy ..\..\..\style\base.css .
saxon func.result.xml ../../../style/element.xsl
wzzip -P -o func.result.zip @func.result.package.txt
wzzip -P -o func.result.use-cases.zip @func.result.use-cases.txt
cd ..
cd ..
cd elements
cd script
copy ..\..\..\style\base.css .
saxon func.script.xml ../../../style/element.xsl
wzzip -P -o func.script.zip @func.script.package.txt
wzzip -P -o func.script.use-cases.zip @func.script.use-cases.txt
cd ..
cd ..
wzzip -P -o func.zip @func.package.txt
cd ..
cd date
copy ..\style\base.css .
saxon date.xml ../style/module.xsl
cd functions
cd format-date
copy ..\..\..\style\base.css .
saxon date.format-date.xml ../../../style/function.xsl
wzzip -P -o date.format-date.zip @date.format-date.package.txt
wzzip -P -o date.format-date.use-cases.zip @date.format-date.use-cases.txt
cd ..
cd ..
cd functions
cd parse-date
copy ..\..\..\style\base.css .
saxon date.parse-date.xml ../../../style/function.xsl
wzzip -P -o date.parse-date.zip @date.parse-date.package.txt
wzzip -P -o date.parse-date.use-cases.zip @date.parse-date.use-cases.txt
cd ..
cd ..
cd functions
cd date-time
copy ..\..\..\style\base.css .
saxon date.date-time.xml ../../../style/function.xsl
wzzip -P -o date.date-time.zip @date.date-time.package.txt
wzzip -P -o date.date-time.use-cases.zip @date.date-time.use-cases.txt
cd ..
cd ..
cd functions
cd date
copy ..\..\..\style\base.css .
saxon date.date.xml ../../../style/function.xsl
wzzip -P -o date.date.zip @date.date.package.txt
wzzip -P -o date.date.use-cases.zip @date.date.use-cases.txt
cd ..
cd ..
cd functions
cd time
copy ..\..\..\style\base.css .
saxon date.time.xml ../../../style/function.xsl
wzzip -P -o date.time.zip @date.time.package.txt
wzzip -P -o date.time.use-cases.zip @date.time.use-cases.txt
cd ..
cd ..
cd functions
cd year
copy ..\..\..\style\base.css .
saxon date.year.xml ../../../style/function.xsl
wzzip -P -o date.year.zip @date.year.package.txt
wzzip -P -o date.year.use-cases.zip @date.year.use-cases.txt
cd ..
cd ..
cd functions
cd leap-year
copy ..\..\..\style\base.css .
saxon date.leap-year.xml ../../../style/function.xsl
wzzip -P -o date.leap-year.zip @date.leap-year.package.txt
wzzip -P -o date.leap-year.use-cases.zip @date.leap-year.use-cases.txt
cd ..
cd ..
cd functions
cd month-in-year
copy ..\..\..\style\base.css .
saxon date.month-in-year.xml ../../../style/function.xsl
wzzip -P -o date.month-in-year.zip @date.month-in-year.package.txt
wzzip -P -o date.month-in-year.use-cases.zip @date.month-in-year.use-cases.txt
cd ..
cd ..
cd functions
cd month-name
copy ..\..\..\style\base.css .
saxon date.month-name.xml ../../../style/function.xsl
wzzip -P -o date.month-name.zip @date.month-name.package.txt
wzzip -P -o date.month-name.use-cases.zip @date.month-name.use-cases.txt
cd ..
cd ..
cd functions
cd month-abbreviation
copy ..\..\..\style\base.css .
saxon date.month-abbreviation.xml ../../../style/function.xsl
wzzip -P -o date.month-abbreviation.zip @date.month-abbreviation.package.txt
wzzip -P -o date.month-abbreviation.use-cases.zip @date.month-abbreviation.use-cases.txt
cd ..
cd ..
cd functions
cd week-in-year
copy ..\..\..\style\base.css .
saxon date.week-in-year.xml ../../../style/function.xsl
wzzip -P -o date.week-in-year.zip @date.week-in-year.package.txt
wzzip -P -o date.week-in-year.use-cases.zip @date.week-in-year.use-cases.txt
cd ..
cd ..
cd functions
cd week-in-month
copy ..\..\..\style\base.css .
saxon date.week-in-month.xml ../../../style/function.xsl
wzzip -P -o date.week-in-month.zip @date.week-in-month.package.txt
wzzip -P -o date.week-in-month.use-cases.zip @date.week-in-month.use-cases.txt
cd ..
cd ..
cd functions
cd day-in-year
copy ..\..\..\style\base.css .
saxon date.day-in-year.xml ../../../style/function.xsl
wzzip -P -o date.day-in-year.zip @date.day-in-year.package.txt
wzzip -P -o date.day-in-year.use-cases.zip @date.day-in-year.use-cases.txt
cd ..
cd ..
cd functions
cd day-in-month
copy ..\..\..\style\base.css .
saxon date.day-in-month.xml ../../../style/function.xsl
wzzip -P -o date.day-in-month.zip @date.day-in-month.package.txt
wzzip -P -o date.day-in-month.use-cases.zip @date.day-in-month.use-cases.txt
cd ..
cd ..
cd functions
cd day-of-week-in-month
copy ..\..\..\style\base.css .
saxon date.day-of-week-in-month.xml ../../../style/function.xsl
wzzip -P -o date.day-of-week-in-month.zip @date.day-of-week-in-month.package.txt
wzzip -P -o date.day-of-week-in-month.use-cases.zip @date.day-of-week-in-month.use-cases.txt
cd ..
cd ..
cd functions
cd day-in-week
copy ..\..\..\style\base.css .
saxon date.day-in-week.xml ../../../style/function.xsl
wzzip -P -o date.day-in-week.zip @date.day-in-week.package.txt
wzzip -P -o date.day-in-week.use-cases.zip @date.day-in-week.use-cases.txt
cd ..
cd ..
cd functions
cd day-name
copy ..\..\..\style\base.css .
saxon date.day-name.xml ../../../style/function.xsl
wzzip -P -o date.day-name.zip @date.day-name.package.txt
wzzip -P -o date.day-name.use-cases.zip @date.day-name.use-cases.txt
cd ..
cd ..
cd functions
cd day-abbreviation
copy ..\..\..\style\base.css .
saxon date.day-abbreviation.xml ../../../style/function.xsl
wzzip -P -o date.day-abbreviation.zip @date.day-abbreviation.package.txt
wzzip -P -o date.day-abbreviation.use-cases.zip @date.day-abbreviation.use-cases.txt
cd ..
cd ..
cd functions
cd hour-in-day
copy ..\..\..\style\base.css .
saxon date.hour-in-day.xml ../../../style/function.xsl
wzzip -P -o date.hour-in-day.zip @date.hour-in-day.package.txt
wzzip -P -o date.hour-in-day.use-cases.zip @date.hour-in-day.use-cases.txt
cd ..
cd ..
cd functions
cd minute-in-hour
copy ..\..\..\style\base.css .
saxon date.minute-in-hour.xml ../../../style/function.xsl
wzzip -P -o date.minute-in-hour.zip @date.minute-in-hour.package.txt
wzzip -P -o date.minute-in-hour.use-cases.zip @date.minute-in-hour.use-cases.txt
cd ..
cd ..
cd functions
cd second-in-minute
copy ..\..\..\style\base.css .
saxon date.second-in-minute.xml ../../../style/function.xsl
wzzip -P -o date.second-in-minute.zip @date.second-in-minute.package.txt
wzzip -P -o date.second-in-minute.use-cases.zip @date.second-in-minute.use-cases.txt
cd ..
cd ..
cd functions
cd difference
copy ..\..\..\style\base.css .
saxon date.difference.xml ../../../style/function.xsl
wzzip -P -o date.difference.zip @date.difference.package.txt
wzzip -P -o date.difference.use-cases.zip @date.difference.use-cases.txt
cd ..
cd ..
cd functions
cd add
copy ..\..\..\style\base.css .
saxon date.add.xml ../../../style/function.xsl
wzzip -P -o date.add.zip @date.add.package.txt
wzzip -P -o date.add.use-cases.zip @date.add.use-cases.txt
cd ..
cd ..
cd functions
cd add-duration
copy ..\..\..\style\base.css .
saxon date.add-duration.xml ../../../style/function.xsl
wzzip -P -o date.add-duration.zip @date.add-duration.package.txt
wzzip -P -o date.add-duration.use-cases.zip @date.add-duration.use-cases.txt
cd ..
cd ..
cd functions
cd sum
copy ..\..\..\style\base.css .
saxon date.sum.xml ../../../style/function.xsl
wzzip -P -o date.sum.zip @date.sum.package.txt
wzzip -P -o date.sum.use-cases.zip @date.sum.use-cases.txt
cd ..
cd ..
cd functions
cd seconds
copy ..\..\..\style\base.css .
saxon date.seconds.xml ../../../style/function.xsl
wzzip -P -o date.seconds.zip @date.seconds.package.txt
wzzip -P -o date.seconds.use-cases.zip @date.seconds.use-cases.txt
cd ..
cd ..
cd functions
cd duration
copy ..\..\..\style\base.css .
saxon date.duration.xml ../../../style/function.xsl
wzzip -P -o date.duration.zip @date.duration.package.txt
wzzip -P -o date.duration.use-cases.zip @date.duration.use-cases.txt
cd ..
cd ..
cd elements
cd date-format
copy ..\..\..\style\base.css .
saxon date.date-format.xml ../../../style/element.xsl
wzzip -P -o date.date-format.zip @date.date-format.package.txt
wzzip -P -o date.date-format.use-cases.zip @date.date-format.use-cases.txt
cd ..
cd ..
wzzip -P -o date.zip @date.package.txt
cd ..
cd str
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
cd regexp
copy ..\style\base.css .
saxon regexp.xml ../style/module.xsl
cd functions
cd test
copy ..\..\..\style\base.css .
saxon regexp.test.xml ../../../style/function.xsl
wzzip -P -o regexp.test.zip @regexp.test.package.txt
wzzip -P -o regexp.test.use-cases.zip @regexp.test.use-cases.txt
cd ..
cd ..
cd functions
cd match
copy ..\..\..\style\base.css .
saxon regexp.match.xml ../../../style/function.xsl
wzzip -P -o regexp.match.zip @regexp.match.package.txt
wzzip -P -o regexp.match.use-cases.zip @regexp.match.use-cases.txt
cd ..
cd ..
cd functions
cd replace
copy ..\..\..\style\base.css .
saxon regexp.replace.xml ../../../style/function.xsl
wzzip -P -o regexp.replace.zip @regexp.replace.package.txt
wzzip -P -o regexp.replace.use-cases.zip @regexp.replace.use-cases.txt
cd ..
cd ..
wzzip -P -o regexp.zip @regexp.package.txt
cd ..
cd dyn
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
cd random
copy ..\style\base.css .
saxon random.xml ../style/module.xsl
cd functions
cd random-sequence
copy ..\..\..\style\base.css .
saxon random.random-sequence.xml ../../../style/function.xsl
wzzip -P -o random.random-sequence.zip @random.random-sequence.package.txt
wzzip -P -o random.random-sequence.use-cases.zip @random.random-sequence.use-cases.txt
cd ..
cd ..
wzzip -P -o random.zip @random.package.txt
cd ..
saxon modules.xml style/package.xsl
wzzip -P -o all-exslt.zip @package.txt
saxon modules.xml style/xml-package.xsl
wzzip -P -o exslt.zip @xml-package.txt
