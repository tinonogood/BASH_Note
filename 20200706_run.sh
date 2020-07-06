#!/bin/bash

# BASH_SOURCE[0] 等價於 BASH_SOURCE ,取得當前執行的 shell 檔案所在的路徑及檔名
# dirname  去除檔名中的非目錄部分
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"

source $DIR/bar.sh
