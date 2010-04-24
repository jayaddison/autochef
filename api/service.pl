% Import libraries
:- use_module(library(http/thread_httpd)).
:- use_module(library(http/http_dispatch)).
:- use_module(library(http/http_parameters)).
:- use_module(library(http/http_json)).
:- use_module(library(http/json_convert)).
:- use_module(library(http/html_write)).

% Up-front predicate declarations
:- multifile product/1.
:- multifile meal/1.
:- multifile serves/2.
:- multifile difficulty/2.
:- multifile tag/2.
:- multifile ingredient/3.
:- multifile step/5.
:- multifile instructions/4.
:- multifile title/4.
:- multifile extra/2.
:- multifile reusable/3.

:- dynamic stocked/3.

% Load rules database
:- consult('ingredients/*').
:- consult('nutrition/*').
:- consult('utensils/*').
:- consult('recipes/*').
:- consult('rules').

% Register HTTP endpoints
http:location(possibilities, root(possibilities), []).
http:location(instructions, root(instructions), []).

:- http_handler(possibilities(.), list_possibilities, []).
:- http_handler(instructions(.), list_instructions, []).

% Start the HTTP server
:- http_server(http_dispatch, [port(3475)]).

% Handle user recipe suggestion
list_possibilities(Request) :-
        http_parameters(Request, [], [form_data(Params)]),
        findall(_, (member(=(K,V), Params), assert(stocked(Request, K,V))), _),
        findall(R, (meal(R), available(Request, R)), Possibilities),

        reply_html_page(_, [ table([ \rows(Possibilities) ]) ]),
        retractall(stocked(Request, _, _)).

% Handle recipe instruction listings
list_instructions(Request) :-
        http_parameters(Request, [], [form_data(Params)]),
        findall(_, (member(=(K,V), Params), assert(stocked(Request, K,V))), _),
        http_parameters(Request, [recipe(Meal, [])]),

        recipe_prerequisites(Request, Meal, Prerequisites),
        prolog_to_json(Prerequisites, JSON),
        reply_json(json([prerequisites=JSON]), [content_type='text/plain']),
        retractall(stocked(Request, _, _)).

% Render a list as a set of HTML table rows
rows([]) --> [].
rows([H|T]) -->
	html(tr([td(H)])),
	rows(T).

:- assert(stocked(_, cucumber, 1)).
:- assert(stocked(_, salt, 1)).
:- assert(stocked(_, pepper, 1)).
:- assert(stocked(_, seasoned_rice_vinegar, 1)).
:- assert(stocked(_, water, 1)).
