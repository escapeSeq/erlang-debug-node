% Messages which can be received from remote debugger.

-record(interpret_modules, {modules=[]}).
-record(run_debugger, {module, function, args = []}).
-record(set_breakpoint, {module, line}).
-record(remove_breakpoint, {module, line}).


% Messages which can be sent to remote debugger.
% Debugger implementation should handle all messages listed here.

-record(unknown_message, {msg}).
-record(register_listener, {pid}).
-record(interpret_modules_response, {statuses=[]}). % list of pairs {module_name, ok|{error, reason}}
-record(set_breakpoint_response, {module, line, status}). % status=ok|{error, reason}
-record(breakpoint_reached, {pid, snapshot}). % (see int:snapshot/0)