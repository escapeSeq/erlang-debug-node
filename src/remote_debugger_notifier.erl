-module(remote_debugger_notifier).

-include("process_names.hrl").
-include("remote_debugger_messages.hrl").

-export([run/1]).

run(Debugger) ->
  register(?RDEBUG_NOTIFIER, self()),
  loop(Debugger).

loop(Debugger) ->
  receive
    MessageToSend ->
      Debugger ! to_remote_message(MessageToSend)
  end,
  loop(Debugger).

to_remote_message(Message) ->
  #unknown_message{msg = Message}.