:- use_module(library(http/thread_httpd)).
:- use_module(library(http/http_dispatch)).
:- use_module(library(http/http_parameters)).
:- use_module(library(http/http_json)).
:- use_module(library(http/json_convert)).
:- use_module(library(http/html_write)).

% Load all ingredients and recipes
:- multifile meal/1.
:- multifile product/1.
:- multifile recipe/3.

:- consult('ingredients/*').
:- consult('recipes/*').
:- consult('rules').

:- http_handler(possibilities(.), list_possibilities, []).
http:location(possibilities, root(possibilities), []).

:- http_handler(instructions(.), list_instructions, []).
http:location(instructions, root(instructions), []).

:- dynamic stocked/3.

% Recipe suggestions handler
list_possibilities(Request) :-
        http_parameters(Request, [], [form_data(Params)]),
        findall(_, (member(=(K,V), Params), assert(stocked(Request, K,V))), _),
        findall(R, (meal(R), available(Request, R)), Possibilities),

        reply_html_page(_, [ table([ \rows(Possibilities) ]) ]),
        retractall(stocked(Request, _, _)).

% Recipe instructions handler
list_instructions(Request) :-
        http_parameters(Request, [], [form_data(Params)]),
        findall(_, (member(=(K,V), Params), assert(stocked(Request, K,V))), _),
        http_parameters(Request, [recipe(Meal, [])]),

        recipe_prerequisites(Request, Meal, Prerequisites),
        prolog_to_json(Prerequisites, JSON),
        reply_json(json([prerequisites=JSON]), [content_type='text/plain']),
        retractall(stocked(Request, _, _)).

% Render each recipe inside an HTML table row
rows([]) --> [].
rows([H|T]) -->
	html(tr([td(H)])),
	rows(T).

% Start the server
:- http_server(http_dispatch, [port(3475)]).
