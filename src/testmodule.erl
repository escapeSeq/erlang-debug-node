%TODO remove this module
-module(testmodule).


-export([mytestfunc/1]).

mytestfunc(_) ->
  One = 1,
  io:format("one~n"),
  io:format("two~n"),
  io:format("three~n"),
  boo(),
  io:format("boo").

boo() ->
  Two = 2,
  io:format("four~n"),
  io:format("five~n"),
  io:format("six~n"),
  foo(),
  io:format("foo").

foo() ->
  Three = 3,
  io:format("seven~n").