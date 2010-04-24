% properties
meal(tagliatelle_tomato_basil).
serves(tagliatelle_tomato_basil, 2).
difficulty(tagliatelle_tomato_basil, 2).

% tag(recipe, keyword).
tag(tagliatelle_tomato_basil, vegan).
tag(tagliatelle_tomato_basil, vegetarian).
tag(tagliatelle_tomato_basil, italian).

% ingredient(recipe, ingredient, [unit, quantity]).
ingredient(tagliatelle_tomato_basil, olive_oil, [tablespoon, 2]).
ingredient(tagliatelle_tomato_basil, cherry_tomato, [gram, 250]).
ingredient(tagliatelle_tomato_basil, garlic, [clove, 1]).
ingredient(tagliatelle_tomato_basil, tagliatelle, [gram, 250]).
ingredient(tagliatelle_tomato_basil, basil, [leaf, 6]).

% step(recipe, output, [requirements], [[utensils]], [duration, quantity]).
step(tagliatelle_tomato_basil, cherry_tomato_oil, [garlic_oil, cherry_tomato], [], [minutes, 3]).
step(tagliatelle_tomato_basil, cooked_cherry_tomato_oil, [cherry_tomato_oil], [], [minutes, 5]).
step(tagliatelle_tomato_basil, cherry_tomato_sauce, [cooked_cherry_tomato_oil, garlic], [], [minutes, 10]).
step(tagliatelle_tomato_basil, cooked_tagliatelle, [tagliatelle], [], [minutes, 8]).
step(tagliatelle_tomato_basil, tagliatelle_tomato_basil, [cherry_tomato_sauce, cooked_tagliatelle, basil, ground_pepper], [], [minutes, 1]).

% instructions(language, country, ingredient, text).
instructions(en, _, cherry_tomato_oil, '').
instructions(en, _, cooked_cherry_tomato_oil, '').
instructions(en, _, cherry_tomato_sauce, '').
instructions(en, _, cooked_tagliatelle, '').
instructions(en, _, tagliatelle_tomato_basil, '').

% title(language, country, ingredient, text).
title(en, _, cherry_tomato_sauce, 'Cherry Tomato Sauce').
title(en, _, cooked_tagliatelle, 'Fresh Tagliatelle').
title(en, _, tagliatelle_tomato_basil, 'Tagiatelle with Sweet Tomato and Basil Sauce').

% extra(recipe, extras).
extra(tagliatelle_tomato_basil, salt).
extra(tagliatelle_tomato_basil, sugar).

% reusable(recipe, output).
reusable(tagliatelle_tomato_basil, tagliatelle_tomato_basil, [days, 2]).
