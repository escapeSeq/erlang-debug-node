%TODO remove this module
-module(testmodule).

-include_lib("eunit/include/eunit.hrl").

-export([mytestfunc/1, print_args/1]).

print_args(Args) ->
  io:format("~p~n", [Args]).

mytestfunc(_) ->
  io:format("one~n"),
  io:format("two~n"),
  io:format("three~n"),
  boo(),
  io:format("boo").

boo() ->
  io:format("four~n"),
  io:format("five~n"),
  io:format("six~n"),
  foo(),
  io:format("foo").

foo() ->
  io:format("seven~n").

foo_test() ->
  io:format("in foo_test~n"),
  A = 42,
  B = 21,
  C = B * 2,
  ?assertEqual(A, C).
