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
saxon modules.xml style/home.xsl
saxon modules.xml style/package.xsl
wzzip -P -o all-exslt.zip @package.txt
saxon modules.xml style/xml-package.xsl
wzzip -P -o exslt.zip @xml-package.txt
cd date
