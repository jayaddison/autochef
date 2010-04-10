%% State
% Declare ingredients and recipes up-front
meal(spaghetti_bolognese).
meal(beef_stew).

product(tomato).
product(spaghetti).
product(minced_beef).
product(tomato_sauce).

% Define recipes & their dependencies
recipe(tomato_sauce, [tomato], 5).
recipe(browned_minced_beef, [minced_beef], 5).
recipe(bolognese_sauce, [browned_minced_beef, tomato_sauce], 15).
recipe(cooked_spaghetti, [spaghetti], 10).
recipe(spaghetti_bolognese, [bolognese_sauce, cooked_spaghetti], 0).
recipe(beef_stew, [minced_beef], 0).

:- dynamic stocked/3.

%% Rules
% Something is available if it is in stock, or all of it's ingredients are available
available(Request, X) :-
        stocked(Request, X, _).
available(Request, X) :-
        recipe(X, Ingredients, _),
        findall(I, (member(I, Ingredients), available(Request, I)), Ingredients).

% Gather an optimal recipe breakdown for a request
recipe_breakdown(_, [], []).
recipe_breakdown(Request, Recipe, Optimal) :-
        recipe(Recipe, Ingredients, _),
        optimal_ingredients(Request, Ingredients, Optimal).

% Optimal ingredient breakdown
%  - Prefer items in stock first
%  - If something isn't readily available but is a product, prefer that
%  - Otherwise recurse down to sub-ingredients
optimal_ingredients(_, [], []).
optimal_ingredients(Request, [H|T], [H|O]) :-
        stocked(Request, H, _),
        optimal_ingredients(Request, T, O).
optimal_ingredients(Request, [H|T], [H|O]) :-
        not(available(Request, H)),
        product(H),
        optimal_ingredients(Request, T, O).
optimal_ingredients(Request, [H|T], Combined) :-
        recipe(H, SubIngredients, _),
        optimal_ingredients(Request, SubIngredients, OptimalSubIngredients),
        optimal_ingredients(Request, T, OptimalT),
        append(OptimalSubIngredients, OptimalT, Combined),
        !.

%% Application
:- use_module(library(http/thread_httpd)).
:- use_module(library(http/http_dispatch)).
:- use_module(library(http/html_write)).
:- use_module(library(http/http_parameters)).

:- http_handler(possibilities(.), list_possibilities, []).
http:location(possibilities, root(possibilities), []).

:- http_handler(instructions(.), list_instructions, []).
http:location(instructions, root(instructions), []).

% Handler to find all available meals, and return them in an HTML response
list_possibilities(Request) :-
        http_parameters(Request, [], [form_data(Params)]),
        findall(_, (member(=(K,V), Params), assert(stocked(Request, K,V))), _),
        findall(R, (meal(R), available(Request, R)), Possibilities),
        reply_html_page(_, [ table([ \rows(Possibilities) ]) ]),
        retractall(stocked(Request, _, _)).

% Handler to display the instructions for how to prepare a meal
list_instructions(Request) :-
        http_parameters(Request, [recipe(Meal, [])]),
        http_parameters(Request, [], [form_data(Params)]),
        findall(_, (member(=(K,V), Params), assert(stocked(Request, K,V))), _),
        recipe_breakdown(Request, Meal, Optimal),
        reply_html_page(_, [ table([ \rows(Optimal) ]) ]),
        retractall(stocked(Request, _, _)).

% Render each recipe inside an HTML table row
rows([]) --> [].
rows([H|T]) -->
	html(tr([td(H)])),
	rows(T).

% Start the server
:- http_server(http_dispatch, [port(3475)]).
