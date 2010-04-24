% properties
meal(cucumber_salad).
serves(cucumber_salad, 1).
difficulty(cucumber_salad, 1).

tag(X, vegetarian) :- tag(X, vegan).
% tag(recipe, keyword).
tag(cucumber_salad, vegan).
tag(cucumber_salad, vegetarian).
tag(cucumber_salad, salad).

% ingredient(recipe, ingredient, [unit, quantity]).
ingredient(cucumber_salad, cucumber, [unit, 0.333]).
ingredient(cucumber_salad, salt, [teaspoon, 0.5]).
ingredient(cucumber_salad, pepper, [teaspoon, 0.5]).
ingredient(cucumber_salad, seasoned_rice_vinegar, [tablespoon, 1]).

% step(recipe, output, [requirements], [[utensils]], [duration, quantity]).
step(cucumber_salad, peeled_cucumber, [cucumber], [[vegetable_peeler]], [minutes, 1]).
step(cucumber_salad, sliced_cucumber, [peeled_cucumber], [[knife]], [minutes, 1]).
step(cucumber_salad, pressed_cucumber, [sliced_cucumber, salt], [[plate]], [minutes, 30]).
step(cucumber_salad, sieved_cucumber, [pressed_cucumber, water], [[sieve, towel]], [minutes, 1]).
step(cucumber_salad, cucumber_salad, [sieved_cucumber, seasoned_rice_vinegar, salt, pepper], [], [minutes, 1]).

% instructions(language, country, ingredient, text).
instructions(en, _, peeled_cucumber, 'Peel the cucumber.').
instructions(en, _, sliced_cucumber, 'Slice it into thin chunks, and put the slices onto a plate.').
instructions(en, _, pressed_cucumber, 'Next, sprinkle salt over the slices and weigh another plate down on top of them, and leave for 30 minutes.').
instructions(en, _, sieved_cucumber, 'Once ready, remove the slices and give them a sieve, and dry them out with a towel.').
instructions(en, _, cucumber_salad, 'Finally, pour the rice vinegar over the top, and add the salt and papper.').

% title(language, country, ingredient, text).
title(en, _, cucumber_salad, 'Healthy Cucumber Salad').

% extra(recipe, extra).
extra(cucumber_salad, cottage_cheese).
extra(cucumber_salad, tuna).
extra(cucumber_salad, salmon).

% reusable(recipe, output, [lifetime, quantity]).
reusable(cucumber_salad, sliced_cucumber, [days, 2]).
reusable(cucumber_salad, cucumber_salad, [days, 2]).
