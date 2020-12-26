#!/bin/sh
sed -i \
         -e 's/#1B1E2B/rgb(0%,0%,0%)/g' \
         -e 's/#ffffff/rgb(100%,100%,100%)/g' \
    -e 's/#292d3e/rgb(50%,0%,0%)/g' \
     -e 's/#ffcb6b/rgb(0%,50%,0%)/g' \
     -e 's/#292d3e/rgb(50%,0%,50%)/g' \
     -e 's/#ffffff/rgb(0%,0%,50%)/g' \
	"$@"
