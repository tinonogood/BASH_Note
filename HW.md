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
