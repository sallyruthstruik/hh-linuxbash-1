#!/bin/bash
grep -r --ignore-case -E "error" -l | xargs du -h | tee out.txt
