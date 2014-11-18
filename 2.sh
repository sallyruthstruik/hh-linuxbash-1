#!/bin/bash
find /proc | grep -P "/proc/\d\d\d\d\d/cmdline" | xargs grep -l -E "127.0.0.1" 2>/dev/null | awk -F'/' '{print $3}' | sort -r
