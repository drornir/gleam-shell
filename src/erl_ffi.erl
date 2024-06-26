-module(erl_ffi).

-export([runtime_bit_array/0, do_exec/4, do_test/0]).
% -export([do_test/0]).

do_test() -> {}.

do_exec(Cwd, Executable, Args, EnvList) ->
	% unix sockets -
	% AF_UNIX, AF_LOCAL from https://www.man7.org/linux/man-pages/man2/socket.2.html
	% https://www.erlang.org/doc/apps/kernel/socket.html#open/3
	%
	% bash / sh -
	% what if i just write a shell script that works on most modern unix systems?
	%
	% https://chatgpt.com/share/caf241ee-d7da-443f-98f5-17a0202e855c
	{ok, {0}}.

runtime_bit_array() ->
	<<"erlang"/utf8>>.

% -spec exec_erlang_ffi(string(), string(), [string()], [{string(), string()}]) ->
% 	{ok, string()} | {error, string()}.

% -spec do_exec(binary(), binary(), binary(),binary()) ->
% 	{ok, {binary(), binary(), binary(),binary()}}.


% exec_erlang_ffi() ->
% 	{ok, "was ok"}.
