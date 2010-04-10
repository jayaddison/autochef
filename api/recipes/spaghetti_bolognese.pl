recipe(tomato_sauce, [tomato], 5).
recipe(browned_minced_beef, [minced_beef], 5).
recipe(bolognese_sauce, [browned_minced_beef, tomato_sauce], 15).
recipe(cooked_spaghetti, [spaghetti], 10).
recipe(spaghetti_bolognese, [bolognese_sauce, cooked_spaghetti], 0).
meal(spaghetti_bolognese).
