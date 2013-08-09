


% Messages which can be sent to remote debugger.
% Debugger implementation should handle all messages listed here.

-record(unknown_message, {msg}).
-record(register_listener, {pid}).