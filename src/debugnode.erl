-module(debugnode).

-include("messages.hrl").

-record(st, {debugger}).

%% Main entry point
main(TargetNode, TargetProcessName) ->
  case is_alive() of
    false ->
      io:format("Should be launched in node runtime system.~n");
    _ ->
      run({list_to_atom(TargetProcessName), list_to_atom(TargetNode ++ [$@|net_adm:localhost()])})
  end.

run(Debugger) ->
  register(Debugger),
  main_loop(#st{debugger = Debugger}).

register(Debugger) ->
  Debugger ! #register{pid = self()}.

%%TODO spawn receiver process and sender process.

main_loop(State) ->
  erlang:error(not_implemented).
