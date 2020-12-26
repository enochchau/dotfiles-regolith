#!/bin/bash
# parses xrdb and writes those colors to colors.rasi for use in rofi themes
x=$(xrdb -query | grep "*color" | sed 's/*color//g' | sed 's/://g')

array=()
for w in $x; do
    array+=($w)
done

declare -A map

for ((i=0;i<${#array[@]};i+=2)); do
    map[${array[$i]}]=${array[$i+1]}
done

# for i in "${!map[@]}"; do
#     echo "key: $i"
#     echo "value: ${map[$i]}"
# done
color_s=(black red green yellow blue magenta cyan white black-alt red-alt green-alt yellow-alt blue-alt megenta-alt cyan-alt white-alt)
out=colors.rasi
echo "* {" > $out

for ((i=0;i<${#color_s[@]};i++)); do
    echo "  ${color_s[$i]}: ${map[$i]};" >> $out
done

echo "}" >> $out
