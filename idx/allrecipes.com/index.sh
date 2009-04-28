#!/bin/bash

http_proxy=http://localhost:8118/
HTTP_PROXY=$http_proxy
export http_proxy HTTP_PROXY

NUM_THREADS=10
NUM_RECIPES=500000

for ((batch = 500; batch < (NUM_RECIPES / NUM_THREADS) + 1; batch += 1));
do
	for ((thread = 1; thread < NUM_THREADS + 1; thread += 1))
	do
                let recipeID=$((((batch - 1) * NUM_THREADS) + thread));
		wget \
			http://allrecipes.com/Recipe-Tools/Print/Recipe.aspx?RecipeID=$((recipeID)) \
			--quiet \
			--user-agent="Mozilla/4.0 (compatible; MSIE 7.0; Windows NT 5.1)" \
			-O results/$((recipeID)).html &

		echo http://allrecipes.com/Recipe-Tools/Print/Recipe.aspx?RecipeID=$((recipeID))
	done;

	wait;
done;
