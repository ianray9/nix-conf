#!/bin/zsh
vm_stat | awk '
/Pages free/ { free=$3 }
/Pages active/ { active=$3 }
/Pages inactive/ { inactive=$3 }
/Pages speculative/ { speculative=$3 }
END {
  used=(active+inactive+speculative)*4096/1024/1024/1024
  printf "%.0fG", used
}'
