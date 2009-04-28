xmlstarlet fo -H $1 | sed -e "s/ xmlns.*\"//g" | xmlstarlet sel -t -m /html/body/form/div[2]/div[2]/div/table/tr/td/table/tr/td/table[3]/tr/td/div -v . -n
