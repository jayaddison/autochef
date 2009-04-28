psql autochef-idx -c "copy $1 (count, word) from STDIN with csv"
