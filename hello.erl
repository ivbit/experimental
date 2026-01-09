%% -*- coding: utf-8 -*-
-module(hello).
-export([start/0]).



% To compile from Erlang shell:
% c(hello).
% hello:start().
% halt().

% To compile from OS shell:
% erlc hello.erl
% erl -noshell -s hello start -s init stop



start() ->
    io:format("Hello, World!~n"),
    io:format("~ts~n", [<<"Привет, Мир!"/utf8>>]).



