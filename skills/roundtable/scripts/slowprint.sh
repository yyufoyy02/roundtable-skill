#!/bin/bash
# slowprint.sh — 从 stdin 逐字输出，营造打字机效果
# 用法：echo "text" | bash slowprint.sh [delay_seconds]
# 默认延迟：0.03秒/字符
# 用途：圆桌辩论成员发言时的打字机效果

delay="${1:-0.03}"

while IFS= read -r -n1 c; do
    printf '%s' "$c"
    sleep "$delay"
done
