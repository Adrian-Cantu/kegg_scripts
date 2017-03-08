#! /bin/sh
#
# get_pathway.sh
# Copyright (C) 2017 Vito Adrian Cantu <garbanyo@gmail.com>
#
# Distributed under terms of the GNU GLP license.
#

Result=`curl "www.kegg.jp/dbget-bin/www_bget?bcel:$1" 2>> log  | tee html | perl -lne 'BEGIN{$p=0;} $p=1 if /NT seq/; $p=0 if /\/table>/ ; print if $p;' | tail -n+3 | sed "s#<.*>##gi" | sed 's/\s*$//g'   | sed '/^\s*$/d'`
echo ">$1"
echo $Result | sed 's/\s//g'
