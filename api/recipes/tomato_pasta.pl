% properties
meal(tomato_pasta).
serves(tomato_pasta, 2).
difficulty(tomato_pasta, 2).

% tag(recipe, keyword).
tag(tomato_pasta, vegan).
tag(tomato_pasta, vegetarian).
tag(tomato_pasta, italian).

% ingredient(recipe, ingredient, [unit, quantity]).
ingredient(tomato_pasta, olive_oil, [tablespoon, 2]).
ingredient(tomato_pasta, garlic, [clove, 1]).
ingredient(tomato_pasta, tomato, [tin, 1]).
ingredient(tomato_pasta, fresh_parsley, [tablespoon, 2]).

% step(recipe, output, [requirements], [[utensils]], [duration, quantity]).
step(tomato_pasta, garlic_oil, [olive_oil, garlic], [[frying_pan]], [minutes, 3]).
step(tomato_pasta, tomato_oil, [garlic_oil, tomato], [[wooden_spoon]], [minutes, 10]).
step(tomato_pasta, cooked_pasta, [pasta, water], [[colander]], [minutes, 15]).
step(tomato_pasta, tomato_pasta, [tomato_oil, cooked_pasta, parmesan], [], [minutes, 0]).

% instructions(language, country, ingredient, text).
instructions(en, _, garlic_oil, 'Peel and crush the garlic cloves, and heat the oil in a frying pan.  Once heated, add the garlic to the oil.').
instructions(en, _, tomato_oil, 'Pour the tomatoes into the garlic oil, and use a spoon or other utensil to break the tomatoes down into a sauce.  Leave to simmer for 10 minutes.').
instructions(en, _, cooked_pasta, 'Bring enough water to cover the pasta to the boil, and then gradually add in the pasta itself.  Keep on a low boil and taste after 10-15 minutes..').
instructions(en, _, tomato_pasta, 'Pour the pasta onto plates for serving, and then spoon the tomato sauce over the top.  Finally, add the grated cheese and/or pepper.').

% title(language, country, ingredient, text).
title(en, _, tomato_oil, 'Tomato Sauce').
title(en, _, cooked_pasta, 'Pasta').
title(en, _, tomato_pasta, 'Pasta with Tomato Sauce').

% extra(recipe, extras).
extra(tomato_pasta, grated_parmesan).
extra(tomato_pasta, pepper).

% reusable(recipe, output).
reusable(tomato_pasta, tomato_pasta, [months, 6]).
