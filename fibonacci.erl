#! /usr/bin/escript
%% -*- erlang -*-
%%! -smp enable -sname fibonacci



main([String]) ->
    try
        N = list_to_integer(String),
        F = fib(N),
        io:format("fibonacci ~w = ~w~n", [N, F])
    catch
        _:_ -> usage()
    end;
main(_) -> usage().

usage() ->
    io:format("usage: ./fibonacci.erl integer~n"),
    halt(1).

fib(N) -> fib_iter(N, 0, 1).

fib_iter(0, Result, _Next) -> Result;
fib_iter(Iter, Result, Next) ->
fib_iter(Iter-1, Next, Result+Next).



