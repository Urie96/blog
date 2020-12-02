---
title: Shell
date: 2020-12-01T16:51:55+08:00
hero: /images/anonymous/3.svg
menu:
  sidebar:
    name: Shell
    parent: notes
    # weight: 10
---

### Echo

1. `echo $VAR` 命令会去除多余的空格，应该使用 `echo "$VAR"`

### Gzip Folder

Usage: `./gzip.sh public`
Source Code:

```bash
match="\.(html|js|css|svg)$"
size=10240

fileSize() {
    local file=$1
    ls -l $1 | awk '{print $5}'
}

shouldGzip() {
    local file=$1
    if [[ ! $file =~ $match ]]; then
        return 1
    fi
    if [ $(fileSize $file) -lt $size ]; then
        return 1
    fi
    return 0
}

gzipFile() {
    local file=$1
    gzip --best -c $file >"$file.gz"
    echo "$file.gz"
}

gzipfolder() {
    local thisDir=$1
    for i in $(ls $thisDir); do
        local abs="$thisDir/$i"
        if [ -f $abs ]; then
            if (shouldGzip $abs); then
                gzipFile $abs
            fi
        elif [ -d $abs ]; then
            gzipfolder $abs
        else
            echo "err: $abs"
        fi
    done
}

gzipfolder "$(pwd)/$1"
```
