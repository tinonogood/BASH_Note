## 2020/06/01

#### 尋找特定大小, 時間後用grep找特定字串

  `find ./ -wholename "*.log" -size -100k -exec grep -wn "error" {} +`

#### 給一MAC Address & 數量, 生成連續MAC

[20200608_MACIncrement](./20200608_MACIncrement.sh)
