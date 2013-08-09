-module(remote_debugger_listener).

% receives commands from remote debugger

-export([run/1]).

-include("process_names.hrl").
-include("remote_debugger_messages.hrl").

run(Debugger) ->
  register(?RDEBUG_LISTENER, self()),
  Debugger ! #register_listener{pid = self()},
  loop().

loop() ->
  receive
    _ ->
      io:format("unknown message")
  end,
  loop().