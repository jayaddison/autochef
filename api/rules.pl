%% Rules
% Ingredients are available if they're in stock, or all subingredients are available
available(Request, X) :-
        stocked(Request, X, _).
available(Request, X) :-
        recipe(X, Ingredients, _),
        findall(I, (member(I, Ingredients), available(Request, I)), Ingredients).

% Gather the prerequisite ingredients for a recipe
recipe_prerequisites(_, [], []).
recipe_prerequisites(Request, Recipe, Optimal) :-
        recipe(Recipe, Ingredients, _),
        prerequisite_ingredients(Request, Ingredients, Optimal).

% Prerequisite ingredient algorithm
%  - Use items in stock first
%  - If something isn't readily available but is a product, use it
%  - Otherwise recurse down to sub-ingredients
prerequisite_ingredients(_, [], []).
prerequisite_ingredients(Request, [H|T], [H|O]) :-
        stocked(Request, H, _),
        prerequisite_ingredients(Request, T, O).
prerequisite_ingredients(Request, [H|T], [H|O]) :-
        not(available(Request, H)),
        product(H),
        prerequisite_ingredients(Request, T, O).
prerequisite_ingredients(Request, [H|T], Combined) :-
        recipe(H, SubIngredients, _),
        prerequisite_ingredients(Request, SubIngredients, OptimalSubIngredients),
        prerequisite_ingredients(Request, T, OptimalT),
        append(OptimalSubIngredients, OptimalT, Combined),
        !.
