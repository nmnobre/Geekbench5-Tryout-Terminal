url=$(./geekbench5 | grep "claim?key" -m 1 | sed -e 's/^[ \t]*//')
url_trim=$(echo $url | sed -e 's/claim.*//')

SC=$(curl -k $url_trim 2>&1 | grep -e "Single-Core Score" -B 1 -m 1 | sed -r 's/.*>([0-9]*)<.*/\1/' | head -n 1)
MC=$(curl -k $url_trim 2>&1 | grep -e "Multi-Core Score" -B 1 -m 1 | sed -r 's/.*>([0-9]*)<.*/\1/' | head -n 1)

echo $url
echo "Single-Core Score:" $SC
echo "Multi-Core Score:" $MC
