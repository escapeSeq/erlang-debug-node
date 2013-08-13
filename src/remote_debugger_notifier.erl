-module(remote_debugger_notifier).

-include("process_names.hrl").
-include("remote_debugger_messages.hrl").

-export([run/1, breakpoint_reached/1]).

run(Debugger) ->
  register(?RDEBUG_NOTIFIER, self()),
  attach_process(),
  loop(Debugger).

loop(Debugger) ->
  receive
    MessageToSend ->
      Debugger ! MessageToSend
  end,
  loop(Debugger).

attach_process() ->
  int:auto_attach([break], {?MODULE, breakpoint_reached, []}).

breakpoint_reached(Pid) ->
  ?RDEBUG_NOTIFIER ! #breakpoint_reached{pid = Pid, snapshot = int:snapshot()}.