grep -o -e "[[:alpha:]]*" | sort | uniq -c | sed -e "s/\b\s\b/,/g"
