#! /bin/sh
#
# get_pathway.sh
# Copyright (C) 2017 Vito Adrian Cantu <garbanyo@gmail.com>
#
# Distributed under terms of the GNU GLP license.
#

Result=`echo -n -e "$1\t"; curl "www.kegg.jp/dbget-bin/www_bget?bcel:$1" 2>> log  | tee html | grep -A1 Pathway | tail -n 1 | perl -lne "@f=split(/<\/?div>/,$_); print foreach @f;" | grep -v '<' | xargs -I{}  echo -n -e '"{}"'"\t"`
echo $Result | sed 's/\t$/\n/'
usleep 2000
