#!/bin/bash
set -e

perl mecab_extractor_better.pl $1
wait
cabocha -f1 -n1 -d /usr/lib/x86_64-linux-gnu/mecab/dic/mecab-ipadic-neologd $1 > 00_output.txt # this might only work on my computer oops
wait
#perl cabocha_extractor.pl output.txt
perl cabocha_extractor_upgraded.pl 00_output.txt
#rm output.txt # because actually i would like to preserve te output

# the following comments were added by gemini 2.5 flash but i thought they were hilarious
perl cleaner.pl 10_tokenNER.txt # Processes these specific files
perl cleaner.pl 10_tokenNER.txt # ...twice?
perl cleaner.pl 11_lemmaNER.txt
perl cleaner.pl 11_lemmaNER.txt


