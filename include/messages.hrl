% this file contains all messages which are to be sent between debugger and debug node.


%%
%% Messages that are sent to debugger.
%%

% Sent upon debugger node start.
-record(register, {pid}).


%%
%% Messages that are received from debugger.
%%