url=$(./geekbench5 | grep "claim?key" -m 1 | sed -e 's/^[ \t]*//')
url_trim=$(echo $url | sed -e 's/claim.*//')

echo "key y" > key_presses.txt
echo exit >> key_presses.txt

echo $url
lynx -accept_all_cookies -cmd_script=key_presses.txt $url_trim | grep -e "Single-Core Score" -A 2 -B 1 -m 1

rm key_presses.txt
