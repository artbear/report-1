call clear.bat html md
scribble.exe --html  --dest html/ part1.scrbl part2.scrbl
scribble.exe --markdown  --dest md/ part1.scrbl part2.scrbl
start ./html/part2.html
