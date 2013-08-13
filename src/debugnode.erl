-module(debugnode).

-export([main/1, mytestfunc/1]).

main([TargetNodeName, TargetProcessName]) ->
  main(TargetNodeName, TargetProcessName).

main(TargetNodeName, TargetProcessName) ->
  case is_alive() of
    false ->
      io:format("Should be launched in node runtime system.~n"),
      exit(1);
    _ ->
      run({list_to_atom(TargetProcessName), list_to_atom(TargetNodeName ++ [$@|net_adm:localhost()])})
  end.

run(Debugger) ->
  %%TODO link processes
  spawn(remote_debugger_notifier, run, [Debugger]),
  spawn(remote_debugger_listener, run, [Debugger]).


%TODO remove this function (used it for tests only)
mytestfunc(_) ->
  io:format("one~n"),
  io:format("two~n"),
  io:format("three~n").