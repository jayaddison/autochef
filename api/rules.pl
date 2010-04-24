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

%- Service: User Recipe Options
% Output: Recipes
meals_possible(Request, Meals) :-
        findall(Meal, (meal(Meal), possible(Request, Meal)), Meals).

% Private: Determine if a user can make a given ingredient
possible(Request, Ingredient) :-
        stocked(Request, Ingredient, _).
possible(Request, Recipe) :-
        step(_, Recipe, Prerequisites, _, _),
        findall(Ingredient, (member(Ingredient, Prerequisites), possible(Request, Ingredient)), Prerequisites).

%- Service: User Recipe Display
% Output: Prerequisites, Steps
meal_display(Request, Meal, Prerequisites, Tree) :-
        meal(Meal),
        step(Meal, Meal, Ingredients, _, _),
        prerequisites(Request, Meal, Ingredients, Prerequisites, Tree).

% Private: Find the best choice of ingredients to prepare a recipe
prerequisites(_, _, [], [], []).
prerequisites(Request, Parent, [H|T], [H|P], [H|Tree]) :-
        stocked(Request, H, _),
        prerequisites(Request, Parent, T, P, Tree).
prerequisites(Request, Parent, [H|T], [H|P], [H|Tree]) :-
        product(H),
        not(possible(Request, H)),
        prerequisites(Request, Parent, T, P, Tree).
prerequisites(Request, Parent, [H|T], Concat, [Parent|[Trees]]) :-
        step(_, H, P, _, _),
        prerequisites(Request, H, P, LP, LT),
        prerequisites(Request, H, T, RP, RT),
        append(LP, RP, Concat),
        append(LT, RT, Trees),
        !.
