% properties
serves(moroccan_spice_mix, 1).
difficulty(moroccan_spice_mix, 1).

% tag(recipe, keyword).
tag(moroccan_spice_mix, vegan).
tag(moroccan_spice_mix, vegetarian).
tag(moroccan_spice_mix, moroccan).

% ingredient(recipe, ingredient, [unit, quantity]).
ingredient(moroccan_spice_mix, cumin, [teaspoon, 2.5]).
ingredient(moroccan_spice_mix, coriander, [teaspoon, 2]).
ingredient(moroccan_spice_mix, turmeric, [teaspoon, 0.5]).
ingredient(moroccan_spice_mix, paprika, [teaspoon, 0.5]).

% step(recipe, output, [requirements], [[utensils]], [duration, quantity]).
step(moroccan_spice_mix, moroccan_spice_mix, [cumin, coriander, turmeric, paprika], [], [minutes, 1]).

% instructions(language, country, ingredient, text).
instructions(en, _, sliced_tomato, 'Mix the spices together, and, if keeping the mix for some time, seal in a jar.').

% title(language, country, ingredient, text).
title(en, _, moroccan_spice_mix, 'Tomato Salad').

% extra(recipe, extras).
extra(moroccan_spice_mix, diced_onion).

% reusable(recipe, output).
reusable(moroccan_spice_mix, moroccan_spice_mix, [months, 6]).
