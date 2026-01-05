% Copyright (c) 2025 "the authors"
% 
% Permission is hereby granted, free of charge, to any person obtaining
% a copy of this software and associated documentation files (the
% "Software"), to deal in the Software without restriction, including
% without limitation the rights to use, copy, modify, merge, publish,
% distribute, sublicense, and/or sell copies of the Software, and to
% permit persons to whom the Software is furnished to do so, subject to
% the following conditions:
% 
% The above copyright notice and this permission notice shall be
% included in all copies or substantial portions of the Software.
% 
% THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND,
% EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF
% MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.
% IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY
% CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT,
% TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE
% SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.



% .hrl files are Erlang "header" files, that is files containing common
% definitions that are intended to be included by .erl files.



-module(fib).
-export([fibo/1, fibo2/1, fibo3/1, print_nfibos/2]).

%% print fibo arg. and result, with function as parameter

print_nfibos( N, FiboFunc) -> printfibos( N, FiboFunc, 0).

printfibos( 0, FiboFunc, N) ->  %% last recursion
   Res = FiboFunc(N),
   io:fwrite("~w ~w~n", [N, Res]) ;

printfibos( Iter, FiboFunc, N) when Iter > 0 -> 
   Res = FiboFunc(N),
   io:fwrite("~w ~w~n", [N, Res]),
   printfibos( Iter -1, FiboFunc, N +1).


fibo(0) -> 0 ;
fibo(1) -> 1 ;
fibo(N) when N > 0 -> fibo(N-1) + fibo(N-2) .



fibo2_tr( 0, Result, _Next) -> Result ;  %% last recursion output

fibo2_tr( Iter, Result, Next) when Iter > 0 -> fibo2_tr( Iter -1, Next, Result + Next) .

fibo2( N) -> fibo2_tr( N, 0, 1) .



fibo3(N) ->
    {Fib, _} = fibo3(N, {1, 1}, {0, 1}),
    Fib.

fibo3(0, _, Pair) -> Pair;
fibo3(N, {Fib1, Fib2}, Pair) when N rem 2 == 0 ->
    SquareFib1 = Fib1*Fib1,
    fibo3(N div 2, {2*Fib1*Fib2 - SquareFib1, SquareFib1 + Fib2*Fib2}, Pair);
fibo3(N, {FibA1, FibA2}=Pair, {FibB1, FibB2}) ->
    fibo3(N-1, Pair, {FibA1*FibB2 + FibB1*(FibA2 - FibA1), FibA1*FibB1 + FibA2*FibB2}).



