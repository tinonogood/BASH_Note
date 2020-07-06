## 2020/06/29

### Call sh script wherever it is

` mkdir foo`

` cd foo`

` echo "run bar" > bar.sh`

` chmod +x bar.sh`

` vim run.sh `

check [20200706_run.sh](./20200706_run.sh)

### press ctrl^c to show hello trap

Check [20200706_ctrl_c_trap.sh](./20200706_ctrl_c_trap.sh)

## 2020/06/15

### book.txt

搜尋 book 單字 (包括books book, books, ..)

` grep -n -v "[a-z]book" book.txt | grep -v "book[a-rt-z]" `

將 \n 換成 white space

`  awk 1 ORS=' ' book.txt `

### /etc/nsswitch.conf

不顯示 whiteline

` grep -v "^$" nsswitch.conf `

不顯示 comment (#)

`  grep -v '^\#' nsswitch.conf `

不顯示 white line  & comment^

` grep -v "^$\|^\#" nsswitch.conf `

### food.xml

搜尋 \<name> ... \</name>

` grep -P "<name>(.*)</name>" food.xml `

搜尋 \<description> ... \</description>

` sed -n "/<description>/,/<\/description>/p" food.xml `

` grep -P "<description>" -A 2 food.xml `

## 2020/06/08

### SED, AWK

#### 字串修改

echo /usr/lib/python/site-package/xxx-1.0/yyy.zz

/usr/lib/python/site-package/xxx-1.0/yyy

` echo /usr/lib/python/site-package/xxx-1.0/yyy.zz | sed 's/\(.*\)\.\(.*\)/\1/' `

/usr/lib/python/site-package/xxx-1

` echo /usr/lib/python/site-package/xxx-1.0/yyy.zz | sed -e 's/\(.*\)\.\(.*\)/\1/' -e 's/\(.*\)\.\(.*\)/\1/' `

usr/lib/python/site-package/xxx-1.0/yyy.zz

`echo /usr/lib/python/site-package/xxx-1.0/yyy.zz | sed 's/^\/\(.*\)/\1/' `

yyy.zz

` echo /usr/lib/python/site-package/xxx-1.0/yyy.zz | sed 's/\(.*\)\/\(.*\)/\2/ `

#### 檔案處理

license.csv

顯示 2~4 行

` sed -n '2,4p' license.csv `

顯示2, 4 行

` sed -n -e '2p' -e '4p' license.csv `

顯示 Joe Hwang ~ Kevin Lin 行

` sed -n '/Joe Hwang/,/Kevin Lin/p' license.csv `

顯示 Joe Hwang, Kevin Lin 行

` sed -n -e '/Joe Hwang/p' -e '/Kevin Lin/p' license.csv `

從頭顯示到 Tim Cheng 行

` sed -n '1,/Kevin Lin/p' license.csv `

求最後一欄位 總和跟平均

` awk -F ',' 'BEGIN{SUM=0} {SUM+=$3} END {print "Sum:" SUM ", Avg.:" SUM/NR}' license.csv `

## 2020/06/01

#### 尋找特定大小, 時間後用grep找特定字串

  `find ./ -wholename "*.log" -size -100k -exec grep -wn "error" {} +`

#### 給一MAC Address & 數量, 生成連續MAC

[20200608_MACIncrement](./20200608_MACIncrement.sh)
