#!/bin/bash

grep -Ei '^(.*a){3,}.*$' dictionary.txt > atLeast3.txt

grep -Ei '^([^e]*e[^e]+e[^e]+e[^e]*)$' dictionary.txt > exactly3.txt

grep -Ei 'ee' dictionary.txt | grep -Eio '.{3}$' | sort | uniq -c | sort -rn | head -n 3 > mostCommon.txt

