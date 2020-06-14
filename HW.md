## 2020/06/08

### SED, AWK

#### 字串修改

echo /usr/lib/python/site-package/xxx-1.0/yyy.zz

/usr/lib/python/site-package/xxx-1.0/yyy

/usr/lib/python/site-package/xxx-1

usr/lib/python/site-package/xxx-1.0/yyy.zz

yyy.zz

#### 檔案處理

license.csv

顯示 2~4 行

顯示2, 4 行

顯示 Joe Hwang ~ Kevin Lin 行

顯示 Joe Hwang, Kevin Lin 行

從頭顯示到 Tim Cheng 行

求最後一欄位 總和跟平均

## 2020/06/01

#### 尋找特定大小, 時間後用grep找特定字串

  `find ./ -wholename "*.log" -size -100k -exec grep -wn "error" {} +`

#### 給一MAC Address & 數量, 生成連續MAC

[20200608_MACIncrement](./20200608_MACIncrement.sh)
