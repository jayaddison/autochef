% properties
meal(tomato_salad).
serves(tomato_salad, 1).
difficulty(tomato_salad, 1).

% tag(recipe, keyword).
tag(tomato_salad, vegan).
tag(tomato_salad, vegetarian).
tag(tomato_salad, salad).

% ingredient(recipe, ingredient, [unit, quantity]).
ingredient(tomato_salad, ripe_tomato, [unit, 3]).
ingredient(tomato_salad, olive_oil, [tablespoon, 2]).
ingredient(tomato_salad, salt, [teaspoon, 0.5]).
ingredient(tomato_salad, pepper, [teaspoon, 0.5]).
ingredient(tomato_salad, vinegar, [teaspoon, 2]).
ingredient(tomato_salad, fresh_parsley, [tablespoon, 1]).

% step(recipe, output, [requirements], [[utensils]], [duration, quantity]).
step(tomato_salad, sliced_tomato, [ripe_tomato], [[knife]], [minutes, 1]).
step(tomato_salad, seasoned_tomato, [sliced_tomato, salt, pepper, olive_oil], [], [minutes, 15]).
step(tomato_salad, tomato_salad, [seasoned_tomato, vinegar, fresh_parsley], [], [minutes, 1]).

% instructions(language, country, ingredient, text).
instructions(en, _, sliced_tomato, 'Slice the tomatoes finely, and place them in a dish or bowl.').
instructions(en, _, seasoned_tomato, 'Season the sliced tomatoes with salt and pepper, and dress with olive oil.  Leave aside for 15 minutes.').
instructions(en, _, tomato_salad, 'Take the seasoned tomatoes, and sprinkle them with the parsley and vinegar, and shake the resulting mix.').

% title(language, country, ingredient, text).
title(en, _, tomato_salad, 'Tomato Salad').

% extra(recipe, extras).
extra(tomato_salad, diced_onion).

% reusable(recipe, output).
reusable(tomato_salad, tomato_salad, [days, 2]).
